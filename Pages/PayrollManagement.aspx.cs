using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectCode.Pages
{
    public partial class PayrollManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initial data binding can be done here, if needed.
            }
        }

        protected void FilterPayrollButton_Click(object sender, EventArgs e)
        {
            string selectedMonth = payrollMonth.Value;
            BindPayrollData(selectedMonth);
        }

        private void BindPayrollData(string month)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = @"
                    SELECT p.PayrollID, e.EmployeeID, e.FirstName + ' ' + e.LastName AS EmployeeName, 
                           p.Salary, p.Deduction, p.Reimbursement, p.TotalSalary
                    FROM Payroll p
                    INNER JOIN Employee e ON p.EmployeeID = e.EmployeeID
                    WHERE FORMAT(p.PayDate, 'yyyy-MM') = @Month";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Month", month);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridViewPayroll.DataSource = dt;
                GridViewPayroll.DataBind();
            }
        }

        protected void btnAddPayroll_Click(object sender, EventArgs e)
        {
            string empId = employeeID.Text;
            TextBox basicSalaryTextBox = (TextBox)FindControl("basicSalary");
            TextBox deductionsTextBox = (TextBox)FindControl("deductions");
            TextBox reimbursementTextBox = (TextBox)FindControl("reimbursement");

            decimal basicSalary = Convert.ToDecimal(basicSalaryTextBox.Text);
            decimal deductions = Convert.ToDecimal(deductionsTextBox.Text);
            decimal reimbursement = Convert.ToDecimal(reimbursementTextBox.Text);

            decimal totalSalary = basicSalary - deductions + reimbursement; // Calculate total salary

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
                    string insertQuery = "INSERT INTO Payroll (Salary, Deduction, Reimbursement, TotalSalary, PayDate, EmployeeID) VALUES (@Salary, @Deduction, @Reimbursement, @TotalSalary, GETDATE(), @EmployeeID)";
                    SqlCommand cmd = new SqlCommand(insertQuery, con);
                    cmd.Parameters.AddWithValue("@Salary", basicSalary);
                    cmd.Parameters.AddWithValue("@Deduction", deductions);
                    cmd.Parameters.AddWithValue("@Reimbursement", reimbursement);
                    cmd.Parameters.AddWithValue("@TotalSalary", totalSalary);
                    cmd.Parameters.AddWithValue("@EmployeeID", empId);

                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Payroll record added successfully.";
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
