

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
    $(element).css("background",response["color"]);
  })
}
