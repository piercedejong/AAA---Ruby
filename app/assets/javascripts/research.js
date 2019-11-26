function research(element) {
  $.ajax({
    method: "GET",
    data:{
     id: element.getAttribute("id"),
     name: element.getAttribute("nation")
    },
    url: window.location.origin + '/research/clicked'
  })
  .done(function(response) {
  $(".research-check").attr("disabled",response["disable"])

  })
}


function table_head_resize(){
  var w = parseInt($("#1").css("height").slice(0, -2));
  var x = parseInt($("#2").css("height").slice(0, -2));
  var y = parseInt($("#3").css("height").slice(0, -2));
  var z = parseInt($("#4").css("height").slice(0, -2));

  var max = 0
  if(max<x){
    max = x
  }
  if(max<y){
    max = y
  }
  if(max<z){
    max = z
  }
  var l = max+"px"
  $("#1").css("height",l);
  $("#2").css("height",l);
  $("#3").css("height",l);
  $("#4").css("height",l);

}
