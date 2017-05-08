$( document ).ready(function() {
    
        if ( $('.flexslider').length > 0 ) {
            $('.flexslider').flexslider({
            animation: "slide"
          });
        }

        // SEARCH
        $("body").on("click", "header .search .search-cta:not(.dropped)", function(){
            $(this).addClass("dropped");
            $(".search-bar").slideDown();
        });

        $("body").on("click", "header .search .search-cta.dropped", function(){
            $(this).removeClass("dropped");
            $(".search-bar").slideUp();
        });

        // NAV MOBILE
        $("body").on("click","header .nav-icon-mobile", function(){
            $("header nav").addClass("slided");
        });

        $("body").on("click", "header nav .header-nav-mobile .close-nav", function(){
            $("header nav").removeClass("slided");
        });

        // Read More Post Detail Function
        $("body").on("click",".read-more-post .more", function(){
            $(this).parents(".read-more-post").hide();
            $(this).parents(".content-article").find("article").removeClass("cropped");
        });



});