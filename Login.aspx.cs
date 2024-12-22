using System.Data.SqlClient;
using System;
using System;
using System.Data.SqlClient;
using System.Web;

namespace ProjectCode
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string employeeId = txtEmployeeID.Text.Trim();

            if (IsValidUser(email, employeeId))
            {
                // Get the user's name
                string userName = GetUserName(email);

                // Set user information in the session
                Session["UserID"] = employeeId;
                Session["UserName"] = userName;

                // Redirect to Employee Dashboard
                Response.Redirect("Employee_Dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Employee credentials. Please try again.";
            }
        }

        private bool IsValidUser(string email, string employeeId)
        {
            //string connectionString = @"Data Source=DESKTOP-093PHRA\SQLEXPRESS;Initial Catalog=Human_Resource_Management_System;Integrated Security=True";
            string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";


            string query = "SELECT COUNT(*) FROM Employee WHERE Email = @Email AND EmployeeID = @EmployeeID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@EmployeeID", employeeId);

                    int count = (int)command.ExecuteScalar();

                    return count > 0; // If count > 0, the user is valid
                }
            }
        }

        private string GetUserName(string email)
        {
            string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";
            string query = "SELECT FirstName + ' ' + LastName FROM Employee WHERE Email = @Email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    object result = command.ExecuteScalar();

                    // If the result is not null, return the user's name; otherwise, return an empty string
                    return result != null ? result.ToString() : string.Empty;
                }
            }
        }
    }
}