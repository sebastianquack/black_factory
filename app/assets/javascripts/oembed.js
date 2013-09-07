$(document).ready(function() {
	
	// init oembed
	$("a.oembed").oembed();
	
	// oembed preview
	$("input#media_link").on("change keyup",function () {
		var preview_tag = $("#media_link_preview");
		var input_val = $(this).val().trim();
		if ($(this).attr("data-value-before") && $(this).attr("data-value-before") == $(this).val()) return;
		else $(this).attr("data-value-before",$(this).val());
		if (input_val == "") {
			preview_tag.hide();
			return;
			}
		else preview_tag.show().removeClass("failed").addClass("processing").text( "" + input_val + " <b>wird geprüft</b>" );
		preview_tag.oembed($(this).val(), {
			embedMethod: "fill",
			/*
			onError: function(url) {
				$("#media_link_preview").text("not ok");
				},
				*/
			afterEmbed: function(oembedData) {
				//console.log("done");
				//console.log(oembedData);
				preview_tag.show().removeClass("processing");
				if (oembedData.error_code) preview_tag.show().addClass("failed").text( "\"" + input_val + "\"" + " <b>nicht korrekt</b>" );
				if ($("input#media_link").val == "") preview_tag.hide();
				},			
			beforeEmbed: function() {
				preview_tag.show().text( input_val + " wird geladen" );
				},					
			});
		});
	
	
	});
	