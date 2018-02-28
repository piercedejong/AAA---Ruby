function buy_unit(element) {
	$.ajax({
       method: "GET",
       data:{
       	uid: element.getAttribute("data-uid")
       },
       url: window.location.origin + '/game/buy_unit'
	})
  .done(function(response) {
		if(response["change"]){
			change_eco_nation(response);
			$("#"+response["name"]).text(response["count"]);
	    $("#"+response["nation"]+"-bank").text(response["bank"]);
			$("#c-nation").text(response["nation"]+"-"+response["bank"])
		}else {
			$("#"+response["name"]).text(response["count"]);
	    $("#"+response["nation"]+"-bank").text(response["bank"]);
			$("#eco-bank").text("Bank "+response["bank"]);
			$("#c-nation").text(response["nation"]+"-"+response["bank"])
		}
  })
}

function end_turn() {

	var count = 0;
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/end_turn'
  })
  .done(function(response) {
		$("#"+response["oo_nation"]+"-bank").text(response["oo_bank"]);
    $("#"+response["o_nation"]+"-bank").text(response["o_bank"]);
    $("#c-nation").text(response["nation"]+"-"+response["bank"]);
    $("#c-nation").css("color",response["color"]);
		$('#end-turn').css("background",response["color"]);
		$('#roundel').attr("src","/assets/"+response['roundel']);
		$('.btn-unit').each(function(){
			if(count%2==0){
				$(this).css("background",response["color"]);
			}else{
				$(this).css("background",response["colorL"]);
			}
			count++;
		})
		if(response["cheaper"]){
	    $(".Submarine").text("$5");
	    $(".Transport").text("$6");
	    $(".Destroyer").text("$7");
	    $(".Cruiser").text("$9");
	    $(".Battleship").text("$17");
	    $(".Carrier").text("$13");
	  }else{
	    $(".Submarine").text("$6");
	    $(".Transport").text("$7");
	    $(".Destroyer").text("$8");
	    $(".Cruiser").text("$12");
	    $(".Battleship").text("$20");
	    $(".Carrier").text("$16");
	  }

		$('.tablerow1').each(function(){
			$(this).css("color", response["color"])
		})

		$('.tablerow2').each(function(){
			//$(this).css("color", response["colorL"])
		})
		$(".table-top").css("color",response["color"]);
    $("#reset").css("background",response["color"]);
    $('.count').text("0");
		change_eco_nation(response);

		if(response["nation"] == ("Britain" || "UK Europe")){
			$("#pacific").show();
		}else{
			$("#pacific").hide();
		}
  })
}

function reset_buy() {
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/reset_buy'
  })
  .done(function(response) {
    $("#"+response["nation"]+"-bank").text(response["bank"]);
		$("#c-nation").text(response["nation"]+"-"+response["bank"]);
		$("#eco-bank").text("Bank "+response["bank"]);
    $('.count').text("0");
  })
}

function change_eco() {
	$.ajax({
       method: "GET",
       url: window.location.origin + '/game/change_eco'
	})
  .done(function(response) {
  	change_eco_nation(response)
  })
}

function change_bank(element) {
	$.ajax({
       method: "GET",
       data:{
       	amount: element.getAttribute("data-amount")
       },
       url: window.location.origin + '/game/change_bank'
	})
  .done(function(response) {
		if(response["same_n"]){
			$("#c-nation").text(response["nation"]+"-"+response["bank"])
		}
    $("#"+response["nation"]+"-bank").text(response["bank"]);
		$("#eco-bank").text("Bank "+response["bank"]);
  })
}

function change_income(element) {
	$.ajax({
		method: "GET",
	  data:{
	  	amount: element.getAttribute("data-amount")
	  },
	  url: window.location.origin + '/game/change_income'
	})
	.done(function(response) {
		$("#"+response["nation"]+"-income").text(response["total_income"]);
		$("#eco-income").text("Income "+response["income"]);
	})
}

function buy_pacific(element) {
	$("#pacific").hide();
	$.ajax({
		method: "GET",
	  data:{
	  },
	  url: window.location.origin + '/game/buy_pacific'
	})
	.done(function(response) {
		$("#c-nation").text(response["nation"]+"-"+response["bank"]);
    $("#c-nation").css("color",response["color"]);
		$('#end-turn').css("background",response["color"]);
		$('#roundel').attr("src","/assets/"+response['roundel']);
		$('.count').text("0");
		change_eco_nation(response);
	})
}

function home() {
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/exit'
  })
}

function change_eco_nation(response){
	$("#change-eco").text(response["nation"]);
	$("#change-eco").css("background",response["color"])
	$("#eco-bank").text("Bank "+response["bank"]);
	$("#eco-income").text("Income "+response["income"]);
	$(".change-eco-pos").css("background",response["colorL"])
	$(".change-eco-neg").css("background",response["color"])
	$("#objective").css("background",response["color"]);
	$("#objective").attr("href", "/nations/"+response["uuid"]);
	$("#victory").css("background",response["colorL"]);
	$("#research").css("background",response["color"]);
}

function reset_1940(){
	if (confirm('Are you sure you want to reset ALL Research Points?')) {
		$.ajax({
			method: "GET",
	  	data:{
	  	},
	  	url: window.location.origin + '/game/reset_victory_research'
		})
		.done(function(response) {
			location.reload();
		})
	}
}

function reset_GrassHopper(){
	if (confirm('Are you sure you want to reset ALL Victory Objectives and Research Points?')) {
		$.ajax({
			method: "GET",
	  	data:{
	  	},
	  	url: window.location.origin + '/game/reset_victory_research'
		})
		.done(function(response) {
			location.reload();
		})
	}
}

function copy(element) {
	var name = prompt("Please enter new Name","Copy")
	if(name.length>=3 && name != "   "){
		$.ajax({
			method: "GET",
		  data:{
		  	uuid: element.getAttribute("id"),
				name: name
		  },
		  url: window.location.origin + '/game/copy'
		})
		.done(function(response) {
			window.location.reload();
		})
	}else{
		alert("Please enter a name that is at least 3 letters long");
	}
}
