$(document).ready(function() {
	
	// init oembed
	$("a.oembed").oembed();
	
	// oembed preview
	$("input#media_link").on("change keyup",function () {
		if ($(this).attr("data-value-before") && $(this).attr("data-value-before") == $(this).val()) return;
		$(this).attr("data-value-before",$(this).val());
		$("#media_link_preview").oembed($(this).val(), {
			embedMethod: "fill",
			/*
			onError: function(url) {
				$("#media_link_preview").text("not ok");
				},
				*/
			afterEmbed: function(oembedData) {
				console.log("done");
				console.log(oembedData);
				if (oembedData.error_code) $("#media_link_preview").text("not ok");
				},			
			beforeEmbed: function() {
				$("#media_link_preview").text("checking");
				},					
			});
		});
	
	
	});
	