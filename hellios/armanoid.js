var ARM;
if (!ARM) ARM={};
ARM.curAction="";
ARM.jinit=function() {
	$(".armanoid").detach().appendTo(".grid");
	$(".armanoid .skel").draggable();
	
	$(".act6").click(ARM.act_anim1);
	$(".act7").click(ARM.act_anim2);
	$(".act8").click(ARM.act_anim3);
	$(".act9").click(ARM.act_anim4);
	$(".act10").click(ARM.act_anim5);
};

ARM.act_anim1=function(){
	ARM.info("A1");
	$(".armanoid .left").animate({"left": "+=10px"});
	$(".armanoid .mul1").animate({"left": "+=10px"});
	$(".armanoid .mul2").animate({"left": "+=20px"});
	$(".armanoid .mul3").animate({"left": "+=30px"});
	$(".armanoid .mll").animate({"left": "+=10px"});
	
	$(".armanoid .right").animate({"left": "-=10px"});
	$(".armanoid .mur1").animate({"left": "-=10px"});	
	$(".armanoid .mur2").animate({"left": "-=20px"});	
	$(".armanoid .mur3").animate({"left": "-=30px"});	
	$(".armanoid .mlr").animate({"left": "-=10px"});	
};
ARM.act_anim2=function(){
	ARM.info("A2");
	$(".armanoid .left").animate({"left": "-=10px"});
	$(".armanoid .mul1").animate({"left": "-=10px"});
	$(".armanoid .mul2").animate({"left": "-=20px"});
	$(".armanoid .mul3").animate({"left": "-=30px"});
	$(".armanoid .mll").animate({"left": "-=10px"});

	$(".armanoid .right").animate({"left": "+=10px"});
	$(".armanoid .mur1").animate({"left": "+=10px"});
	$(".armanoid .mur2").animate({"left": "+=20px"});
	$(".armanoid .mur3").animate({"left": "+=30px"});
	$(".armanoid .mlr").animate({"left": "+=10px"});
};
ARM.act_anim3=function(){
	ARM.info("A3");
	// LOOK EST
	$(".left").css("z-index", 10).css("background-color", "#bbbbbb");
	$(".center").css("z-index", 20).css("background-color", "#dddddd");
	$(".right").css("z-index", 30).css("background-color", "#eeeeee");

	$(".mur3").css("z-index", 40).css("background-color", "#ffffff");
	
	$(".abdos")
		.css("border-bottom-right-radius", "0px")
		.css("border-bottom-left-radius", "32px");
	$(".head")
		.css("border-top-right-radius", "0px")
		.css("border-top-left-radius", "16px");
	$(".eyes").css("float", "left");	
};
ARM.act_anim4=function(){
	ARM.info("A4");
	// LOOK WEST
	$(".left").css("z-index", 30).css("background-color", "#eeeeee");
	$(".center").css("z-index", 20).css("background-color", "#dddddd");
	$(".right").css("z-index", 10).css("background-color", "#bbbbbb");
	
	$(".mul3").css("z-index", 40).css("background-color", "#ffffff");
	
	$(".abdos")
		.css("border-bottom-right-radius", "32px")
		.css("border-bottom-left-radius", "0px");
	$(".head")
		.css("border-top-right-radius", "16px")
		.css("border-top-left-radius", "0px");
	$(".eyes").css("float", "right");	
	
};
ARM.act_anim5=function(){
	ARM.info("A5");
};

ARM.info=function(msg) {
	$(".info1").html(msg);
};
$(ARM.jinit);
