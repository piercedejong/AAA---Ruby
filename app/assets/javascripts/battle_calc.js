function sim() {
	var params = {
		method: "GET",
		url: window.location.origin + '/battle_calculator/simulation'
	}
	if($("#title").attr("game_version")=="1940"){
		params.data = {
			ainf: $("#ainf").val(),
			amec: $("#amec").val(),
			aart: $("#aart").val(),
			atnk: $("#atnk").val(),
			afgh: $("#afgh").val(),
			atac: $("#atac").val(),
			astr: $("#astr").val(),
			dinf: $("#dinf").val(),
			dmec: $("#dmec").val(),
			dart: $("#dart").val(),
			dtnk: $("#dtnk").val(),
			daaa: $("#daaa").val(),
			dfgh: $("#dfgh").val(),
			dtac: $("#dtac").val(),
			dstr: $("#dstr").val()
		}
	}else{
	}
	$.ajax(params)
  .done(function(response) {
  })
}
