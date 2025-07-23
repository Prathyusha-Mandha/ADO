<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="YourNamespace.UserLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Login - Pet Heaven</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: Arial;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            padding: 30px;
            border-radius: 12px;
            width: 320px;
            background: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            font-size: 30px;
            font-weight: 800;
            letter-spacing: 1.5px;
            background: linear-gradient(to right, #3a3a3a, #6e6e6e);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
            padding-bottom: 10px;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: 600;
            color: #333333;
            font-size: 14px;
        }

        input[type=text], input[type=password], .input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #bbb;
            box-sizing: border-box;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.7);
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        input[type=text]:focus, input[type=password]:focus, .input:focus {
            border: 1px solid #555;
            box-shadow: 0 0 5px rgba(85, 85, 85, 0.5);
            outline: none;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #3f3f3f;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            letter-spacing: 1px;
            transition: background-color 0.3s ease;
        }

        .btn-login:hover {
            background-color: #2a2a2a;
        }

        .message {
            color: red;
            margin-top: 15px;
            text-align: center;
            font-size: 13px;
            font-weight: 500;
        }

        .bottom-link {
            text-align: center;
            margin-top: 18px;
            font-size: 13px;
            color: #333;
        }

        .bottom-link a {
            color: #1e90ff;
            text-decoration: none;
            font-weight: 600;
        }

        .bottom-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div class="login-container">
            <h2>User Login</h2>

            <label for="txtUsername">Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="input" />

            <label for="txtPassword">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input" />

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" UseSubmitBehavior="false" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />

            <div class="bottom-link">
                Don't have an account? 
                <a href="Signup.aspx">Sign Up</a>
            </div>
        </div>
    </form>
</body>
</html>
