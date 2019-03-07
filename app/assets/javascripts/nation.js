

function next_eco() {
  $.ajax({
    method: "GET",
    url: window.location.origin + '/nation/exit'
  })
}

function update_obj(element) {
  $.ajax({
    method: "GET",
    data:{
     id: element.getAttribute("data-oid")
    },
    url: window.location.origin + '/nation/clicked'
  })
  .done(function(response) {
    $("#c-nation").text(response["nation"]);
    if(response["enabled"]){
      $(element).addClass("btn-objective-enabled").removeClass("btn-objective")
      $(element).css("background",response["color"]);
    }else{
      $(element).removeClass("btn-objective-enabled").addClass("btn-objective")
      $(element).css("background","rgba(20,20,20,0.5)");
    }
  })
}
