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
    public partial class Retirement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRetirementData();
            }
        }
        private void BindRetirementData()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT r.RetRecID, r.EmployeeID, e.FirstName + ' ' + e.LastName AS EmployeeName, r.RetirementDate, r.KnowledgeTransfer FROM RetirementRecord r INNER JOIN Employee e ON r.EmployeeID = e.EmployeeID";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridViewRetirement.DataSource = dt;
                GridViewRetirement.DataBind();
            }
        }
        protected void AddRetirementButton_Click(object sender, EventArgs e)
        {
            string empId = EmployeeIDRetirement.Text;
            DateTime retirementDate = Convert.ToDateTime(RetirementDate.Text);
            string knowledgeTransfer = KnowledgeTransfer.Text;

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
                    string insertQuery = "INSERT INTO RetirementRecord (EmployeeID, RetirementDate, KnowledgeTransfer) VALUES (@EmployeeID, @RetirementDate, @KnowledgeTransfer)";
                    SqlCommand cmd = new SqlCommand(insertQuery, con);
                    cmd.Parameters.AddWithValue("@EmployeeID", empId);
                    cmd.Parameters.AddWithValue("@RetirementDate", retirementDate);
                    cmd.Parameters.AddWithValue("@KnowledgeTransfer", knowledgeTransfer);

                    cmd.ExecuteNonQuery();
                    lblRetirementErrorMessage.Text = "Retirement record added successfully.";
                    lblRetirementErrorMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblRetirementErrorMessage.Text = "Employee not found.";
                    lblRetirementErrorMessage.ForeColor = System.Drawing.Color.Red;
                }

                lblRetirementErrorMessage.Visible = true;
                BindRetirementData();
            }
        }
        protected void GridViewRetirement_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRetirement.EditIndex = e.NewEditIndex;
            BindRetirementData();
        }
        protected void GridViewRetirement_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewRetirement.EditIndex = -1;
            BindRetirementData();
        }
        protected void GridViewRetirement_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int retRecID = Convert.ToInt32(GridViewRetirement.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridViewRetirement.Rows[e.RowIndex];
            DateTime retirementDate = Convert.ToDateTime((row.FindControl("txtRetirementDate") as TextBox).Text);
            string knowledgeTransfer = (row.FindControl("txtKnowledgeTransfer") as TextBox).Text;

            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string updateQuery = "UPDATE RetirementRecord SET RetirementDate = @RetirementDate, KnowledgeTransfer = @KnowledgeTransfer WHERE RetRecID = @RetRecID";
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@RetRecID", retRecID);
                cmd.Parameters.AddWithValue("@RetirementDate", retirementDate);
                cmd.Parameters.AddWithValue("@KnowledgeTransfer", knowledgeTransfer);
                cmd.ExecuteNonQuery();
            }

            GridViewRetirement.EditIndex = -1;
            BindRetirementData();
        }
        protected void GridViewRetirement_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int retRecID = Convert.ToInt32(GridViewRetirement.DataKeys[e.RowIndex].Value);

            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string deleteQuery = "DELETE FROM RetirementRecord WHERE RetRecID = @RetRecID";
                SqlCommand cmd = new SqlCommand(deleteQuery, con);
                cmd.Parameters.AddWithValue("@RetRecID", retRecID);
                cmd.ExecuteNonQuery();
            }

            BindRetirementData();
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}