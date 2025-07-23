<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="YourNamespace.Form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Adoption Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma;
            background-color: #f4f4f4;
            padding: 40px;
            position: relative;
        }
        .form-container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #2d6a4f;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        .btn-submit, .btn-pets, .btn-logout {
            background-color: #2d6a4f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn-submit:hover, .btn-pets:hover, .btn-logout:hover {
            background-color: #1b4332;
        }
        .pet-details {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #e8f5e9;
            border-left: 5px solid #2d6a4f;
        }
        /* Logout button top-right */
        .logout-container {
            position: fixed;
            top: 20px;
            right: 30px;
        }
        .confirmation-message {
            text-align: center;
            font-size: 18px;
            color: #2d6a4f;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Logout Button Top Right -->
        <div class="logout-container">
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-logout" OnClick="btnLogout_Click" />
        </div>

        <!-- Adoption Form Panel -->
        <asp:Panel ID="pnlForm" runat="server" Visible="true">
            <div class="form-container">
                <h2>Adoption Form</h2>

                <div class="pet-details">
                    <p><strong>Pet ID:</strong> <asp:Label ID="lblPetID" runat="server" /></p>
                    <p><strong>Pet Name:</strong> <asp:Label ID="lblPetName" runat="server" /></p>
                    <p><strong>Price:</strong> ₹<asp:Label ID="lblPrice" runat="server" /></p>
                </div>

                <div class="form-group">
                    <label for="txtName">Your Name</label>
                    <asp:TextBox ID="txtName" runat="server" />
                </div>

                <div class="form-group">
                    <label for="txtPhone">Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" />
                </div>

                <div class="form-group">
                    <label for="txtAddress">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" />
                </div>

                <asp:Button ID="btnSubmit" runat="server" Text="Submit Adoption Request" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            </div>
        </asp:Panel>

        <!-- Confirmation Panel -->
        <asp:Panel ID="pnlConfirmation" runat="server" Visible="false">
            <div class="form-container">
                <div class="confirmation-message">
                    <asp:Label ID="lblConfirmation" runat="server" Text=""></asp:Label>
                </div>
                <asp:Button ID="btnPets" runat="server" Text="Back to Pets" CssClass="btn-pets" OnClick="btnPets_Click" />
            </div>
        </asp:Panel>
    </form>
</body>
</html>