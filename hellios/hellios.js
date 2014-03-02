var HL;
if (!HL) HL={};
HL.curAction="";
HL.jinit=function() {
	myHtml="";
	$(".grid").html(myHtml);
	$(".draggable").draggable({
		revert:true, 
		start: HL.act_drag_start
		});
	$(".grid").droppable({
		drop: HL.act_drop_grid,
		accept: ".action"
		});
};
HL.act_drag_start=function(event,ui)
{
	HL.curAction=$(this).data("action");
};
HL.act_drop_grid=function(event,ui)
{
	$(".grid .last").removeClass("last");
	
	var newPart='<div class="last part '+HL.curAction+'"></div>';
	$(".grid").append(newPart);
	var goff = $(".grid").offset();
	var gl = goff.left;
	var gt = goff.top;
	$(".grid .last")
		.css("top", event.pageY-gt)
		.css("left", event.pageX-gl)
		.draggable();
};

$(HL.jinit);