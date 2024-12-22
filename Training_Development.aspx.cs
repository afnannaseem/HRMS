using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace ProjectCode
{
    public partial class Training_Development : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["UserID"] == null)
            {
                // If not logged in, redirect to the login page
                Response.Redirect("LogIn.aspx");
            }

            // Get the logged-in employee's ID from the session
            string employeeId = Session["UserID"].ToString();

            // Fetch and display retirement details for the logged-in employee
            BindTrainingProgramData(employeeId);
        }

        private void BindTrainingProgramData(string employeeid)
        {
            try
            {
                //string connectionString = @"Data Source=ReleaseSQLServer;Initial Catalog=Human_Resource_Management_System;Integrated Security=True";
                // string connectionString = @"Data Source=DESKTOP-093PHRA\SQLEXPRESS;Initial Catalog=Human_Resource_Management_System;Integrated Security=True";
                string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT TProgramName,ProgramDate FROM TrainingProgram where EmployeeID = @EmployeeID", con);

                    cmd.Parameters.AddWithValue("@EmployeeID", employeeid);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        GridViewTrainingProgram.DataSource = dt;
                        GridViewTrainingProgram.DataBind();
                    }
                    else
                    {
                        ShowMessage("No records found.");
                    }
                }
            }
            catch (Exception ex)
            {
                LogException(ex);
                ShowErrorMessage("An error occurred while fetching attendance data. Please try again later.");
            }
        }

        private void ShowMessage(string message)
        {
            lblMessage.Text = message;
        }

        private void ShowErrorMessage(string message)
        {
            lblErrorMessage.Text = message;
        }

        private void LogException(Exception ex)
        {
            Console.WriteLine($"Exception: {ex.ToString()}");
        }
    }
}