<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Money_Donate.aspx.cs" Inherits="Bring2U.Money_Donate" %>

<asp:Content ID="BodyContent_MoneyDonate" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #fileds {
            margin-bottom: 2px;
        }
        #Label2, #Label3, #Label4, #Label5, #Label6, #Label7, #Label8 {
            display:block; float:left; width:150px;
        }
    </style>
        <div id="message">
            <p style="margin-left: 160px">&nbsp;</p>
            <p style="margin-left: 160px">&nbsp;</p>
            <h1 style="margin-left: 160px"><asp:Label ID="Label1" runat="server" Text="Please enter your details"></asp:Label>:</h1>
            <p style="margin-left: 160px">&nbsp;</p>
            <p style="margin-left: 160px">&nbsp;</p>
        </div>
        <div id="fields" style="margin-left: 360px">
            <p>
                <asp:Label ID="Label2" runat="server" Text="Name" Font-Bold="True"> </asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="Your name contains special characters!!"  ValidationExpression="^[a-zA-Z'.\s]{3,50}"></asp:RegularExpressionValidator>  

            </p>
            <br />
                <asp:Label ID="Label3" runat="server" Text="Phone Number" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please fill the valid number!"  ValidationExpression="^[8-9][0-9]{9}"></asp:RegularExpressionValidator>  


            <p>
                <asp:Label ID="Label4" runat="server" Text="Amount" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please fill the valid amount!"  ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>  
            </p>
        </div>
        <p style="margin-left: 360px">
            <asp:Label ID="Label5" runat="server" Text="Card Number" Font-Bold="True"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please fill the valid Card number!"  ValidationExpression="[0-9]{16}"></asp:RegularExpressionValidator>
        </p>
        <div id="fields">

            <p style="margin-left: 360px">
                <asp:Label ID="Label6" runat="server" Text="Name on the Card" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="Your name contains special characters!!"  ValidationExpression="^[a-zA-Z'.\s]{3,50}"></asp:RegularExpressionValidator>  

            </p>
            <p style="margin-left: 360px">
                <asp:Label ID="Label7" runat="server" Text="Valid Till" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage="Please enter valid date!"  ValidationExpression="[0-9]{2}/[0-9]{2}"></asp:RegularExpressionValidator>  

            </p>
        </div>
        <p style="margin-left: 360px">
                <asp:Label ID="Label8" runat="server" Text="CVV" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox7" ErrorMessage="Please fill the valid CVV!"  ValidationExpression="^[1-9][0-9]{2}"></asp:RegularExpressionValidator>  

            </p>
        <p style="margin-left: 680px">
                <asp:Button ID="Button1" runat="server" Text="Submit"  OnClick="Display"/>
            </p>

    </asp:Content>