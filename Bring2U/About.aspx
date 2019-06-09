<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Bring2U.About" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent_About" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
        <Series>
            <asp:Series Name="NumberOfDonations" XValueMember="ZipCode" YValueMembers="count"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
        <Series>
            <asp:Series ChartType="Bar" Name="Series1" XValueMember="ZipCode" YValueMembers="count">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <br />
    Make your custom chart to see inform about several Zip Codes:<br />
    <br />
    Type of Chart:
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>Bar</asp:ListItem>
        <asp:ListItem>Pie</asp:ListItem>
        <asp:ListItem>Area</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    Variable:
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
        <asp:ListItem>Veg</asp:ListItem>
        <asp:ListItem>Cooked</asp:ListItem>
        <asp:ListItem>Weight</asp:ListItem>
        <asp:ListItem>Price</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDBConnectionString %>" SelectCommand="SELECT [ZipCode], count([Id]) as count FROM [Donation] GROUP BY [ZipCode]"></asp:SqlDataSource>
    <br />
    <br />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodDBConnectionString %>" SelectCommand="SELECT [ZipCode], count([Id]) as count FROM [Donation] GROUP BY [ZipCode]"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
