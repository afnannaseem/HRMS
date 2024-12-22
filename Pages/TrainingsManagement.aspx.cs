using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectCode.Pages
{
    public partial class TrainingsManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTrainingData();
            }
        }

        private void BindTrainingData()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = @"
                SELECT tp.TrainingProgramID, tp.EmployeeID, e.FirstName + ' ' + e.LastName AS EmployeeName, 
                       tp.TProgramName, tp.ProgramDate, pa.Rating
                FROM TrainingProgram tp
                INNER JOIN Employee e ON tp.EmployeeID = e.EmployeeID
                LEFT JOIN PerformanceAppraisal pa ON tp.TrainingProgramID = pa.TrainingProgramID";

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridViewTrainings.DataSource = dt;
                GridViewTrainings.DataBind();
            }
        }

        protected void AddTrainingButton_Click(object sender, EventArgs e)
        {
            string empId = EmployeeID.Text;
            string programName = ProgramName.Text;
            string programDate = ProgramDate.Text;
            string performanceRating = PerformanceRating.Text;

            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string checkEmployeeQuery = "SELECT COUNT(*) FROM Employee WHERE EmployeeID = @EmployeeID";
                SqlCommand checkCmd = new SqlCommand(checkEmployeeQuery, con);
                checkCmd.Parameters.AddWithValue("@EmployeeID", empId);

                int employeeExists = (int)checkCmd.ExecuteScalar();
                if (employeeExists > 0)
                {
                    string insertQuery = "INSERT INTO TrainingProgram (EmployeeID, TProgramName, ProgramDate) VALUES (@EmployeeID, @TProgramName, @ProgramDate); SELECT SCOPE_IDENTITY();";
                    SqlCommand cmd = new SqlCommand(insertQuery, con);
                    cmd.Parameters.AddWithValue("@EmployeeID", empId);
                    cmd.Parameters.AddWithValue("@TProgramName", programName);
                    cmd.Parameters.AddWithValue("@ProgramDate", programDate);

                    int trainingProgramId = Convert.ToInt32(cmd.ExecuteScalar());

                    if (!string.IsNullOrEmpty(performanceRating))
                    {
                        string insertRatingQuery = "INSERT INTO PerformanceAppraisal (Rating, EmployeeID, TrainingProgramID) VALUES (@Rating, @EmployeeID, @TrainingProgramID)";
                        SqlCommand ratingCmd = new SqlCommand(insertRatingQuery, con);
                        ratingCmd.Parameters.AddWithValue("@Rating", performanceRating);
                        ratingCmd.Parameters.AddWithValue("@EmployeeID", empId);
                        ratingCmd.Parameters.AddWithValue("@TrainingProgramID", trainingProgramId);
                        ratingCmd.ExecuteNonQuery();
                    }

                    lblTrainingErrorMessage.Text = "Training record added successfully.";
                    lblTrainingErrorMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblTrainingErrorMessage.Text = "Employee not found.";
                    lblTrainingErrorMessage.ForeColor = System.Drawing.Color.Red;
                }

                lblTrainingErrorMessage.Visible = true;
                BindTrainingData();
            }
        }
        protected void GridViewTrainings_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewTrainings.EditIndex = e.NewEditIndex;
            BindTrainingData();
        }

        protected void GridViewTrainings_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewTrainings.EditIndex = -1;
            BindTrainingData();
        }

        protected void GridViewTrainings_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int trainingProgramId = Convert.ToInt32(GridViewTrainings.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridViewTrainings.Rows[e.RowIndex];

            string programName = (row.FindControl("txtTProgramName") as TextBox).Text;
            string programDate = (row.FindControl("txtProgramDate") as TextBox).Text;
            string rating = (row.FindControl("txtRating") as TextBox).Text;

            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string updateQuery = "UPDATE TrainingProgram SET TProgramName = @TProgramName, ProgramDate = @ProgramDate WHERE TrainingProgramID = @TrainingProgramID";
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@TrainingProgramID", trainingProgramId);
                cmd.Parameters.AddWithValue("@TProgramName", programName);
                cmd.Parameters.AddWithValue("@ProgramDate", Convert.ToDateTime(programDate));
                cmd.ExecuteNonQuery();

                if (!string.IsNullOrEmpty(rating))
                {
                    string updateRatingQuery = "UPDATE PerformanceAppraisal SET Rating = @Rating WHERE TrainingProgramID = @TrainingProgramID";
                    SqlCommand ratingCmd = new SqlCommand(updateRatingQuery, con);
                    ratingCmd.Parameters.AddWithValue("@Rating", Convert.ToInt32(rating));
                    ratingCmd.Parameters.AddWithValue("@TrainingProgramID", trainingProgramId);
                    ratingCmd.ExecuteNonQuery();
                }
            }

            GridViewTrainings.EditIndex = -1;
            BindTrainingData();
        }


        protected void GridViewTrainings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int trainingProgramId = Convert.ToInt32(GridViewTrainings.DataKeys[e.RowIndex].Value);

            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // First, delete related records in PerformanceAppraisal
                string deleteAppraisalQuery = "DELETE FROM PerformanceAppraisal WHERE TrainingProgramID = @TrainingProgramID";
                SqlCommand appraisalCmd = new SqlCommand(deleteAppraisalQuery, con);
                appraisalCmd.Parameters.AddWithValue("@TrainingProgramID", trainingProgramId);
                appraisalCmd.ExecuteNonQuery();

                // Then, delete the TrainingProgram record
                string deleteTrainingQuery = "DELETE FROM TrainingProgram WHERE TrainingProgramID = @TrainingProgramID";
                SqlCommand trainingCmd = new SqlCommand(deleteTrainingQuery, con);
                trainingCmd.Parameters.AddWithValue("@TrainingProgramID", trainingProgramId);
                trainingCmd.ExecuteNonQuery();
            }

            BindTrainingData();
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
