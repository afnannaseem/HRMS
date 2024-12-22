using System;
using System.Data.SqlClient;

namespace ProjectCode
{
    public partial class Retirement_Onborads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                FetchAndDisplayRetirementDetails(employeeId);
            }
        }

        private void FetchAndDisplayRetirementDetails(string employeeId)
        {
            //string connectionString = @"Data Source=DESKTOP-093PHRA\SQLEXPRESS;Initial Catalog=Human_Resource_Management_System;Integrated Security=True";
            string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";

            string query = "SELECT RetirementDate, KnowledgeTransfer FROM RetirementRecord WHERE EmployeeID = @EmployeeID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployeeID", employeeId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Display retirement details on the page
                            lblRetirementDate.Text = ((DateTime)reader["RetirementDate"]).ToShortDateString();
                            lblKnowledgeTransfer.Text = reader["KnowledgeTransfer"].ToString();
                        }
                        else
                        {
                            // Handle the case where no retirement record is found
                            lblRetirementDate.Text = "N/A";
                            lblKnowledgeTransfer.Text = "No knowledge transfer details available.";
                        }
                    }
                }
            }
        }
    }
}