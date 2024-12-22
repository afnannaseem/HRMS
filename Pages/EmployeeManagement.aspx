<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeManagement.aspx.cs" Inherits="ProjectCode.Pages.EmployeeManagementPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management - HRMS</title>
    <link rel="stylesheet" href="../Styles/AllPageStyle.css">
</head>
<body>
    <header>
        <h1>HRMS Employee Management</h1>
        <nav>
            <ul>
                <li><a href="AdminHome.aspx">Home</a></li>
                <li><a href="EmployeeManagement.aspx">Employee Management</a></li>
                <li><a href="AttendanceManagement.aspx">Attendance Management</a></li>
                <li><a href="BenefitsManagement.aspx">Benefits Management</a></li>
                <li><a href="LeaveManagement.aspx">Leave Management</a></li>
                <li><a href="PayrollManagement.aspx">Payroll Management</a></li>
                <li><a href="Retirement.aspx">Retirement</a></li>
                <li><a href="TrainingsManagement.aspx">Training Programs</a></li>
            </ul>
            <button id="logout-button">Log Out</button>
        </nav>
    </header>
    <form class="add-employee-form" runat="server">
    <main>
        <section class="employee-management">
            <h2>Add New Employee</h2>

                <label for="emp_id">Employee ID:</label>
                <input type="text" id="emp_id" runat="server" name="emp_id" required>

                <label for="first_name">First Name:</label>
                <input type="text" id="first_name" runat="server" name="first_name" required>

                <label for="last_name">Last Name:</label>
                <input type="text" id="last_name" runat="server" name="last_name" required>

                <label for="role">Role:</label>
                <input type="text" id="role" runat="server" name="role" required>

                <div class="gender_field">
                    <label>Gender:</label>
                    <div>
                        <input type="radio" id="male" runat="server" name="gender" value="male">
                        <label for="male">Male</label>
                    </div>
                    <div>
                        <input type="radio" id="female" runat="server" name="gender" value="female">
                        <label for="female">Female</label>
                    </div>
                </div>      
                   

                <label for="email">Email:</label>
                <input type="email" id="email" runat="server" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" runat="server" name="password" required>

                <label for="address">Address:</label>
                <input type="text" id="address" runat="server" name="address" required>

                <label for="date_of_birth">Date Of Birth:</label>
                <input type="date" id="date_of_birth" runat="server" name="date_of_birth" required>

                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" runat="server" name="phone" required>

                <asp:Button ID="btnAddEmployee" runat="server" Text="Add Employee" OnClick="btnAddEmployee_Click" />

        </section>
        <section class="employee-action-section">
            <h2>Edit Employee Profile</h2>
            <asp:GridView ID="GridViewEmployees" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID" OnRowEditing="GridViewEmployees_RowEditing" OnRowCancelingEdit="GridViewEmployees_RowCancelingEdit" OnRowUpdating="GridViewEmployees_RowUpdating" OnRowDeleting="GridViewEmployees_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate>
                            <asp:Label ID="lblRole" runat="server" Text='<%# Bind("Rolee") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRole" runat="server" Text='<%# Bind("Rolee") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone Number">
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNum" runat="server" Text='<%# Bind("PhoneNum") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPhoneNum" runat="server" Text='<%# Bind("PhoneNum") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Of Birth">
                        <ItemTemplate>
                            <asp:Label ID="lblDateOfBirth" runat="server" Text='<%# Bind("DateOfBirth", "{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDateOfBirth" runat="server" Text='<%# Bind("DateOfBirth", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Addresss") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Addresss") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGender" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowCancelButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>


        </section>        
    </main>
    </form>
    <footer>
        <p>HRMS &copy; 2023. All Rights Reserved.</p>
    </footer>
</body>
</html>


        </div>
    </form>
</body>
</html>
