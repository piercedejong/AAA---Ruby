function victory(element) {
  $.ajax({
    method: "GET",
    data:{
     id: element.getAttribute("data-id")
    },
    url: window.location.origin + '/victory/clicked'
  })
  .done(function(response) {
    window.location.href = "/researches/"+response["uuid"];
  })
}