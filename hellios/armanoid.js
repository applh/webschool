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
};
ARM.act_anim2=function(){
	ARM.info("A2");
};
ARM.act_anim3=function(){
	ARM.info("A3");
};
ARM.act_anim4=function(){
	ARM.info("A4");
};
ARM.act_anim5=function(){
	ARM.info("A5");
};

ARM.info=function(msg) {
	$(".info1").html(msg);
};
$(ARM.jinit);
