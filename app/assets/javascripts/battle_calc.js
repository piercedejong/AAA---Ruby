function sim() {
	var params = {
		method: "GET",
		url: window.location.origin + '/battle_calculator/simulation'
	}

	if($("#title").attr("game_version")=="1940"){
		attacker = {
			inf: $("#ainf").val(),
			mec: $("#amec").val(),
			art: $("#aart").val(),
			tnk: $("#atnk").val(),
			aaa: 0,
			fgh: $("#afgh").val(),
			tac: $("#atac").val(),
			str: $("#astr").val()
		}
		defender = {
			inf: $("#dinf").val(),
			mec: $("#dmec").val(),
			art: $("#dart").val(),
			tnk: $("#dtnk").val(),
			aaa: $("#daaa").val(),
			fgh: $("#dfgh").val(),
			tac: $("#dtac").val(),
			str: $("#dstr").val()
		}
		params.data = {attacker:attacker,defender:defender}
	}else{
	}
	$.ajax(params)
  .done(function(response) {
  })
}
