<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="ASP_Project_1.Signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Signup - Pet Adoption</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .signup-box {
            padding: 30px;
            border-radius: 10px;
            width: 350px;
        }

        .signup-box h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #218838;
        }

        .message {
            margin-top: 10px;
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup-box">
            <h2>Create Account</h2>
            <div class="form-group">
                <label>Username</label>
                <asp:TextBox ID="txtUsername" runat="server" />
            </div>
            <div class="form-group">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
            </div>
            <asp:Button ID="btnSignup" runat="server" Text="Sign Up" CssClass="btn" OnClick="btnSignup_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
            <p style="text-align: center; margin-top: 15px;">
    Already have an account?
    <a href="UserLogin.aspx">Login</a>
</p>
        </div>
    </form>
</body>
</html>
