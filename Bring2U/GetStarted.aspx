<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="GetStarted.aspx.cs" Inherits="Bring2U.GetStarted" %>


<asp:Content ID="BodyContent_GetStarted" ContentPlaceHolderID="MainContent" runat="server">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 20%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  right: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
 
 }
    .auto-style1 {
        padding: 16px;
        position: relative;
        float: right;
        left: 146px;
        top: 3px;
    }
    .auto-style2 {
        width: 322px;
        height: 224px;
    }
    .auto-style3 {
        padding: 16px;
        position: center;
        float: right;
        left: -54px;
        top: -136px;
    }
    .auto-style4 {
        width: 444px;
        height: 330px;
    }
    .auto-style5 {
        width: 431px;
        margin-left: 500px;
    }
    .auto-style6 {
        width: 431px;
    }
    </style>
<div style="width: 1000px; height: 500px;">

    <p class="auto-style5" >&nbsp;</p>
<%--    <p class="auto-style5" >
    <asp:Button ID="Button3" runat="server" Text="Sign Up" OnClick="Button3_Click" />
    </p>--%>
<div id="login_signup" class="auto-style3">
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
<%--<button onclick="document.getElementById('id02').style.display='block'" style="width:auto;">Sign Up</button>--%>
    &nbsp;&nbsp;&nbsp;
</div>
    <br />
    <br />
    <br />
<div id="id01" class="modal">
  
  <form class="modal-content animate" action="/action_page.php">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="../img/login.png" alt="Avatar" class="avatar">
    </div>
    <br /><br /><br /><br /><br /><br />

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="uname" id="username" runat="server" required />
        <br /><br /><br /><br />

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" id="password" runat="server" required />
        <br /><br /><br /><br />

      <%--<button type="button" runat="server" onserverclick="BtnLogin_Click">Login</button>--%>
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="BtnLogin_Click" />
    </div>
      <br /><br /><br /><br />

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      
    </div>
  </form>
</div>


<div id="id02" class="modal">
  
  <form class="modal-content animate" action="/action_page.php">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="../img/signup.png" alt="Avatar" class="avatar">
    </div>
      <br /><br /><br /><br /><br /><br />
    <div class="container">
      <label for="uname2l"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="uname2" id="uname2" runat="server" required />
        <br /><br /><br /><br />

      <label for="psw2l"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw2" id="pwd2" runat="server" required />
        <br /><br /><br /><br />

      <label for="name"><b>Name</b></label>
      <input type="text" placeholder="Enter Name" name="name2" id="name2" runat="server" required />
        <br /><br /><br /><br />

      <label for="zip"><b>Zipcode</b></label>
      <input type="text" placeholder="Enter Zipcode" name="zip2" id="zip2" runat="server" required maxlength="5" />
      <br /><br /><br /><br />

        <label for="utype"><b>User Type</b></label>
        <br /><br />
        <form>
          <input type="radio"  id="DonorRadio" name="TypeValue" value="Donor" checked runat="server" /> Donor<br>
          <input type="radio"  id="ReceiverRadio" name="TypeValue" value="Receiver" runat="server" /> Receiver<br>
          <input type="radio"  id="BusinessRadio" name="TypeValue" value="Business" runat="server" /> Business
                
      </form>
        <br /><br /><br /><br />

      <%--<button type="button" runat="server" onserverclick="BtnSignup_Click">Sign Up</button>--%>
        <asp:Button ID="Button2" runat="server" Text="Sign Up" OnClick="BtnSignup_Click" />
    </div>

    <div class="auto-style1" style="background-color:#f1f1f1;">
      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
      
    </div>
  </form>
</div>

<script>
    // Get the modal
    var modal = document.getElementById('id01');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

<script>
    // Get the modal
    var modal = document.getElementById('id02');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</asp:Content>