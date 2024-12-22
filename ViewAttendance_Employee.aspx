,<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAttendance_Employee.aspx.cs" Inherits="ProjectCode.ViewAttendance_Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Attendance</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <style>
        /* Add some spacing between content and style the table */
        .attendance-management-section {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #e0d0c1;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
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
    <li><a href="#" onclick="redirectToTrain()">Training and Development</a></li>
    <li><a href="#" onclick="redirectToRetirement()">Retirement and Off-boarding</a></li>
    <li><a href="#" onclick="redirectToBenefits()">Benefits Program</a></li>
    <li><a href="#" onclick="redirectToviewAtt()">View Attendance</a></li>
                    <li><a href="#" onclick="logOut()">LogOut</a></li>
</ul>
            </nav>

            <main>
                <section class="attendance-management-section">
                        <h2>Employee Attendance</h2>
                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="AttendanceDate" HeaderText="Date" />
                            <asp:BoundField DataField="Statuss" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                </section>
            </main>

            <footer>
               HRMS © 2023 Your Company. All rights reserved.
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
         function redirectToHome() {
             window.location.href = 'Employee_Dashboard.aspx';
         }
         function logOut() {
             // Redirect to the login page
             window.location.href = 'LogIn.aspx';
         }
     </script>
</html>