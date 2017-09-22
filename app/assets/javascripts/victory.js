function victory(element) {
  $.ajax({
    method: "GET",
    data:{
     id: element.getAttribute("data_id")
    },
    url: window.location.origin + '/victory/clicked'
  })
  .done(function(response) {
    //$("#victory-"+response["oid"]).css("background",response["color"]);
  })
}
