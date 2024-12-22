<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveManagement.aspx.cs" Inherits="ProjectCode.Pages.LeaveManagement" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Leave Management - HRMS</title>
  <link rel="stylesheet" href="../Styles/AllPageStyle.css">
</head>
<body>
<form runat="server">
  <header>
    <h1>HRMS Leave Management</h1>
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
    <section class="leave-management-section">
      <h2>Pending Leave Requests</h2>
      <asp:GridView ID="GridViewLeaveRequests" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewLeaveRequests_RowCommand">
        <Columns>
            <asp:BoundField DataField="LeaveID" HeaderText="Leave ID" />
            <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
            <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnApprove" runat="server" CommandName="Approve" CommandArgument='<%# Bind("LeaveID") %>' Text="Approve" CssClass="approve-button" />
                    <asp:Button ID="btnReject" runat="server" CommandName="Reject" CommandArgument='<%# Bind("LeaveID") %>' Text="Reject" CssClass="reject-button" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    </section>
  </main>
  <footer>
    <p>HRMS &copy; 2023. All Rights Reserved.</p>
  </footer>
</form>
</body>
</html>

