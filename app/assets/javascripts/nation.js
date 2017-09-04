function previous_eco(element) {
  $.ajax({
    method: "GET",
    data:{
     prev: true,
     id: element.getAttribute("data-uuid")
    },
    url: window.location.origin + '/nation/show'
  })
}

function next_eco() {
  $.ajax({
    method: "GET",
    url: window.location.origin + '/nation/exit'
  })
}
