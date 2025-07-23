<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pet.aspx.cs" Inherits="YourNamespace.Pet" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pet Heaven Management</title>
    <style>
        /* General styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            padding: 30px;
            margin: 0;
        }
        /* Header bar */
        .header-bar {
            background-color: #2d6a4f;
            color: white;
            padding: 10px 5px;
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
            font-weight: bold;
            text-align: center;
            width: 100%;
        }
        .logout-link {
            color: white;
            text-decoration: none;
            font-weight: bold;
            cursor: pointer;
            padding: 6px 12px;
            border: 1px solid white;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .logout-link:hover {
            background-color: #1b4332;
        }
        /* Tabs */
        .tabs {
            max-width: 1200px;
            margin: 0 auto 20px auto;
        }
        .tab-btn {
            display: inline-block;
            padding: 10px 25px;
            background: #ddd;
            cursor: pointer;
            border-radius: 6px 6px 0 0;
            margin-right: 4px;
            font-weight: bold;
            user-select: none;
            color: #333;
            border: 1px solid #ccc;
            border-bottom: none;
        }
        .tab-btn.active {
            background: #2d6a4f;
            color: white;
            border-color: #2d6a4f;
        }
        /* Container */
        .container {
            max-width: 1200px;
            margin: auto;
            background: white;
            border-radius: 0 6px 6px 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
        }
        /* Panels */
        .panel {
            display: none;
        }
        .panel.active {
            display: block;
        }
        /* Pets layout side-by-side */
        .pets-container {
            display: flex;
            gap: 40px;
            flex-wrap: wrap;
        }
        .table-section {
            flex: 2;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px 12px;
            text-align: center;
            word-wrap: break-word;
        }
        th {
            background-color: #2d6a4f;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f0f0f0;
        }
        .image-cell img {
            max-width: 60px;
            max-height: 50px;
            object-fit: cover;
            border-radius: 4px;
        }
        .form-section {
            flex: 1;
            background: white;
            padding: 20px 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            height: fit-content;
            max-width: 400px;
        }
        .form-section h2 {
            margin-top: 0;
            margin-bottom: 15px;
            color: #2d6a4f;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #333;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 8px 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        .btn {
            flex: 1;
            padding: 10px;
            background-color: #2d6a4f;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #1b4332;
        }
        .btn.delete-btn {
            background-color: #b33939;
        }
        .btn.delete-btn:hover {
            background-color: #7a1d1d;
        }
        #lblMessage {
            margin-top: 15px;
            font-weight: bold;
            text-align: center;
        }
        .gridview-table tr td, .gridview-table tr th {
            vertical-align: middle;
        }
        /* Accept/Decline buttons side by side */
        .btn-accept, .btn-decline {
            background-color: #2d6a4f;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            margin-right: 5px;
            display: inline-block;
            min-width: 60px;
            text-align: center;
        }
        .btn-accept[disabled], .btn-decline[disabled] {
            background-color: #888;
            cursor: default;
        }
        .btn-decline {
            background-color: #b33939;
        }
        .btn-decline:hover:not([disabled]) {
            background-color: #7a1d1d;
        }
        .action-btns {
            display: flex;
            gap: 8px; /* space between buttons */
            justify-content: center; /* center buttons horizontally */
            align-items: center;

        }

    </style>

    <script>
        function switchTab(tabName) {
            var petsPanel = document.getElementById('<%= pnlPets.ClientID %>');
            var requestsPanel = document.getElementById('<%= pnlRequests.ClientID %>');
            var btnPets = document.getElementById('<%= btnTabPets.ClientID %>');
            var btnRequests = document.getElementById('<%= btnTabRequests.ClientID %>');

            if (tabName === 'pets') {
                petsPanel.classList.add('active');
                requestsPanel.classList.remove('active');
                btnPets.classList.add('active');
                btnRequests.classList.remove('active');
            } else {
                petsPanel.classList.remove('active');
                requestsPanel.classList.add('active');
                btnPets.classList.remove('active');
                btnRequests.classList.add('active');
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">

        <!-- Header bar -->
        <div class="header-bar">
            <div class="header-title">Pet Heaven Management</div>
            <asp:LinkButton ID="lnkLogout" runat="server" CssClass="logout-link" OnClick="lnkLogout_Click">Logout</asp:LinkButton>
        </div>

        <!-- Tabs -->
        <div class="tabs">
            <asp:Button ID="btnTabPets" runat="server" CssClass="tab-btn active" Text="Pets" OnClick="btnTabPets_Click" UseSubmitBehavior="false" />
            <asp:Button ID="btnTabRequests" runat="server" CssClass="tab-btn" Text="Adoption Requests" OnClick="btnTabRequests_Click" UseSubmitBehavior="false" />
        </div>

        <!-- Container -->
        <div class="container">

            <!-- Pets Panel -->
            <asp:Panel ID="pnlPets" runat="server" CssClass="panel active">
                <div class="pets-container">
                    <!-- Table -->
                    <div class="table-section">
                        <asp:GridView ID="GridViewPets" runat="server" AutoGenerateColumns="False"
                            AllowPaging="True" PageSize="6"
                            OnPageIndexChanging="GridViewPets_PageIndexChanging"
                            OnSelectedIndexChanged="GridViewPets_SelectedIndexChanged"
                            DataKeyNames="PetID" CssClass="gridview-table"
                            PagerSettings-Mode="NextPrevious"
                            PagerSettings-NextPageText="Next"
                            PagerSettings-PreviousPageText="Previous"
                            SelectedRowStyle-BackColor="#c4f0c5"
                            >
                            <Columns>
                                <asp:BoundField DataField="PetID" HeaderText="ID" ReadOnly="True" />
                                <asp:BoundField DataField="PetName" HeaderText="Pet Name" />
                                <asp:BoundField DataField="Breed" HeaderText="Breed" />
                                <asp:BoundField DataField="Age" HeaderText="Age (Years)" />
                                <asp:BoundField DataField="PetType" HeaderText="Type" />
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <div class="image-cell">
                                            <img src='<%# Eval("PetImage") %>' alt="Pet Image" />
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Price" HeaderText="Price (₹)" DataFormatString="{0:N2}" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                            </Columns>
                        </asp:GridView>
                    </div>

                    <!-- Form -->
                    <div class="form-section">
                        <h2 id="formTitle" runat="server">Add New Pet</h2>

                        <asp:HiddenField ID="hfPetID" runat="server" />

                        <div class="form-group">
                            <label for="txtPetName">Pet Name</label>
                            <asp:TextBox ID="txtPetName" runat="server" />
                        </div>

                        <div class="form-group">
                            <label for="txtBreed">Breed</label>
                            <asp:TextBox ID="txtBreed" runat="server" />
                        </div>

                        <div class="form-group">
                            <label for="txtAge">Age (Years)</label>
                            <asp:TextBox ID="txtAge" runat="server" TextMode="Number" />
                        </div>

                        <div class="form-group">
                            <label for="ddlPetType">Pet Type</label>
                            <asp:DropDownList ID="ddlPetType" runat="server">
                                <asp:ListItem Text="Select Type" Value="" />
                                <asp:ListItem Text="Dog" Value="Dog" />
                                <asp:ListItem Text="Cat" Value="Cat" />
                                <asp:ListItem Text="Rabbit" Value="Rabbit" />
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label for="txtPetImage">Image URL</label>
                            <asp:TextBox ID="txtPetImage" runat="server" />
                        </div>

                        <div class="form-group">
                            <label for="txtPrice">Price (₹)</label>
                            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" />
                        </div>

                        <div class="btn-group">
                            <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn" OnClick="btnAdd_Click" />
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" OnClick="btnUpdate_Click" Visible="false" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn delete-btn" OnClick="btnDelete_Click" Visible="false" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancel_Click" Visible="false" />
                        </div>

                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
                    </div>
                </div>
            </asp:Panel>

            <!-- Adoption Requests Panel -->
            <asp:Panel ID="pnlRequests" runat="server" CssClass="panel">
                <asp:GridView ID="GridViewRequests" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewRequests_RowCommand" CssClass="gridview-table" >
                    <Columns>
                        <asp:BoundField DataField="RequestID" HeaderText="Request ID" />
                        <asp:BoundField DataField="PetID" HeaderText="Pet ID" />
                        <asp:BoundField DataField="Name" HeaderText="User Name" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <div class="action-btns">
                                    <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandName="AcceptRequest"
                                        CommandArgument='<%# Eval("RequestID") %>' CssClass="btn-accept"
                                        Enabled='<%# Eval("Status").ToString() == "Pending" %>' />
                                    <asp:Button ID="btnDecline" runat="server" Text="Decline" CommandName="DeclineRequest"
                                        CommandArgument='<%# Eval("RequestID") %>' CssClass="btn-decline"
                                        Enabled='<%# Eval("Status").ToString() == "Pending" %>' />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>

        </div>

    </form>
</body>
</html>
