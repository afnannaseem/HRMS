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
    public partial class LeaveManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindLeaveRequestsData();
            }
        }
        private void BindLeaveRequestsData()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = @"
            SELECT lr.LeaveID, (e.FirstName + ' ' + e.LastName) AS EmployeeName, lr.StartDate, lr.EndDate, lr.LeaveType
            FROM LeaveRequest lr
            INNER JOIN Employee e ON lr.EmployeeID = e.EmployeeID
            WHERE lr.Statuss = 'Pending'";

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridViewLeaveRequests.DataSource = dt;
                GridViewLeaveRequests.DataBind();
            }
        }
        protected void GridViewLeaveRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
                int leaveId = Convert.ToInt32(e.CommandArgument);
                string newStatus = e.CommandName == "Approve" ? "Approved" : "Rejected";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string updateQuery = "UPDATE LeaveRequest SET Statuss = @Status WHERE LeaveID = @LeaveID";
                    SqlCommand cmd = new SqlCommand(updateQuery, con);
                    cmd.Parameters.AddWithValue("@Status", newStatus);
                    cmd.Parameters.AddWithValue("@LeaveID", leaveId);
                    cmd.ExecuteNonQuery();
                }

                BindLeaveRequestsData();
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}