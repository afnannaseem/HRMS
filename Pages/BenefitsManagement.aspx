<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BenefitsManagement.aspx.cs" Inherits="ProjectCode.Pages.BenefitsManagement" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Benefits Management - HRMS</title>
  <link rel="stylesheet" href="../Styles/AllPageStyle.css">
</head>
<body>
 <form runat="server">
  <header>
    <h1>HRMS Benefits Management</h1>
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
    <section class="benefits-management-section">
        <h2>Manage Benefits</h2>
        <asp:GridView ID="GridViewBenefits" runat="server" AutoGenerateColumns="False" DataKeyNames="BenefitsProgramID" OnRowEditing="GridViewBenefits_RowEditing" OnRowCancelingEdit="GridViewBenefits_RowCancelingEdit" OnRowUpdating="GridViewBenefits_RowUpdating" OnRowDeleting="GridViewBenefits_RowDeleting">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" ReadOnly="True" />
                <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" ReadOnly="True" />
                <asp:TemplateField HeaderText="Benefit Name">
                    <ItemTemplate>
                        <asp:Label ID="lblBProgramName" runat="server" Text='<%# Bind("BProgramName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBProgramName" runat="server" Text='<%# Bind("BProgramName") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Benefit Description">
                    <ItemTemplate>
                        <asp:Label ID="lblBProgramDescription" runat="server" Text='<%# Bind("BProgramDescription") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBProgramDescription" runat="server" Text='<%# Bind("BProgramDescription") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowCancelButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </section>

    <section class="add-benefit-section">
        <h3>Add New Benefit Record</h3>
        <asp:Label ID="lblErrorMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
        <asp:Panel ID="PanelAddBenefit" runat="server">
            <asp:Label for="EmployeeID" Text="Employee ID:" AssociatedControlID="EmployeeID">Employee ID</asp:Label>
            <asp:TextBox ID="EmployeeID" runat="server"></asp:TextBox>

            <asp:Label for="BenefitName" Text="Benefit Name:" AssociatedControlID="BenefitName">Benefit Name</asp:Label>
            <asp:TextBox ID="BenefitName" runat="server"></asp:TextBox>

            <asp:Label for="BenefitDescription" Text="Benefit Description:" AssociatedControlID="BenefitDescription">Benefit Description</asp:Label>
            <asp:TextBox ID="BenefitDescription" runat="server" TextMode="MultiLine"></asp:TextBox>

            <asp:Button ID="AddBenefitButton" runat="server" Text="Add Benefit Record" OnClick="AddBenefitButton_Click" />
        </asp:Panel>
    </section>
</main>
  <footer>
    <p>HRMS &copy; 2023. All Rights Reserved.</p>
  </footer>
</form>
</body>
</html>


</body>
</html>
