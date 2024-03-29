﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tempMap.aspx.cs" Inherits="Bring2U.tempMap" %>

<asp:label runat="server" text="Label" id="label1"></asp:label>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"/>

    <style>
        #mapContainer {
            height: 180px;
        }
    </style>

</head>
<body>
    <div id="mapContainer"></div>
    <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"></script>

    <script id="mapScript">
        
        var mymap = L.map('mapContainer').setView([51.505, -0.09], 13);
        //L.tileLayer('https://api.tiles.mapbox.com/v4/{lucifer1sm}/{z}/{x}/{y}.png?access_token={pk.eyJ1IjoibHVjaWZlcjFzbSIsImEiOiJjanduZmJnZ3YxbHY3NDhxa3gxbTYzMzBvIn0.KzP0Wfe4pfwYBSr1vjJFYg}', {
        //    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        //    maxZoom: 18,
        //    id: 'mapbox.streets',
        //    accessToken: 'pk.eyJ1IjoibHVjaWZlcjFzbSIsImEiOiJjanduZmJnZ3YxbHY3NDhxa3gxbTYzMzBvIn0.KzP0Wfe4pfwYBSr1vjJFYg'
        //}).addTo(mymap);
        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(mymap);
        <%--var testArray = <%=JavaScript.Serialize(this.lats) %>;--%>
        var marker = L.marker([51.5, -0.09]).addTo(mymap);
        //var circle = L.circle([51.508, -0.11], {
        //    color: 'red',
        //    fillColor: '#f03',
        //    fillOpacity: 0.5,
        //    radius: 500
        //}).addTo(mymap);
        //var polygon = L.polygon([
        //    [51.509, -0.08],
        //    [51.503, -0.06],
        //    [51.51, -0.047]
        //]).addTo(mymap);
        ////marker.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
        //circle.bindPopup("I am a circle.");
        //polygon.bindPopup("I am a polygon.");
        //var popup = L.popup()
        //    .setLatLng([51.5, -0.09])
        //    .setContent("I am a standalone popup.")
        //    .openOn(mymap);
        

        function onMapClick(e) {
            popup
                .setLatLng(e.latlng)
                .setContent("You clicked the map at " + e.latlng.toString())
                .openOn(mymap);
        }
        mymap.on('click', onMapClick);
    </script>

</body>
</html>

<!--<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css" />
    <style>


        #mapid {
            height: 180px;
        }
    </style>
</head>
<body>
    <div id="mapid"></div>
    <script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js"></script>
    <script>

        var mymap = L.map('mapid').setView([51.505, -0.09], 13);

        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(mymap);


    </script>
</body>
</html>-->