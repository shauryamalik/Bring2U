<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Business.aspx.cs" Inherits="Bring2U.Business" %>


<asp:Content ID="BodyContent_Donor" ContentPlaceHolderID="MainContent" runat="server">
        
    <style type="text/css">
        .inlineBlock { display: inline-block;}
    </style>
        <div>
            <asp:Panel ID="Panel1" runat="server" Width="45%" CssClass="inlineBlock" Height="400px" ScrollBars="Vertical">
                <h3>New Donation</h3><br />
                <br />
                Item Name:
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter" ControlToValidate="TextBox1" ></asp:RequiredFieldValidator>
                <br />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Veg</asp:ListItem>
                    <asp:ListItem>NonVeg</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="*Enter"></asp:RequiredFieldValidator>
                <br />
                Approx Weight:
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Enter"></asp:RequiredFieldValidator>
                <br />
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Cooked</asp:ListItem>
                    <asp:ListItem>Non Cooked</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                MRP:
                <asp:TextBox ID="TextBoxMRP" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Enter" ControlToValidate="TextBoxMRP"></asp:RequiredFieldValidator>
                <br />
                Price (should be 50% of MRP):
                <asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Enter" ControlToValidate="TextBoxPrice"></asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList2" ErrorMessage="*Enter"></asp:RequiredFieldValidator>
                Expiry Date:<asp:Calendar ID="Calendar1" runat="server" Height="16px" Width="16px"></asp:Calendar>
                
                <br />

                Address:
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="*Enter"></asp:RequiredFieldValidator>
                <br />
                Pin Code:
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="*Enter"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />

                <asp:Label ID="Label1" runat="server"></asp:Label>

            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Width="45%" CssClass="inlineBlock" Height="400px" ScrollBars="Vertical">
                <h3>Past Orders</h3><br />
                <asp:Button ID="Button2" runat="server" Text="Refresh" OnClick="Button2_Click"/><br /><br />
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDBConnectionString %>" SelectCommand="SELECT [ItemName] FROM [Donation]"></asp:SqlDataSource>
            </asp:Panel>
            <br />
        </div>
    </asp:Content>
