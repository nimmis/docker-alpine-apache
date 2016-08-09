    window.onload = function() {                                                          
       var root=document.getElementById('foo') ;                                          
       root.innerHTML = document.location; // location.protocol + '//' + location.host; //
//       setTimeout(function(){                                                             
//           document.body.style.backgroundImage="url('"+bg_pic+"')";                 
//           document.body.style.backgroundRepeat = "no-repeat";;                                  
//       },1000);                                                                                   
//
       setTimeout(function(){document.getElementById('pic').style.visibility = "visible";},800);
       setTimeout(function(){document.getElementById('foo').style.visibility = "visible";},2000); 
       setTimeout(function(){document.getElementById('foo2').style.visibility = "visible";},2000);
    }
