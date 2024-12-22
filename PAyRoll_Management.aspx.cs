using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ProjectCode
{
    public partial class PAyRoll_Management : System.Web.UI.Page
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

            // Check if it's a postback before binding data
            if (!IsPostBack)
            {
                BindPayrollData(employeeId);
            }
        }

        private void BindPayrollData(string employeeId)
        {
            // Connection string
            string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";

            // SQL query to fetch payroll data
            string query = "SELECT PayDate, Salary, Deduction, Reimbursement,TotalSalary FROM Payroll WHERE EmployeeID = @EmployeeID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployeeID", employeeId);
                    connection.Open();

                    // Create a SqlDataAdapter to fetch the data into a DataTable
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }
}