<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CommunityList.aspx.cs" Inherits="Bring2U.CommunityList" %>

<asp:Content ID="BodyContent_Donor" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <asp:Label ID="Label2" runat="server" Text="Enter ZIP Code"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            


            <br />
            <br />
            


            <asp:Label ID="Label1" runat="server" Text="Enter Radius"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Enter Unit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Height="16px">
                <asp:ListItem Selected="True">km</asp:ListItem>
                <asp:ListItem>mile</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get Pin Codes" />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Insert JSON here"></asp:Label>
        </div>
    
         </asp:Content>