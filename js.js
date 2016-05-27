function btnHnadlers(b) {
	$("#btn-" + b)
	.mousedown (function() {$(this).attr("class", b + "down"   );})
	.mouseup   (function() {$(this).attr("class", b + "up"     );})
	.mouseleave(function() {$(this).attr("class", b + "up"     );});
}

btnHnadlers('abort');
btnHnadlers('cancel');
btnHnadlers('run');

$("#group-run").click(function(){
	$("#group-run").hide();
	$("#group-cancel").hide();
	$("#group-abort").show();
	alert("Launch verif here! p1=" + $("#p1").val());
});

$("#group-abort").click(function(){
	$("#group-run").show();
	$("#group-cancel").show();
	$("#group-abort").hide();
	alert("Stop verif here!");
});

$(function(){
	$("#group-abort").hide();
});
