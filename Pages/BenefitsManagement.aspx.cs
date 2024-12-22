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
    public partial class BenefitsManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBenefitsData();
            }
        }

        private void BindBenefitsData()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = @"
            SELECT b.BenefitsProgramID, e.EmployeeID, (e.FirstName + ' ' + e.LastName) AS EmployeeName, 
                   b.BProgramName, b.BProgramDescription
            FROM BenefitsProgram b
            INNER JOIN Employee e ON b.EmployeeID = e.EmployeeID";

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridViewBenefits.DataSource = dt;
                GridViewBenefits.DataBind();
            }
        }

        protected void AddBenefitButton_Click(object sender, EventArgs e)
        {
            string empId = EmployeeID.Text;
            string benefitName = BenefitName.Text;
            string benefitDescription = BenefitDescription.Text;
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
                    // Employee exists, insert benefit record
                    string addBenefitQuery = "INSERT INTO BenefitsProgram (BProgramName, BProgramDescription, EmployeeID) VALUES (@BProgramName, @BProgramDescription, @EmployeeID)";
                    SqlCommand cmd = new SqlCommand(addBenefitQuery, con);
                    cmd.Parameters.AddWithValue("@BProgramName", benefitName);
                    cmd.Parameters.AddWithValue("@BProgramDescription", benefitDescription);
                    cmd.Parameters.AddWithValue("@EmployeeID", empId);

                    cmd.ExecuteNonQuery();
                    lblErrorMessage.Text = "Benefit record added successfully.";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblErrorMessage.Text = "Employee not found.";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                }

                lblErrorMessage.Visible = true;
                BindBenefitsData();
            }
        }
        protected void GridViewBenefits_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewBenefits.EditIndex = e.NewEditIndex;
            BindBenefitsData();
        }
        protected void GridViewBenefits_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewBenefits.EditIndex = -1;
            BindBenefitsData();
        }
        protected void GridViewBenefits_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;

            GridViewRow row = GridViewBenefits.Rows[e.RowIndex];
            int benefitsProgramID = Convert.ToInt32(GridViewBenefits.DataKeys[e.RowIndex].Value);
            string benefitName = (row.FindControl("txtBProgramName") as TextBox).Text;
            string benefitDescription = (row.FindControl("txtBProgramDescription") as TextBox).Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string updateQuery = "UPDATE BenefitsProgram SET BProgramName = @BProgramName, BProgramDescription = @BProgramDescription WHERE BenefitsProgramID = @BenefitsProgramID";
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@BenefitsProgramID", benefitsProgramID);
                cmd.Parameters.AddWithValue("@BProgramName", benefitName);
                cmd.Parameters.AddWithValue("@BProgramDescription", benefitDescription);
                cmd.ExecuteNonQuery();
            }

            GridViewBenefits.EditIndex = -1;
            BindBenefitsData();
        }
        protected void GridViewBenefits_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;

            int benefitsProgramID = Convert.ToInt32(GridViewBenefits.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string deleteQuery = "DELETE FROM BenefitsProgram WHERE BenefitsProgramID = @BenefitsProgramID";
                SqlCommand cmd = new SqlCommand(deleteQuery, con);
                cmd.Parameters.AddWithValue("@BenefitsProgramID", benefitsProgramID);
                cmd.ExecuteNonQuery();
            }

            BindBenefitsData();
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}