using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectCode.Pages
{
    public partial class AttendanceManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void FilterAttendanceButton_Click(object sender, EventArgs e)
        {
            string selectedDate = attendanceDate.Text;
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = @"
            SELECT e.EmployeeID, (e.FirstName + ' ' + e.LastName) AS EmployeeName, 
                   ISNULL(a.Statuss, 'No Record') AS Status
            FROM Employee e
            LEFT JOIN Attendance a ON e.EmployeeID = a.EmployeeID AND a.AttendanceDate = @SelectedDate";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@SelectedDate", selectedDate);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridViewAttendance.DataSource = dt;
                GridViewAttendance.DataBind();
            }
        }

        protected void btnAddRecord_Click(object sender, EventArgs e)
        {
            string empId = employeeID.Text;
            string date = attendanceDateInput.Text;
            string status = attendanceStatus.SelectedValue;
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                // Check if employee exists
                string checkEmployeeQuery = "SELECT COUNT(*) FROM Employee WHERE EmployeeID = @EmployeeID";
                SqlCommand checkCmd = new SqlCommand(checkEmployeeQuery, con);
                checkCmd.Parameters.AddWithValue("@EmployeeID", empId);

                int employeeExists = (int)checkCmd.ExecuteScalar();

                if (employeeExists > 0)
                {
                    // Employee exists, insert attendance record
                    string addAttendanceQuery = "INSERT INTO Attendance (AttendanceDate, Statuss, EmployeeID) VALUES (@AttendanceDate, @Statuss, @EmployeeID)";
                    SqlCommand cmd = new SqlCommand(addAttendanceQuery, con);
                    cmd.Parameters.AddWithValue("@AttendanceDate", date);
                    cmd.Parameters.AddWithValue("@Statuss", status);
                    cmd.Parameters.AddWithValue("@EmployeeID", empId);

                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Attendance record added successfully.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Employee not found.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }

                lblMessage.Visible = true;
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}