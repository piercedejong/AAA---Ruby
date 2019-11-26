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
		}else {
			$("#eco-bank").text("Bank "+response["bank"]);
		}
		$("#"+response["name"]).text(response["count"]);
		$("#"+response["nation"]+"-bank").text(response["bank"]);
		$("#c-nation").text(response["nation"]+" - "+response["bank"])
  })
}

function game_padding_resize(){
	$(".container-game").css("padding-top", $(".top").height()+5);
}

function unit_table_resize(){
	x = $(window).height() - $(".top").height() - $("#bottom-row").height() - 35;
	$(".unit-table").css("max-height",x);
}

function end_turn() {
	var count = 0;
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/end_turn'
  })
  .done(function(response) {
		$("#"+response["oo_nation"]+"-bank").text("Bank: "+response["oo_bank"]);
    $("#"+response["o_nation"]+"-bank").text("Bank: "+response["o_bank"]);
    $("#c-nation").text(response["nation"]+" - "+response["bank"]);
    $("#c-nation").css("color",response["color"]);
		$("#c-nation-ipc").css("color",response["color"]);
		$('#end-turn').css("background",response["color"]);
		$('#roundel').attr("src","/assets/"+response['roundel']);
		$("#round").text("Round: "+response["round"]);
		$('.btn-unit').each(function(){
			if(count%2==0){
				$(this).css("background",response["color"]);
			}else{
				$(this).css("background",response["colorL"]);
			}
			count++;
		})
		cheap(response["cheaper"]);
		$('.tablerow1').each(function(){
			//$(this).css("color", response["color"])
		})
		$('.tablerow2').each(function(){
			//$(this).css("color", response["colorL"])
		})

		//$(".table-top").css("color",response["color"]);
		if(response["nation"] == 'Germany'){
			//$(".table-top").removeClass("shadow-text");
		}else{
			//$(".table-top").addClass("shadow-text");
		}

    $('.count').text("0");
		change_eco_nation(response);

		if(response["pacific"]){
			$("#end-turn").hide();
			$("#pacific").show();
		}else{
			$("#pacific").hide();
			$("#end-turn").show();
		}
		$("#c-nation-card").css('background-color', response["colorL"])
		$("#c-nation-card").css('border-color', response["color"])
		//c_nation_opacity(response["nation"])

		$(".nation").css('border-color', "transparent")
		$("#"+response["nation"]).css("border-color", "#262626");
		//$("#"+response["nation"]).css("border", "5px solid");
  })
}

function reset_buy() {
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/reset_buy'
  })
  .done(function(response) {
    $("#"+response["nation"]+"-bank").text(response["bank"]);
		$("#c-nation").text(response["nation"]+" - "+response["bank"]);
		$("#eco-bank").text("Bank "+response["bank"]);
    $('.count').text("0");
  })
}

function reset_turn() {
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/reset_turn'
  })
  .done(function(response) {
    $("#"+response["nation"]+"-bank").text(response["bank"]);
		$("#c-nation").text(response["nation"]+" - "+response["bank"]);
		$("#eco-bank").text("Bank "+response["bank"]);
    $('.count').text("0");
  })
}

function change_eco_forward() {
	$.ajax({
       method: "GET",
       url: window.location.origin + '/game/change_eco_forward'
	})
  .done(function(response) {
  	change_eco_nation(response)
		//eco_nation_opacity()
  })
}

function change_eco_backward() {
	$.ajax({
       method: "GET",
       url: window.location.origin + '/game/change_eco_backward'
	})
  .done(function(response) {
  	change_eco_nation(response)
		//eco_nation_opacity()
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
			$("#c-nation").text(response["nation"]+" - "+response["bank"])
		}
    $("#"+response["nation"]+"-bank").text("Bank: "+response["bank"]);
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
		$("#"+response["nation"]+"-income").text("Income: "+response["total_income"]);
		$("#eco-income").text("Income "+response["income"]);
	})
}

function edit_change_bank(element) {
	$.ajax({
       method: "GET",
       data:{
       	amount: element.getAttribute("data-amount"),
				uuid: element.getAttribute("uuid")
       },
       url: window.location.origin + '/game/edit_change_bank'
	})
  .done(function(response) {
    $("#"+element.getAttribute("uuid")+"-bank").text("Bank "+response["bank"]);
  })
}

function edit_change_income(element) {
	$.ajax({
       method: "GET",
       data:{
       	amount: element.getAttribute("data-amount"),
				uuid: element.getAttribute("uuid")
       },
       url: window.location.origin + '/game/edit_change_income'
	})
  .done(function(response) {
    $("#"+element.getAttribute("uuid")+"-income").text("Income "+response["income"]);
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
		$(".nation").css("border-color", "transparent");
		$("#c-nation").text(response["nation"]+" - "+response["bank"]);
    $("#c-nation").css("color",response["color"]);
		$("#c-nation-ipc").css("color",response["color"]);
		$('#end-turn').css("background",response["color"]);
		$("#end-turn").show();
		$('#roundel').attr("src","/assets/"+response['roundel']);
		$('.count').text("0");
		$(".nation").css('border-color', "transparent")
		$("#"+response["nation"]).css("border-color", "#262626");
		change_eco_nation(response);

		//c_nation_opacity(response["nation"])
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
	$("#change-eco").css("background",response["colorL"])
	$("#change-eco").css("color",response["color"])
	$("#eco-bank").text("Bank "+response["bank"]);
	$("#eco-income").text("Income "+response["income"]);
	$(".change-eco-pos").css("background",response["color"])
	$(".change-eco-neg").css("background",response["colorL"])
	//eco_nation_opacity()
	//$("#objective").css("background",response["color"]);
	$("#objective").attr("href", "/nations/"+response["uuid"]);
	//$("#victory").css("background",response["color"]);
	//$("#research").css("background",response["color"]);
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

function c_nation_opacity(name) {
	var nat = name;
	var c = $("#c-nation-card").css('background-color');
	var rgba = opacity(c,0.8);
	$("#c-nation-card").css('background-color', rgba);
	$(".tablerow1").css('background-color', rgba);
}

function eco_nation_opacity(){
	var c = $("#change-eco").css('background-color');
	var rgba = opacity(c,0.8);
	$("#change-eco").css('background-color', rgba);
}

function edit_nation_opacity(name){
	var c = $("#"+name).css('background-color');
	var rgba = opacity(c,0.8);
	$(".edit-"+name).css('background-color',rgba);
}

function opacity(color, percent){
	var rgb = color.replace(/^rgba?\(|\s+|\)$/g,'').split(',');
	var rgba = "rgba("+rgb[0]+","+rgb[1]+","+rgb[2]+","+percent+")";
	return rgba
}

function cheap(enabled) {
	if(enabled){
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

}
