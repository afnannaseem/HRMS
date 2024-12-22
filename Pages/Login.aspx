<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectCode.Pages.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - HRMS</title>
    <link rel="stylesheet" href="../Styles/LoginSignupStyle.css">
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form class="login-form" runat="server">
            <label for="email">Email:</label>
            <asp:TextBox ID="emailTextBox" runat="server" type="text" name="email" required></asp:TextBox>

            <label for="password">Password:</label>
            <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password" name="password" required></asp:TextBox>

            <asp:Button ID="loginButton" runat="server" Text="Login as Admin" CssClass="login-button" OnClick="LoginButton_Click" />

            <asp:Label ID="errorMessageLabel" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        </form>
        <div class="signup-options">
            <a href="../Login.aspx">Login as Employee</a>
        </div>
    </div>
</body>
</html>
