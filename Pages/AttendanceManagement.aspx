<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceManagement.aspx.cs" Inherits="ProjectCode.Pages.AttendanceManagement" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Attendance Management - HRMS</title>
  <link rel="stylesheet" href="../Styles/AllPageStyle.css">
</head>
<body>
  <form runat="server">
  <header>
    <h1>HRMS Attendance Management</h1>
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
<asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" CssClass="logout-button" />
    </nav>
  </header>
  
    <main>
         <section class="attendance-management-section">
            <h2>View Attendance Record</h2>
            <div class="select-date-section">
                <label for="attendanceDate">Select Date:</label>
                <asp:TextBox ID="attendanceDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:Button ID="filterAttendanceButton" runat="server" Text="Filter" OnClick="FilterAttendanceButton_Click" />
            </div>

            <asp:GridView ID="GridViewAttendance" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
</asp:GridView>

        </section>
    <section class="attendance-management-section">
                <h3>Add Attendance Record</h3>
                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                <div class="add-attendance-form">
                    <label for="employeeID">Employee ID:</label>
                    <asp:TextBox ID="employeeID" runat="server"></asp:TextBox>

                    <label for="attendanceDateInput">Attendance Date:</label>
                    <asp:TextBox ID="attendanceDateInput" runat="server" TextMode="Date"></asp:TextBox>

                    <label for="attendanceStatus">Status:</label>
                    <asp:DropDownList ID="attendanceStatus" runat="server">
                        <asp:ListItem Value="Present">Present</asp:ListItem>
                        <asp:ListItem Value="Absent">Absent</asp:ListItem>
                        <asp:ListItem Value="Late">Late</asp:ListItem>
                    </asp:DropDownList>

                    <asp:Button ID="btnAddRecord" runat="server" Text="Add Record" OnClick="btnAddRecord_Click" />
                </div>
            </section>

  </main>

  <footer>
    <p>HRMS &copy; 2023. All Rights Reserved.</p>
  </footer>
</form>
</body>
</html>



