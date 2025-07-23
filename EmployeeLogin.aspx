<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeLogin.aspx.cs" Inherits="YourNamespace.EmployeeLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login - Pet Heaven</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e8f0f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #999;
            width: 300px;
        }
        h2 {
            margin-bottom: 20px;
            color: #2d6a4f;
            text-align: center;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .btn-login {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #2d6a4f;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
        }
        .btn-login:hover {
            background-color: #1b4332;
        }
        .message {
            color: red;
            margin-top: 15px;
            text-align: center;
        }
        .bottom-link {
            text-align: center;
            margin-top: 15px;
        }
        .bottom-link a {
            color: #3498db;
            text-decoration: none;
        }
        .bottom-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div class="login-container">
            <h2>Admin</h2>
            
            <label for="txtUsername">Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="input" />

            <label for="txtPassword">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input" />

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />

            
        </div>
    </form>
</body>
</html>
