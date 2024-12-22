<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PAyRoll_Management.aspx.cs" Inherits="ProjectCode.PAyRoll_Management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payroll Management</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <style>
        /* Add some spacing between content and style the tables */
        .payroll-management-section {
            margin-top: 20px;
        }

        .select-month-section label {
            display: block;
            margin-bottom: 5px;
        }

        #payroll-month,
        #filter-payroll-button {
            display: inline-block;
        }

        .filter-payroll-button {
            background-color: #f4a261;
            border: none;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
        }

        .filter-payroll-button:hover {
            background-color: #e76f51;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #e0d0c1;
        }
    </style>
</head>
<body>
    <form id="form5" runat="server">
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
                <section class="payroll-management-section">
                   
                        <h2>Payroll Management</h2>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="PayDate" HeaderText="Pay Date" SortExpression="PayDate" />
        <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
        <asp:BoundField DataField="Deduction" HeaderText="Deduction" SortExpression="Deduction" />
        <asp:BoundField DataField="Reimbursement" HeaderText="Reimbursement" SortExpression="Reimbursement" />
        <asp:BoundField DataField="TotalSalary" HeaderText="TotalSalary" SortExpression="TotalSalary" />
    </Columns>
</asp:GridView>

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