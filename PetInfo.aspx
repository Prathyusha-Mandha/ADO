<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PetInfo.aspx.cs" Inherits="YourNamespace.PetInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pet Info - Pet Heaven</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma;
            background-color: #f2f2f2;
            padding: 30px;
            margin: 0;
        }
        .header-bar {
            background-color: #2d6a4f;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-radius: 6px;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }
        .header-title {
            font-size: 24px;
            text-align: center;
            width: 100%;
            font-weight: bold;
        }
        .logout-link {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 6px 12px;
            border: 1px solid white;
            border-radius: 4px;
        }
        .panel {
            max-width: 1200px;
            margin: auto;
            background: white;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
        }
        .pet-card {
            background: white;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: center;
        }
        .pet-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 6px;
        }
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            color: white;
            cursor: pointer;
            margin-top: 10px;
            background-color: #ff6b6b;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="header-bar">
            <div class="header-title">Pet Info</div>
            <asp:LinkButton ID="lnkLogout" runat="server" CssClass="logout-link" OnClick="btnLogout_Click">Logout</asp:LinkButton>
        </div>

        <!-- Pets Panel -->
        <asp:Panel ID="pnlPets" runat="server" CssClass="panel">
            <asp:DropDownList ID="ddlPetType" runat="server">
                <asp:ListItem Text="All" Value="All" />
                <asp:ListItem Text="Dog" Value="Dog" />
                <asp:ListItem Text="Cat" Value="Cat" />
                <asp:ListItem Text="Rabbit" Value="Rabbit" />
            </asp:DropDownList>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <br /><br />
            <div class="grid-container">
                <asp:Repeater ID="RepeaterPets" runat="server">
                    <ItemTemplate>
                        <div class="pet-card">
                            <img src='<%# Eval("PetImage") %>' alt='<%# Eval("PetName") %>' />
                            <h3><%# Eval("PetName") %></h3>
                            <p><strong>Breed:</strong> <%# Eval("Breed") %></p>
                            <p><strong>Age:</strong> <%# Eval("Age") %></p>
                            <p><strong>Type:</strong> <%# Eval("PetType") %></p>
                            <p><strong>Price:</strong> ₹<%# Eval("Price") %></p>
                            <asp:HyperLink 
                                ID="lnkAdopt" runat="server" 
                                CssClass="btn" 
                                Text="Adopt" 
                                NavigateUrl='<%# "Form.aspx?PetID=" + Eval("PetID") %>' />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </asp:Panel>

    </form>
</body>
</html>
