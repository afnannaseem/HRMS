using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Net;
using System.Security.Policy;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace ProjectCode.Pages
{
    public partial class EmployeeManagementPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeData();
            }
        }

        private void BindEmployeeData()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT EmployeeID, FirstName, LastName, Rolee, Email, PhoneNum, DateOfBirth, Addresss, Gender FROM Employee";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridViewEmployees.DataSource = dt;
                GridViewEmployees.DataBind();
            }
        }

        protected void btnAddEmployee_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "INSERT INTO Employee (EmployeeID, FirstName, LastName, Rolee, Email, Passwordd, PhoneNum, DateOfBirth, Addresss, Gender) VALUES (@EmployeeID, @FirstName, @LastName, @Role, @Email, @Password, @PhoneNum, @DateOfBirth, @Address, @Gender)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@EmployeeID", emp_id.Value);
                    cmd.Parameters.AddWithValue("@FirstName", first_name.Value);
                    cmd.Parameters.AddWithValue("@LastName", last_name.Value);
                    cmd.Parameters.AddWithValue("@Role", role.Value);
                    cmd.Parameters.AddWithValue("@Email", email.Value);
                    cmd.Parameters.AddWithValue("@Password", password.Value);
                    cmd.Parameters.AddWithValue("@PhoneNum", phone.Value);
                    cmd.Parameters.AddWithValue("@DateOfBirth", date_of_birth.Value);
                    cmd.Parameters.AddWithValue("@Address", address.Value);
                    cmd.Parameters.AddWithValue("@Gender", male.Checked ? "M" : "F");

                    cmd.ExecuteNonQuery();
                }

                // Optionally, rebind the grid to show the new employee
                BindEmployeeData();
            }
            catch (Exception ex)
            {
                // Handle exceptions
                // Log error (if necessary) and inform the user
            }
        }

        protected void GridViewEmployees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewEmployees.EditIndex = e.NewEditIndex;
            BindEmployeeData();
        }

        protected void GridViewEmployees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewEmployees.EditIndex = -1;
            BindEmployeeData();
        }

        protected void GridViewEmployees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;

            GridViewRow row = GridViewEmployees.Rows[e.RowIndex];
            int employeeID = Convert.ToInt32(GridViewEmployees.DataKeys[e.RowIndex].Value);
            string firstName = (row.FindControl("txtFirstName") as TextBox).Text;
            string lastName = (row.FindControl("txtLastName") as TextBox).Text;
            string role = (row.FindControl("txtRole") as TextBox).Text;
            string email = (row.FindControl("txtEmail") as TextBox).Text;
            string phoneNum = (row.FindControl("txtPhoneNum") as TextBox).Text;
            DateTime dateOfBirth = DateTime.ParseExact((row.FindControl("txtDateOfBirth") as TextBox).Text, "yyyy-MM-dd", null);
            string address = (row.FindControl("txtAddress") as TextBox).Text;
            string gender = (row.FindControl("txtGender") as TextBox).Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string updateQuery = "UPDATE Employee SET FirstName = @FirstName, LastName = @LastName, Rolee = @Role, Email = @Email, PhoneNum = @PhoneNum, DateOfBirth = @DateOfBirth, Addresss = @Address, Gender = @Gender WHERE EmployeeID = @EmployeeID";
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@Role", role);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PhoneNum", phoneNum);
                cmd.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.ExecuteNonQuery();
            }

            GridViewEmployees.EditIndex = -1;
            BindEmployeeData();
        }

        protected void GridViewEmployees_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;

            int employeeID = Convert.ToInt32(GridViewEmployees.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string deleteQuery = "DELETE FROM Employee WHERE EmployeeID = @EmployeeID";
                SqlCommand cmd = new SqlCommand(deleteQuery, con);
                cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                cmd.ExecuteNonQuery();
            }

            BindEmployeeData();
        }
    }
}
