<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="NewReceiver.aspx.cs" Inherits="Bring2U.NewReceiver" %>

<asp:Content ID="BodyContent_Receiver" ContentPlaceHolderID="MainContent" runat="server">

     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

<style>
.switch {
  position: relative;
  display: inline-block;
  width: 90px;
  height: 34px;
  margin-left:40px;
  margin-top:30px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ca2222;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2ab934;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(55px);
  -ms-transform: translateX(55px);
  transform: translateX(55px);
}

/*------ ADDED CSS ---------*/
.on
{
  display: none;
}

.on
{
  color: white;
  position: absolute;
  transform: translate(-50%,-50%);
  top: 50%;
  left: 30%;
  font-size: 10px;
  font-family: Verdana, sans-serif;
}
.off
{
  color: white;
  position: absolute;
  transform: translate(-50%,-50%);
  top: 50%;
  left: 60%;
  font-size: 10px;
  font-family: Verdana, sans-serif;
}
input:checked+ .slider .on
{display: inline-block;}

input:checked + .slider .off
{display: none;}

/*--------- END --------*/

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;}
.switch1 {
  position: relative;
  display: block;
  width: 90px;
  height: 34px;
  margin-right:30px;
  margin-top:30px;
}

.switch1 input {display:none;}

* {
  box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 70px; /* Should be removed. Only for demonstration */
}
.column1 {
  float: left;
  width: 50%;
  padding: 10px;
  height: 70px; /* Should be removed. Only for demonstration */
}
.column2 {
  float: left;
  width: 50%;
  padding: 10px;
  height: 700px; /* Should be removed. Only for demonstration */
  background-color:powderblue;
}
        .column3 {
            float: left;
            width: 50%;
            padding: 10px;
            height: 700px; /* Should be removed. Only for demonstration */
            background-color: #cccccc;
        }
        .ScrollStyle{
            max-height:300px;
            overflow-y:scroll;
             float: left;
             width: 50%;
            padding: 10px;
            height: 700px; /* Should be removed. Only for demonstration */
            background-color:powderblue;
            margin-bottom:50px;
        }
        .ScrollStyle1{
            max-height:300px;
            overflow-y:scroll;
              float: left;
            width: 50%;
            padding: 10px;
            height: 700px; /* Should be removed. Only for demonstration */
            background-color: #cccccc;
            margin-bottom:50px;
        }

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
.btn-primary{
    background-color:#2196F3;
    margin-left:120px;
}
#block{
    height:80px;
    background-color:#fff;
    padding-bottom: 10px;
    border-bottom: 3px solid #4588ba;
    margin-bottom:10px;

}
</style>
  <div style="height:150px;background-color:#000000;width:100%;">
</div>
    <div style="margin-top:-20px;background-color:#ffe4b5;height:30px;">
        <h2>WE ARE HERE TO HELP</h2>
    </div>
    <div class="row">
    <div class="column"><label class="switch"><input type="checkbox" id="togBtn" runat="server"/><div class="slider round"><!--ADDED HTML --><span class="on">VEG</span><span class="off">NON VEG</span><!--END--></div></label></div>
 
 <div class="column1"><label class="switch1"><input type="checkbox" id="togBtn2" runat="server"/><div class="slider round"><!--ADDED HTML --><span class="on">FREE</span><span class="off">PAID</span><!--END--></div></label></div>  
    </div>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Refresh" OnClick="Button1_Click" />
    
<%--    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>--%>
    <!--food-list-->
    <h2 style="margin-bottom:3px;">Food List</h2>
    <div class="row">
         <!--smaller div-->
        <div class="ScrollStyle" id="temp1">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
           <%-- <button style="height:30px;background-color:#4588ba;border-radius: 30px;margin-left:900px;" runat="server" onserverclick="BookButton_Click"><i class="fa fa-address-book"></i>BOOK</button>--%>
            <br />
            <%--<button runat="server" onserverclick="Button2_Click"></button>--%>
            <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" UseSubmitBehavior="False" />
            </div>
             <div class="ScrollStyle1">
                 <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>                                   
         </div>
 <button style="height:30px;background-color:#4588ba;border-radius: 30px;margin-left:900px;" ><i class="fa fa-home"></i>PICK UP</button></a>&nbsp;&nbsp;
        <button style="height:30px;background-color:#4588ba;border-radius: 30px;"><i class="fa fa-motorcycle"></i>DELIVERY</button>
     <button style="height:30px;background-color:#4588ba;border-radius: 30px;margin-left:900px;" ><i class="fa fa-address-book"></i>PAST ORDERS</button>
        
    </div>
   
    </asp:Content>