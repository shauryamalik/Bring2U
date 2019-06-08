<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewReceiver.aspx.cs" Inherits="Bring2U.NewReceiver" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
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
</style>
<body style="margin:0px;">
  <div style="height:150px;background-color:#000000;width:100%;">
</div>
    <div style="margin-top:-20px;background-color:#ffe4b5;height:30px;">
        <h2>WE ARE HERE TO HELP</h2>
    </div>
    <div class="row">
    <div class="column"><label class="switch"><input type="checkbox" id="togBtn"><div class="slider round"><!--ADDED HTML --><span class="on">VEG</span><span class="off">NON VEG</span><!--END--></div></label></div>
 
 <div class="column1"><label class="switch1"><input type="checkbox" id="togBtn"><div class="slider round"><!--ADDED HTML --><span class="on">DONATE</span><span class="off">PAY</span><!--END--></div></label></div>  
    </div>
    <!--food-list-->
    <h2 style="margin-bottom:3px;">Food List</h2>
    <div class="row">
         <!--smaller div-->
        <div class="ScrollStyle">
            <div style="height:80px;background-color:#fff;padding-bottom: 10px;border-bottom: 3px solid #4588ba; margin-bottom:10px;">
            <form><input type="text" id="FoodName"placeholder="ENTER FOOD NAME"><br /><br /><input type="text" name="firstname"placeholder="Entry Date">&nbsp;&nbsp;<input type="text" name="firstname"placeholder="Expiry Date"><button onclick="myFunction()"class=" btn-primary"><i class="fa fa-paper-plane"></i>ADD TO CART</button></form>
               
            </div>
           
            <div style="height:80px;background-color:#fff;padding-bottom: 10px;border-bottom: 3px solid #4588ba; margin-bottom:10px;">
            <form><input type="text" id="FoodName"placeholder="ENTER FOOD NAME"><br /><br /><input type="text" name="firstname"placeholder="Entry Date">&nbsp;&nbsp;<input type="text" name="firstname"placeholder="Expiry Date"><button onclick="myFunction()"class=" btn-primary"><i class="fa fa-paper-plane"></i>ADD TO CART</button></form></div>
            <div style="height:80px;background-color:#fff;padding-bottom: 10px;border-bottom: 3px solid #4588ba; margin-bottom:10px;">
            <form><input type="text"  id="FoodName"placeholder="ENTER FOOD NAME"><br /><br /><input type="text" name="firstname"placeholder="Entry Date">&nbsp;&nbsp;<input type="text" name="firstname"placeholder="Expiry Date"><button onclick="myFunction()"class=" btn-primary"><i class="fa fa-paper-plane"></i>ADD TO CART</button></form></div>
            <div style="height:80px;background-color:#fff;padding-bottom: 10px;border-bottom: 3px solid #4588ba; margin-bottom:10px;">
            <form><input type="text"  id="FoodName"placeholder="ENTER FOOD NAME"><br /><br /><input type="text" name="firstname"placeholder="Entry Date">&nbsp;&nbsp;<input type="text" name="firstname"placeholder="Expiry Date"><button onclick="myFunction()"class=" btn-primary"><i class="fa fa-paper-plane"></i>ADD TO CART</button></form></div>
            <div style="height:80px;background-color:#fff;padding-bottom: 10px;border-bottom: 3px solid #4588ba; margin-bottom:10px;">
            <form><input type="text"  id="FoodName"placeholder="ENTER FOOD NAME"><br /><br /><input type="text" name="firstname"placeholder="Entry Date">&nbsp;&nbsp;<input type="text" name="firstname"placeholder="Expiry Date"><button onclick="myFunction()"class=" btn-primary"><i class="fa fa-paper-plane"></i>ADD TO CART</button></form></div>
        </div>
        <!-- storing data to other div-->
        <div class="ScrollStyle1"><p id="demo"></p><script>function myFunction() {
    var x = document.getElementById("FoodName").value;
    var sum = "";
    for (var i = 0; i < x.length; i++) {
        var n = x[i].value;
        sum = sum + n;
        var node = document.createElement("LI");                 // Create a <li> node
        var textnode = document.createTextNode(sum);

        node.appendChild(textnode);                              // Append the text to <li>
        document.getElementById("demo").appendChild(node);
    }
   
                                                         
                                                       }     // Append <li> to <ul> with id="myList"

                   </script> </div>
        <!--pick up and delivery button -->
       <a href="aa.html"> <button style="height:30px;background-color:#4588ba;border-radius: 30px;margin-left:900px;"><i class="fa fa-home"></i>PICK UP</button></a>&nbsp;&nbsp;<button style="height:30px;background-color:#4588ba;border-radius: 30px;"><i class="fa fa-motorcycle"></i>DELIVERY</button>
     <button style="height:30px;background-color:#4588ba;border-radius: 30px;margin-left:900px;"><i class="fa fa-address-book"></i>PAST ORDERS</button></a>
    </div>
   
</body>
</html>