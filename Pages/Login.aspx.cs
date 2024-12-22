using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ProjectCode.Pages
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=AFNAN\\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True"; // Replace with your database connection string
            string email = emailTextBox.Text;
            string password = passwordTextBox.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Check if an admin with the provided email and password exists in the database
                string query = "SELECT AdminID FROM Adminn WHERE Email = @Email AND Passwordd = @Password";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Password", password);

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    // Admin found, redirect to AdminHome.aspx
                    Response.Redirect("AdminHome.aspx");
                }
                else
                {
                    // Admin not found, display an error message
                    errorMessageLabel.Text = "Admin not found. Please check your email and password.";
                }

                reader.Close();
            }
        }
    }
}
