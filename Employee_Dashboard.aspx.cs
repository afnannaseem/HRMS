using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;

namespace ProjectCode
{
    public partial class WebForm1 : System.Web.UI.Page
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

            // Fetch employee details from the database
            FetchAndDisplayEmployeeDetails(employeeId);
        }

        // Web method to fetch attendance data for the logged-in employee
        [WebMethod]
        public static List<int> GetAttendanceData(string employeeId)
        {
            string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";
            string query = "SELECT COUNT(*) FROM Attendance WHERE EmployeeID = @EmployeeID AND Statuss = 'Present'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployeeID", employeeId);

                    int presentCount = (int)command.ExecuteScalar();

                    // Assuming you have additional data for the graph, adjust as needed
                    int totalDays = 20; // Replace with the actual total days
                    int absentCount = totalDays - presentCount;
                    int lateCount = 2; // Replace with the actual late count

                    return new List<int> { presentCount, absentCount, lateCount };
                }
            }
        }

        private void FetchAndDisplayEmployeeDetails(string employeeId)
        {
            // string connectionString = @"Data Source=DESKTOP-093PHRA\SQLEXPRESS;Initial Catalog=Human_Resource_Management_System;Integrated Security=True";
            string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";
            string query = "SELECT FirstName, LastName, Rolee, Email, PhoneNum, DateOfBirth, Addresss, Gender " +
                           "FROM Employee " +
                           "WHERE EmployeeID = @EmployeeID";

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
                            // Display employee details on the page
                            lblEmployeeName.Text = $"{reader["FirstName"]} {reader["LastName"]}";
                            lblRole.Text = reader["Rolee"].ToString();
                            lblEmail.Text = reader["Email"].ToString();
                            lblPhone.Text = reader["PhoneNum"].ToString();
                            lblDateOfBirth.Text = ((DateTime)reader["DateOfBirth"]).ToShortDateString();
                            lblAddress.Text = $"{reader["Addresss"]}";
                            lblGender.Text = reader["Gender"].ToString();
                        }
                    }
                }
            }
        }
    }
}