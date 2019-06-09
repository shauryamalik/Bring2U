<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SignUpPage.aspx.cs" Inherits="Bring2U.SignUpPage" %>

<asp:Content ID="BodyContent_GetStarted" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <div>
          Name:
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
          <br />
    <br />
    Username:
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
          <br />
    <br />
    Password:
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
          <br />
    <br />
    ZipCode:
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
          <br />
    <br />
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>Donor</asp:ListItem>
        <asp:ListItem>Receiver</asp:ListItem>
        <asp:ListItem>Business</asp:ListItem>
    </asp:RadioButtonList>
          <br />
          <br />
          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Sign Up" />
          <br />
          <br />
          <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
    </div>

  
    </asp:Content>