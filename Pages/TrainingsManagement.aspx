<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainingsManagement.aspx.cs" Inherits="ProjectCode.Pages.TrainingsManagement" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trainings Management - HRMS</title>
  <link rel="stylesheet" href="../Styles/AllPageStyle.css">
</head>
<body>
 <form runat="server">
  <header>
    <h1>HRMS Training Management</h1>
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
    <section class="training-management-section">
      <h2>Manage Trainings</h2>
        <asp:GridView ID="GridViewTrainings" runat="server" AutoGenerateColumns="False" DataKeyNames="TrainingProgramID" OnRowEditing="GridViewTrainings_RowEditing" OnRowCancelingEdit="GridViewTrainings_RowCancelingEdit" OnRowUpdating="GridViewTrainings_RowUpdating" OnRowDeleting="GridViewTrainings_RowDeleting">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" ReadOnly="True" />
                <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" ReadOnly="True" />
                <asp:TemplateField HeaderText="Program Name">
                    <ItemTemplate>
                        <asp:Label ID="lblTProgramName" runat="server" Text='<%# Bind("TProgramName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTProgramName" runat="server" Text='<%# Bind("TProgramName") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Program Date">
                    <ItemTemplate>
                        <asp:Label ID="lblProgramDate" runat="server" Text='<%# Bind("ProgramDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtProgramDate" runat="server" Text='<%# Bind("ProgramDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Performance Rating">
                    <ItemTemplate>
                        <asp:Label ID="lblRating" runat="server" Text='<%# Bind("Rating") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtRating" runat="server" Text='<%# Bind("Rating") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>                
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

    </section>
    <section class="training-management-section">
        <h3>Add New Training Record</h3>
                <asp:Label ID="lblTrainingErrorMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                <asp:TextBox ID="EmployeeID" runat="server" CssClass="form-control" Placeholder="Employee ID" />
                <asp:TextBox ID="ProgramName" runat="server" CssClass="form-control" Placeholder="Program Name" />
                <asp:TextBox ID="ProgramDate" runat="server" CssClass="form-control" Placeholder="Program Date" TextMode="DateTime" />
                <asp:TextBox ID="PerformanceRating" runat="server" CssClass="form-control" Placeholder="Performance Rating (out of 5)" />
                <asp:Button ID="AddTrainingButton" runat="server" Text="Add Training Record" OnClick="AddTrainingButton_Click" CssClass="btn btn-primary" />
    </section>
  </main>
  <footer>
    <p>HRMS &copy; 2023. All Rights Reserved.</p>
  </footer>
</form>
</body>
</html>



