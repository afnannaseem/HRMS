<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Retirement.aspx.cs" Inherits="ProjectCode.Pages.Retirement" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Retirement and Off-boarding - HRMS</title>
  <link rel="stylesheet" href="../Styles/AllPageStyle.css">
</head>
<body>
 <form runat="server">
  <header>
    <h1>HRMS Retirement and Off-boarding</h1>
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
    <section class="retirement-record-section">
            <h2>Retirement Records</h2>
            <asp:GridView ID="GridViewRetirement" runat="server" AutoGenerateColumns="False" DataKeyNames="RetRecID" OnRowEditing="GridViewRetirement_RowEditing" OnRowCancelingEdit="GridViewRetirement_RowCancelingEdit" OnRowUpdating="GridViewRetirement_RowUpdating" OnRowDeleting="GridViewRetirement_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" ReadOnly="True" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Retirement Date">
                        <ItemTemplate>
                            <asp:Label ID="lblRetirementDate" runat="server" Text='<%# Bind("RetirementDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRetirementDate" runat="server" Text='<%# Bind("RetirementDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Knowledge Transfer">
                        <ItemTemplate>
                            <asp:Label ID="lblKnowledgeTransfer" runat="server" Text='<%# Bind("KnowledgeTransfer") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtKnowledgeTransfer" runat="server" Text='<%# Bind("KnowledgeTransfer") %>' TextMode="MultiLine"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
    </section>
    <section class="add-retirement-section">
        <h3>Add Retirement Record</h3>
        <asp:Panel ID="PanelAddRetirement" runat="server">
            <asp:Label ID="lblRetirementErrorMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>

            <asp:Label for="EmployeeIDRetirement" Text="Employee ID:" AssociatedControlID="EmployeeIDRetirement">Employee ID</asp:Label>
            <asp:TextBox ID="EmployeeIDRetirement" runat="server" CssClass="form-control"></asp:TextBox>

            <asp:Label for="RetirementDate" Text="Retirement Date:" AssociatedControlID="RetirementDate">Retirement Date</asp:Label>
            <asp:TextBox ID="RetirementDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>

            <asp:Label for="KnowledgeTransfer" Text="Knowledge Transfer:" AssociatedControlID="KnowledgeTransfer">Knowledge Transfer</asp:Label>
            <asp:TextBox ID="KnowledgeTransfer" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>

            <asp:Button ID="AddRetirementButton" runat="server" Text="Add Record" OnClick="AddRetirementButton_Click" CssClass="btn btn-primary" />
        </asp:Panel>
    </section>
  </main>
  <footer>
    <p>HRMS &copy; 2023. All Rights Reserved.</p>
  </footer>
</form>
</body>
</html>
