
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayrollManagement.aspx.cs" Inherits="ProjectCode.Pages.PayrollManagement" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payroll Management - HRMS</title>
  <link rel="stylesheet" href="../Styles/AllPageStyle.css">
</head>
<body>
<form runat="server">
  <header>
    <h1>HRMS Payroll Management</h1>
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
    <section class="payroll-management-section">
         <h2>Manage Payroll</h2>
         <div class="select-month-section">
             <label for="payrollMonth">Select Month:</label>
             <input type="month" id="payrollMonth" runat="server" />
             <asp:Button ID="filterPayrollButton" runat="server" Text="Filter" OnClick="FilterPayrollButton_Click" />
         </div>

         <asp:GridView ID="GridViewPayroll" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="Salary" HeaderText="Basic Salary" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Deduction" HeaderText="Deductions" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Reimbursement" HeaderText="Reimbursement" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="TotalSalary" HeaderText="Total Salary" DataFormatString="{0:C}" />
                </Columns>
          </asp:GridView>
    </section>

    <section class="add-payroll-section">
            <h3>Add New Payroll Record</h3>
            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
            <div class="add-payroll-form">
                <label for="employeeID">Employee ID:</label>
                <asp:TextBox ID="employeeID" runat="server"></asp:TextBox>

                <label for="basicSalary">Basic Salary:</label>
                <asp:TextBox ID="basicSalary" runat="server"></asp:TextBox>

                <label for="deductions">Deductions:</label>
                <asp:TextBox ID="deductions" runat="server"></asp:TextBox>

                <label for="reimbursement">Reimbursement:</label>
                <asp:TextBox ID="reimbursement" runat="server"></asp:TextBox>

                <label for="totalSalary">Total Salary:</label>
                <asp:TextBox ID="totalSalary" runat="server" Enabled="false"></asp:TextBox>

                <asp:Button ID="btnAddPayroll" runat="server" Text="Add Payroll Record" OnClick="btnAddPayroll_Click" />
            </div>
     </section>
  </main>
  <footer>
    <p>HRMS &copy; 2023. All Rights Reserved.</p>
  </footer>
</form>
</body>
</html>


