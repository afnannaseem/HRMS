<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="ProjectCode.Pages.AdminHomePage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - HRMS</title>
    <link rel="stylesheet" href="../Styles/AllPageStyle.css">
</head>
<body>
<form runat="server">
    <header>
        <h1>HRMS Admin Dashboard</h1>
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
        <section class="welcome-section">
            <h2 id="lblAdminName" runat="server">Welcome, [Admin Name]</h2>
            <p>Here's what's happening in your HRMS today:</p>
        </section>
        <section class="dashboard-widgets">
            <div class="widget">
                <h3>Total Employees</h3>
                <p id="lblTotalEmployees" runat="server">[Total Employees]</p>
            </div>
            <div class="widget">
                <h3>Leave Requests</h3>
                <p id="lblPendingLeaveRequests" runat="server">[Pending Leave Requests]</p>
            </div>
            <div class="widget">
                <h3>Trainings</h3>
                <p id="lblDistinctTrainings" runat="server">[Distinct Trainings]</p>
            </div>
            <!-- More widgets as needed -->
        </section>
    </main>
    <footer>
        <p>HRMS &copy; 2023. All Rights Reserved.</p>
    </footer>
</form>
</body>
</html>

