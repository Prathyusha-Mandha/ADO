<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdoptionRequests.aspx.cs" Inherits="YourNamespace.AdoptionRequests" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Adoption Requests - Employee</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f0f0f0;
            padding: 20px;
        }
        .grid {
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            width: 95%;
        }
        h2 {
            text-align: center;

            color: #333;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th, .table td {
            border: 1px solid #aaa;
            padding: 10px;
            text-align: center;
        }
        .table th {
            background-color: #2d6a4f;
            color: white;
        }
        .btn {
            padding: 5px 10px;
            background-color: #2d6a4f;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #1b4332;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="grid">
            <h2>Adoption Requests</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="RequestID" HeaderText="Request ID" />
                    <asp:BoundField DataField="PetID" HeaderText="Pet ID" />
                    <asp:BoundField DataField="Name" HeaderText="User Name" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnAccept" runat="server" Text="Accept" CssClass="btn"
                                CommandName="AcceptRequest" CommandArgument='<%# Eval("RequestID") %>'
                                Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
