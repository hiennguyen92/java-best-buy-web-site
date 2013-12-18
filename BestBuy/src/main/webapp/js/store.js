$(document).ready(function() {
	var Arrays=new Array();
	
	// this is for 2nd row's li offset from top. It means how much offset you want to give them with animation
	var single_li_offset 	= 400;
	var current_opened_box  = -1;
	
	$('#wrap li').click(function() {
        
		var thisID = $(this).attr('id');
		var $this  = $(this);
		
		var id = $('#wrap li').index($this);
		
		if(current_opened_box == id) // if user click a opened box li again you close the box and return back
		{
			$('#wrap .detail-view').slideUp('slow');
                        current_opened_box = -1;
			return false;
		}
		$('#cart_wrapper').slideUp('slow');
		$('#wrap .detail-view').slideUp('slow');
		
		// save this id. so if user click a opened box li again you close the box.
		current_opened_box = id;
		
		var targetOffset = 0;
		
		// below conditions assumes that there are four li in one row and total rows are 4. How ever if you want to increase the rows you have to increase else-if conditions and if you want to increase li in one row, then you have to increment all value below. (if(id<=3)), if(id<=7) etc
		
		if(id<=3)
			targetOffset = single_li_offset;
		else if(id<=7)
			targetOffset = single_li_offset*2;
		else if(id<=11)
			targetOffset = single_li_offset*3;
		else if(id<=15)
			targetOffset = single_li_offset*4;
                    
                $('#wrap #detail-'+thisID).slideDown(500);		
		$("html:not(:animated),body:not(:animated)").animate({scrollTop: targetOffset});
		
	});
	
	$('.close a').click(function() {
		
		$('#wrap .detail-view').slideUp('slow');
		
	});
	
	$('.closeCart').click(function() {
		
		$('#cart_wrapper').slideUp();
		
	});
	
	$('#show_cart').click(function() {
		
		$('#cart_wrapper').slideToggle('slow');
		
	});
        
        $('#sl_view').change(function (){
           var action = 'Store?view=' + $('#sl_view').val(); 
           var ajax = $.ajax(action);
           ajax.done(function(msg) {
                $("#list_products").html(msg);
            });
        });
        
        $('#sl_sort').change(function (){
           var action = 'Store?sort=' + $('#sl_sort').val(); 
           var ajax = $.ajax(action);
           ajax.done(function(msg) {
                $("#list_products").html(msg);
            });
        });
        
        $(".pagnation a").click(function (){
           var action = $(this).attr("href");
           var ajax = $.ajax(action);
           ajax.done(function(msg) {
                $("#list_products").html(msg);
            });
            return false;
        });
});

function include(arr, obj) {
  for(var i=0; i<arr.length; i++) {
    if (arr[i] == obj) return true;
  }
}

function getpos(arr, obj) {
  for(var i=0; i<arr.length; i++) {
    if (arr[i] == obj) return i;
  }
}