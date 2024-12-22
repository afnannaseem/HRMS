using System;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI.WebControls;

namespace ProjectCode
{
    public partial class Application_Leave : System.Web.UI.Page
    {
        protected TextBox leaveTypeTextBox;
        protected TextBox startDateTextBox;
        protected TextBox endDateTextBox;
        protected TextBox leaveReasonTextBox;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["UserID"] == null)
            {
                // If not logged in, redirect to the login page
                Response.Redirect("LogIn.aspx");
            }

            // Continue with page initialization for the logged-in user
            if (!IsPostBack)
            {
                // Populate the leaveType TextBox here
            }
        }

        protected void applyLeaveButton_Click(object sender, EventArgs e)
        {
            // Check if the user is logged in (additional validation)
            if (Session["UserID"] == null)
            {
                // If not logged in, redirect to the login page
                Response.Redirect("LogIn.aspx");
            }

            // Get the user ID from the session
            int employeeID = Convert.ToInt32(Session["UserID"]);

            // Extract the selected values from the form
            string selectedLeaveType = leaveTypeTextBox.Text;
            DateTime startDate = DateTime.ParseExact(startDateTextBox.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);
            DateTime endDate = DateTime.ParseExact(endDateTextBox.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);

            // Your database connection and insert logic here using the 'employeeID'
            //string connectionString = @"Data Source=DESKTOP-093PHRA\SQLEXPRESS;Initial Catalog=Human_Resource_Management_System;Integrated Security=True";
            string connectionString = @"Data Source=AFNAN\SQLEXPRESS;Initial Catalog=HRMSProject;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Insert data into the LeaveRequest table with specified LeaveID
                string query = "INSERT INTO LeaveRequest (LeaveID, StartDate, EndDate, LeaveType, Statuss,EmployeeID) " +
                               "VALUES (@LeaveID, @StartDate, @EndDate, @LeaveType,@Statuss, @EmployeeID)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Assuming you have a method to generate a unique LeaveID, replace this with your logic
                    int leaveID = GenerateUniqueLeaveID();

                    command.Parameters.AddWithValue("@LeaveID", leaveID);
                    command.Parameters.AddWithValue("@StartDate", startDate);
                    command.Parameters.AddWithValue("@EndDate", endDate);
                    command.Parameters.AddWithValue("@LeaveType", selectedLeaveType);

                    command.Parameters.AddWithValue("@Statuss", "Pending");

                    command.Parameters.AddWithValue("@EmployeeID", employeeID);


                    command.ExecuteNonQuery();
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your leave request is submitted.');", true);
        }

        private int GenerateUniqueLeaveID()
        {
            // Replace this with your logic to generate a unique LeaveID
            // This is just a placeholder, and you may use database sequences, GUIDs, etc.
            return new Random().Next(1000, 9999);
        }




    }
}