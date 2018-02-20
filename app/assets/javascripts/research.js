function research(element) {
  $.ajax({
    method: "GET",
    data:{
     id: element.getAttribute("data-id"),
     name: element.getAttribute("data-name")
    },
    url: window.location.origin + '/research/clicked'
  })
  .done(function(response) {
    if(response){
      $("#"+response["id"]).css("background",response["color"]);
    }
  })
}
