using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectCode.Pages
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FetchAdminName();
                FetchTotalEmployees();
                FetchPendingLeaveRequests();
                FetchDistinctTrainings();
            }
        }

        private void FetchAdminName()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT FirstName, LastName FROM Adminn WHERE AdminID = 1";
                SqlCommand cmd = new SqlCommand(query, con);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string adminName = reader["FirstName"].ToString() + " " + reader["LastName"].ToString();
                        // Assuming you have a label with ID lblAdminName in your aspx page
                        lblAdminName.InnerText = "Welcome, " + adminName;
                    }
                }
            }
        }

        private void FetchTotalEmployees()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT COUNT(*) FROM Employee";
                SqlCommand cmd = new SqlCommand(query, con);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                // Assuming you have a label with ID lblTotalEmployees
                lblTotalEmployees.InnerText = $"{count} Employees";
            }
        }

        private void FetchPendingLeaveRequests()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT COUNT(*) FROM LeaveRequest WHERE Statuss = 'Pending'";
                SqlCommand cmd = new SqlCommand(query, con);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                // Assuming you have a label with ID lblPendingLeaveRequests
                lblPendingLeaveRequests.InnerText = $"{count} pending approvals";
            }
        }

        private void FetchDistinctTrainings()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT COUNT(DISTINCT TProgramName) FROM TrainingProgram";
                SqlCommand cmd = new SqlCommand(query, con);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                // Assuming you have a label with ID lblDistinctTrainings
                lblDistinctTrainings.InnerText = $"{count} trainings given";
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }


    }
}