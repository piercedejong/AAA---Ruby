

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
    url: window.location.origin + '/nation/update_obj'
  })
  .done(function(response) {
    $("#objective-"+response["oid"]).css("background",response["color"]);
  })
}
