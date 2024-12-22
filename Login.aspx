<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="ProjectCode.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        /* General Styles */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            color: white;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color:ghostwhite;
            color: #5a4a42;
            margin: 90px; /* Remove default margin to ensure full width */
            margin-left:30rem;
            }

        /* Header Styles */
        header {
            background-color: #f4a261;
            color: #fff;
            padding: 1rem 0;
            text-align: center;
            margin-bottom: 20px; /* Add margin to separate header and form */
        }

        header h1 {
            width:40rem;     
            margin: 0;
        }

        /* Main Content Styles */
        main {
            flex: 1;
            padding: 20px;
            margin-right: 150px;
            margin-left: 150px;
            margin-top: 40px;
            margin-bottom: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Login Form Styles */
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
            width: 300px; /* Set a width for the form */
        }

        h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        label {
            font-size: 16px;
            margin-bottom: 5px;
            width:80rem;
        }

        input {
            padding: 8px;
            margin-bottom: 10px;
            width: 100%;
        }

        button {
            padding: 10px;
            background-color: #f4a261;
            color: white;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #e76f51;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img src="10.PNG" alt="Your Logo" style="max-width: 60%; margin-left:60px;" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <br />
            Email: <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br />
            Employee ID: <asp:TextBox ID="txtEmployeeID" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
    <div class="signup-options">
    <a href="../Pages/Login.aspx">Login as Admin</a>
</div>
</body>
</html>