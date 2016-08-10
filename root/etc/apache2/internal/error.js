    window.onload = function() {                                                          
       root.innerHTML = document.location; // location.protocol + '//' + location.host; //
       setTimeout(function(){document.getElementById('pic').style.visibility = "visible";},800);
       setTimeout(function(){document.getElementById('foo').style.visibility = "visible";},2000); 
       setTimeout(function(){document.getElementById('foo2').style.visibility = "visible";},2000);
    }
