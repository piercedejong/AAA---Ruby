

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
     id: element.getAttribute("id")
    },
    url: window.location.origin + '/nation/clicked'
  })
  .done(function(response) {
    $("#c-nation").text(response["nation"]);
    // if(response["enabled"] == "true"){
    //   $("#"+response["id"]+"-box").attr('checked','checked')
    // }else{
    //   $("#"+response["id"]+"-box").prop('checked', false);
    // }

  })
}
