using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Policy;
using System.Xml.Linq;
using System.Web.UI;
using System;

namespace ProjectCode
{
    public partial class Edit_Profile : System.Web.UI.Page
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

            //int userId = 2; // Replace with the actual user ID
            PopulateFormData(employeeId);
        }

        private void PopulateFormData(string userId)
        {
            // Connect to the database and fetch user data based on userId
            //string connectionString = "Your_Connection_String"; // Replace with your database connection string
            //string connectionString = @"Data Source=DESKTOP-093PHRA\SQLEXPRESS;Initial Catalog=Human_Resource_Management_System;Integrated Security=True";
            string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT FirstName, LastName, Email, PhoneNum FROM Employee WHERE EmployeeID = @userId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@userId", userId);
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        first_name.Value = reader["FirstName"].ToString();
                        last_name.Value = reader["LastName"].ToString();
                        email.Value = reader["Email"].ToString();
                        phone.Value = reader["PhoneNum"].ToString();
                    }
                }
            }
        }

        protected void SaveChanges_Click(object sender, EventArgs e)
        {
            string employeeId = Session["UserID"].ToString();
            UpdateUserData(employeeId);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('User updated successfully.');", true);
        }

        private void UpdateUserData(string userId)
        {
            // Connect to the database and update user data based on userId
            //string connectionString = "Your_Connection_String"; // Replace with your database connection string
            //string connectionString = @"Data Source=DESKTOP-093PHRA\SQLEXPRESS;Initial Catalog=Human_Resource_Management_System;Integrated Security=True";
            string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "UPDATE Employee SET FirstName = @FirstName, LastName = @LastName, Email = @Email, PhoneNum = @PhoneNum WHERE EmployeeID = @UserId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FirstName", first_name.Value);
                    command.Parameters.AddWithValue("@LastName", last_name.Value);
                    command.Parameters.AddWithValue("@Email", email.Value);
                    command.Parameters.AddWithValue("@PhoneNum", phone.Value);
                    command.Parameters.AddWithValue("@UserId", userId);
                    command.ExecuteNonQuery();
                }
            }
        }

    }
}