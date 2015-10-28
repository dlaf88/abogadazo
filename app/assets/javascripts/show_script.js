$( document ).ready(function() {
    
    $("a[href=#]").click(function(event) {
		 event.preventDefault();
	});

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

	// Detecting banner internal page
	if ( $(".top").length > 0 ) {
		$( window ).scroll(function() {
			var scrollTop = $(this).scrollTop();
			var max_top = $('.internal').offset().top + 100;
			if(scrollTop > max_top){
				$('.top').addClass('child');
			} else {
				$('.top').removeClass('child');
			}
		});
	}

	// Navigation Mobile
	$("body").on("click",".mobile", function(){
		$(".navigation").slideDown();
		$(this).addClass("dropped");
	});
	$("body").on("click",".mobile.dropped", function(){
		$(".navigation").slideUp();
		$(this).removeClass("dropped");
	});

	// Toggle Message into ask question module 
	$("body").on("click",".askquestionbtn", function(){
		$(".data-fields").hide();
		$(".message-sent").show();
		return false;
	});
	$("body").on("click",".otherask", function(){
		$(".message-sent").hide();
		$(".data-fields").show();
		$(".data-fields input[type='text'], .data-fields input[type='email'], .data-fields textarea, .data-fields select").val("");
	});

});