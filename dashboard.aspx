<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="YourNamespace.dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pet Heaven</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://media.istockphoto.com/id/135808458/photo/sleeping-angel-new-born-puppy-sleeping-in-clouds.jpg?s=612x612&w=0&k=20&c=4e2FvzXSoao6E6ijralyzbuywaqXFn5z_I02gaobRZM=');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .container {
            max-width: 900px;
            margin: 60px auto;
            background-color: rgba(255, 255, 255, 0.3);
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
        }

        h1.welcome {
            font-size: 4rem;
            color: #ffffff;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
            margin-bottom: 50px;
            font-weight: bold;
            background-color: rgba(0, 0, 0, 0.3);
            padding: 15px 25px;
            border-radius: 12px;
            display: inline-block;
        }

        .login-options {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
        }

        .login-box {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 15px;
            width: 260px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-box:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .login-box img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .login-box h2 {
            color: #1b4332;
            font-size: 1.6rem;
            margin: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="welcome">Welcome to Pet Heaven</h1>

            <div class="login-options">
                <asp:Panel ID="UserLoginPanel" runat="server" CssClass="login-box" OnClick="UserLoginPanel_Click">
                    <h2>User Login</h2>
                </asp:Panel>

                <asp:Panel ID="EmployeeLoginPanel" runat="server" CssClass="login-box" OnClick="EmployeeLoginPanel_Click">
                    <h2>Admin</h2>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
