function sendSearchHotel()
{
    var motorAX;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        motorAX=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        motorAX=new ActiveXObject("Microsoft.XMLHTTP");
    }
        
    motorAX.onreadystatechange=function()
    {
        if (motorAX.readyState==4 && motorAX.status==200)
        {
            document.getElementById("formResult").innerHTML=motorAX.responseText;
        }
    }
    var ciudad = document.getElementById("busqCiudadHotel").value;
    
    var cadena = document.getElementById("busqCadenaHotel").value;
    var text = document.getElementById("textSearch").value;
    var params = "busqCiudadHotel="+ciudad+"&busqCadenaHotel="+cadena+"&textSearch="+text;
    
    motorAX.open("POST","BuscarHotel",false);
    motorAX.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    motorAX.send(params);
}

function sendSearchVuelo()
{
    var motorAX;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        motorAX=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        motorAX=new ActiveXObject("Microsoft.XMLHTTP");
    }
        
    motorAX.onreadystatechange=function()
    {
        if (motorAX.readyState==4 && motorAX.status==200)
        {
            document.getElementById("formResult").innerHTML=motorAX.responseText;
        }
    }
    var numVuelo = document.getElementById("busqNumVuelo").value;
    
    var comp = document.getElementById("busqCompany").value;
    
    var from = document.getElementById("busqFrom").value;
    
    var departHour = document.getElementById("busqDepartHour").value;
    
    var to = document.getElementById("busqTo").value;
    
    var arriveHour = document.getElementById("busqArriveHour").value;
    
    var params = "busqNumVuelo="+numVuelo+"&busqCompany="+comp+"&busqFrom="+from+"&busqDepartHour="+departHour+"&busqTo="+to+"&busqArriveHour="+arriveHour;
    
    motorAX.open("POST","buscarVuelo",false);
    motorAX.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    motorAX.send(params);
}

function getnumHab()
{
    var motorAX;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        motorAX=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        motorAX=new ActiveXObject("Microsoft.XMLHTTP");
    }
        
    motorAX.onreadystatechange=function()
    {
        if (motorAX.readyState==4 && motorAX.status==200)
        {
            document.getElementById("result").innerHTML=motorAX.responseText;
        }
    }
    var hotel = document.getElementById("busqHotel").value;
    var fecha = document.getElementById("fecha").value;
    var webservice = document.getElementById("webservice").value;
  
    var params = "webservice="+webservice+"&fecha="+fecha+"&hotel="+hotel;
    
    motorAX.open("POST","consultarHabitacionesHotel",false);
    motorAX.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    motorAX.send(params);
}
