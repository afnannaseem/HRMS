<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit_Profile.aspx.cs" Inherits="ProjectCode.Edit_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <style>
        /* Add some spacing between content and style the form */
        .edit-profile-section {
            margin-top: 20px;
        }

        .profile-form label,
        .profile-form input {
            display: block;
            margin-bottom: 10px;
            width: 100%;
            padding: 8px;
        }

        .profile-form button {
            background-color: #f4a261;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        .profile-form button:hover {
            background-color: #e76f51;
        }
    </style>
</head>
<body>
    <form id="form4" runat="server">
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
</ul>
            </nav>

           <main>
                <section class="edit-profile-section">
                    <div class="profile-form">
                       <label for="first_name">First Name:</label>
<input type="text" id="first_name" runat="server" />

<label for="last_name">Last Name:</label>
<input type="text" id="last_name" runat="server" />

<label for="email">Email:</label>
<input type="email" id="email" runat="server" />

<label for="phone">Phone Number:</label>
<input type="tel" id="phone" runat="server" />

<asp:Button ID="saveChangesButton" runat="server" Text="Save Changes" OnClick="SaveChanges_Click" />
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