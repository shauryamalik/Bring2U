<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CommunityList.aspx.cs" Inherits="Bring2U.CommunityList" %>

<asp:Content ID="BodyContent_CommList" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .column {
          float: left;
          width: 30%;
          padding: 10px;
          height: 350px; /* Should be removed. Only for demonstration */
          background-color:#ccc;
        }
        .column1 {
          float: left;
          width: 70%;
          padding: 10px;
          height: 350px; /* Should be removed. Only for demonstration */
          background-color:#808080;
        }
    </style>
        <div class="column">
            <asp:Label ID="Label2" runat="server" Text="Enter ZIP Code"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredField" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
            
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Enter Radius"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredField" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
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
            <div class="column1">
                <%--<iframe src="tempMap.aspx?latArr=51.508111|32.455&lngArr=-0.111|-0.123" width="780" height="340" runat="server" id="mapframe"></iframe>--%>
                <iframe src="GetDirections.html" width="780" height="340"></iframe>
            </div>
         </asp:Content>