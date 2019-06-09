<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="calamity.aspx.cs" Inherits="Bring2U.calamity" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
   <!--  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"/>-->
    <style>
        * {
  box-sizing: border-box;
}
.header {
  
  width: 100%;
  height: 150px; /* Should be removed. Only for demonstration */
  background-color:#000000;
}

/* Create two equal columns that floats next to each other */
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
 
      
/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
.button1{
    height:90px;
    width:90px;
    margin-left:120px;
    background-color:#003456;
   margin-bottom:30px;
   color:#fff;
   border-radius:50%;
}
    </style>
  

    <div class="header"></div>
    <div class="row">
    <div class="column">
        <div><a href="Donor.aspx"><input type="button"class="button1" value="Donate" /></a></div>
        <div><a href="NewReceiver.aspx"><input type="button"class="button1" value="Request" /></a></div>
        <div><a href="Money_Donate.aspx"><input type="button"class="button1" value="Donate $" /></a></div>
        
    </div>
 
 <div class="column1">
     <iframe src ="temp.html" width="790" height="340"></iframe>
 </div>  
    </div>
       
  
    </asp:Content>
    
