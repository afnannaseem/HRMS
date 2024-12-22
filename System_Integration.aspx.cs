using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ProjectCode
{
    public partial class System_Integration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["UserID"] == null)
                {
                    // If not logged in, redirect to the login page
                    Response.Redirect("LogIn.aspx");
                }

                // Get the logged-in employee's ID from the session
                string employeeId = Session["UserID"].ToString();

                // Fetch and display retirement details for the logged-in employee
                FetchAndBenefitsDetails(employeeId);
            }
        }

        private void FetchAndBenefitsDetails(string employeeId)
        {
            //string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            //string connectionString = @"Data Source=DESKTOP-093PHRA\SQLEXPRESS;Initial Catalog=Human_Resource_Management_System;Integrated Security=True";
            string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT BProgramName, BProgramDescription FROM BenefitsProgram WHERE EmployeeID = @EmployeeID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployeeID", employeeId); // Replace with the actual employee ID

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        // Bind the DataTable to a GridView or any other control for display
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }
}