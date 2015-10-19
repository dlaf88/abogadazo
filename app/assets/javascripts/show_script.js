$( document ).ready(function() {
    

	// Tabs
	$("body").on("click","#tabs .options > span", function(){
		$("#tabs .options > span").removeClass("active");
		$(this).addClass("active");
	});

	$("body").on("click","#opask", function(){
		$("#find").removeClass("show");
		$("#answers").removeClass("show");
		$("#ask").addClass("show");
	});
	$("body").on("click","#opfind", function(){
		$("#answers").removeClass("show");
		$("#ask").removeClass("show");
		$("#find").addClass("show");
	});
	$("body").on("click","#opanswers", function(){
		$("#find").removeClass("show");
		$("#ask").removeClass("show");
		$("#answers").addClass("show");
	});


	$("body").on("click",".gonext", function(){
		$("html, body").animate({ scrollTop: $("#ask-fold").offset().top }, 800);
	});


});