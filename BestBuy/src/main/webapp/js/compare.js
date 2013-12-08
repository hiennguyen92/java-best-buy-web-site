$(document).ready(function() {
	
	$('#wrap li').click(function() {
            location.href = "Info?id=" + $(this).attr('id');
	});
});