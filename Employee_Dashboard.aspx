<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee_Dashboard.aspx.cs" Inherits="ProjectCode.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Dashboard</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <!-- Include Chart.js library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* Additional styling for the feature boxes */
        .employee-details {
            margin-top: -40px;
        }

        .employee-details h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 5px;
        }

        .employee-details table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .employee-details th, .employee-details td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .employee-details th {
            background-color: #f4a261;
            color: white;
        }

        /* Styling for the graphs */
        .graph-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin-top: 20px;
        }

        .graph-container canvas {
            max-width: 400px; /* Adjust max-width as needed */
        }

        /* Add some spacing between the graphs */
        .graph-container > div {
            margin-right: 20px;
        }

        /* Styling for the feature boxes */
        .categories-grid {
            display: grid;
            justify-content: space-around;
            margin-top: 20px;
        }

        .category {
            flex: 0 0 calc(33.33% - 20px);
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            transition: transform 0.3s; /* Add smooth transition */
            background-color: #f4a261;
            color: white;
        }

        .category h2 {
            margin-top: 0;
            font-size: 18px; /* Adjust font size */
        }

        /* Hover effect for categories */
        .category:hover {
            transform: scale(1.05); /* Scale up on hover */
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
    <li><a href="#" onclick="redirectToTrain()">Training and Development</a></li>
    <li><a href="#" onclick="redirectToRetirement()">Retirement and Off-boarding</a></li>
    <li><a href="#" onclick="redirectToBenefits()">Benefits Program</a></li>
    <li><a href="#" onclick="redirectToviewAtt()">View Attendance</a></li>
</ul>
            </nav>

            <main>
                <section class="employee-details">
                <h2>Employee Details</h2>
                <table>
                    <tr>
                        <th>Attribute</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><asp:Label ID="lblEmployeeName" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Role</td>
                        <td><asp:Label ID="lblRole" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><asp:Label ID="lblPhone" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td><asp:Label ID="lblDateOfBirth" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td><asp:Label ID="lblGender" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </section>

                <!-- Graph Container for Performance and Attendance -->
                <%--<div class="graph-container">
                    <div>
                        <canvas id="performance-chart" width="400" height="200"></canvas>
                        <p><strong>Performance Graph</strong></p>
                    </div>

                    <div>
                        <canvas id="attendance-chart" width="400" height="200"></canvas>
                        <p><strong>Attendance Graph</strong></p>
                    </div>
                </div>--%>
            </main>

            <footer>
                © 2023 Your Company. All rights reserved.
            </footer>

            <!-- JavaScript to initialize the graphs -->
            <script>
                // Performance Chart
                var performanceCtx = document.getElementById('performance-chart').getContext('2d');
                var performanceChart = new Chart(performanceCtx, {
                    type: 'bar',
                    data: {
                        labels: ['Category 1', 'Category 2', 'Category 3'],
                        datasets: [{
                            label: 'Performance Score',
                            data: [80, 90, 75],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });

                // Attendance Chart
                var attendanceCtx = document.getElementById('attendance-chart').getContext('2d');
                var attendanceChart = new Chart(attendanceCtx, {
                    type: 'line',
                    data: {
                        labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                        datasets: [{
                            label: 'Attendance Percentage',
                            data: [90, 92, 88, 94],
                            fill: false,
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 2
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                max: 100
                            }
                        }
                    }
                });
            </script>
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
     </script>
</html>