<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Application_Leave.aspx.cs" Inherits="ProjectCode.Application_Leave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Apply for Leave</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <style>
        /* Add some spacing between content and style the form */
        .leave-application-section {
            margin-top: 20px;
        }

        .leave-form label,
        .leave-form input,
        .leave-form textarea,
        .leave-form select {
            display: block;
            margin-bottom: 10px;
            width: 100%;
            padding: 8px;
        }

        .leave-form button {
            background-color: #f4a261;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        .leave-form button:hover {
            background-color: #e76f51;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <h1>Welcome, Employee</h1>
            </header>

            <nav>
                <ul>
                    <li><a href="#" onclick="redirectToHome()">Home</a></li>
                    <li><a href="#" onclick="redirectToLeaveApp()">Leave App</a></li>
                    <li><a href="#" onclick="redirectToProfile()">Edit Profile</a></li>
                    <li><a href="#" onclick="redirectToPayroll()">Payroll Management</a></li>
                    <li><a href="#" onclick="redirectToPerformance()">Performance Evaluation</a></li>
                    <li><a href="#" onclick="redirectToTrain()">Training and Development</a></li>
                    <li><a href="#" onclick="redirectToRetirement()">Retirement and Off-boarding</a></li>
                    <li><a href="#" onclick="redirectToBenefits()">Benefits Program</a></li>
                    <li><a href="#" onclick="redirectToviewAtt()">View Attendance</a></li>
                    <li><a href="#" onclick="logOut()">LogOut</a></li>
                </ul>
            </nav>

            <main>
               <section class="leave-application-section">
    <div class="leave-form">
        <label for="leave-type">Leave Type:</label>
        <asp:TextBox ID="leaveTypeTextBox" runat="server"></asp:TextBox>

       <label for="start-date">Start Date:</label>
<asp:TextBox ID="startDateTextBox" runat="server" TextMode="Date"></asp:TextBox>


        <label for="end-date">End Date:</label>
<asp:TextBox ID="endDateTextBox" runat="server" TextMode="Date"></asp:TextBox>


     

        <asp:Button ID="applyLeaveButton" runat="server" Text="Apply for Leave" OnClick="applyLeaveButton_Click" />
    </div>
</section>
            </main>

            <footer>
                © 2023 Your Company. All rights reserved.
            </footer>
        </div>
    </form>
</body>
<script>
    // JavaScript function to redirect to Application_Leave.aspx
    function redirectToHome() {
        window.location.href = 'Employee_Dashboard.aspx';
    }
    function redirectToLeaveApp() {
        window.location.href = 'Application_Leave.aspx';
    }
    function redirectToBenefits() {
        window.location.href = 'System_Integration.aspx';
    }
    function redirectToRetirement() {
        window.location.href = 'Retirement_Onborads.aspx';
    }
    function redirectToPerformance() {
        window.location.href = 'Performance_Evaluation.aspx';
    }
    function redirectToPayroll() {
        window.location.href = 'PAyRoll_Management.aspx';
    }
    function redirectToviewAtt() {
        window.location.href = 'ViewAttendance_Employee.aspx';
    }
    function redirectToProfile() {
        window.location.href = 'Edit_Profile.aspx';
    }
    function redirectToTrain() {
        window.location.href = 'Training_Development.aspx';
    }
    function logOut() {
        // Redirect to the login page
        window.location.href = 'LogIn.aspx';
    }
</script>
</html>