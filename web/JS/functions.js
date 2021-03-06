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
    
    motorAX.open("POST","consultaHabitacionesHotel",false);
    motorAX.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    motorAX.send(params);
}


function getnumPlazas()
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
    var vuelo = document.getElementById("busqVuelo").value;
    var fecha = document.getElementById("fecha").value;
    var webservice = document.getElementById("webservice").value;
  
    var params = "webservice="+webservice+"&fecha="+fecha+"&vuelo="+vuelo;
    
    motorAX.open("POST","consultaPlazasVuelo",false);
    motorAX.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    motorAX.send(params);
}

function setFecha(tipo)
{   
    if(document.getElementById("busqueda").value != "")
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
                document.getElementById("tdFecha").innerHTML=motorAX.responseText;
            }
        }
        var id = document.getElementById("busqueda").value;

        var params = "id="+id+"&tipo="+tipo;

        motorAX.open("POST","setFechaHotelVuelo",false);
        motorAX.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        motorAX.send(params);
    }
    else document.getElementById("tdFecha").innerHTML = "Pendiente del hotel"
}


function reservaHabitacionHotel()
{
    if(document.getElementById("busqueda").value != "")
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
        var hotel = document.getElementById("busqueda").value;
        var fecha = document.getElementById("fecha").value;
        var webservice = document.getElementById("webservice").value;

        var params = "hotel="+hotel+"&fecha="+fecha+"&webservice="+webservice;

        motorAX.open("POST","reservaHabitacionHotel",false);
        motorAX.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        motorAX.send(params);
    }
    else 
    {
        alert("Debes seleccionar un hotel");
    }
}

function reservaPlazaVuelo()
{
    if(document.getElementById("busqueda").value != "")
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
        var vuelo = document.getElementById("busqueda").value;
        var fecha = document.getElementById("fecha").value;
        var webservice = document.getElementById("webservice").value;

        var params = "vuelo="+vuelo+"&fecha="+fecha+"&webservice="+webservice;

        motorAX.open("POST","reservaPlazaVuelo",false);
        motorAX.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        motorAX.send(params);
    }
    else 
    {
        alert("Debes seleccionar un vuelo");
    }    
}