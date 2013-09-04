// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require jquery-star-rating
//= require twitter/typeahead
//= require twitter/bootstrap/transition
//= require twitter/bootstrap/alert
//= require twitter/bootstrap/modal
//= require twitter/bootstrap/dropdown
//= require twitter/bootstrap/scrollspy
//= require twitter/bootstrap/tab
//= require twitter/bootstrap/tooltip
//= require twitter/bootstrap/popover
//= require twitter/bootstrap/button
//= require twitter/bootstrap/collapse
//= require twitter/bootstrap/carousel
//= require twitter/bootstrap/affix

//= require_tree .


function update_time_left(e) {
		var countdown_target = $(e).attr('data-time');
		var countdown_string;

		var now = new Date();
		var utc_now = Math.floor(new Date(now.getTime() - now.getTimezoneOffset() * 60 * 1000) / 1000);
		var total_seconds_left = countdown_target - utc_now;

		if(total_seconds_left < 0) {
			countdown_string = "Vorbei!"
		} else {
			var days_left = Math.floor(total_seconds_left / 86400);
			var hours_left = Math.floor(total_seconds_left / 3600) - days_left * 24;
			var minutes_left = Math.floor(total_seconds_left / 60) - (days_left * 1440 + hours_left * 60);
			var seconds_left = total_seconds_left - (days_left * 86400 + hours_left * 3600 + minutes_left * 60);
			countdown_string = days_left + " Tage, " + hours_left + " Stunden, " + minutes_left + " Minuten und " + seconds_left + " Sekunden";
		}
		
		$(e).html(countdown_string);
}

$(document).ready(function() {

	$('.countdown').each(function(index, e) {
		update_time_left(e);
		setInterval(function() { update_time_left(e) }, 1000);
	});
	
	label_new_decay_time = 72000;
	$(".label-new").each( function () {
		label_new = $(this);
		label_new_age = parseInt(label_new.attr("data-age"));
		label_new_opacity_float = ((label_new_decay_time - label_new_age) / label_new_decay_time).toFixed(1);
		if (label_new_opacity_float > 0.1) label_new.css("opacity", label_new_opacity_float);
		else label_new.css("display", "none");
	});
	
	/*
	$('.challenges .preview').on("mouseover", function () {
		$(this).attr("style","position:relative; z-index:111");
		$(".overlay").show();
	});
	
	$('.challenges .preview').on("mouseleave", function () {
		$(this).attr("style","position:relative; z-index:0");
		$(".overlay").hide();
	});
	*/
	
	initShadeHighlighter();
	initPreviewLink();
	
});

initShadeHighlighter = function() {
	$('.preview-link .shade-highlight').removeClass('shade-highlight').addClass('shade-highlight-inactive');
	
	$('.preview-link').on("mouseenter", function () {
		var w = $(this).outerWidth();
		var h = $(this).outerHeight();
		shade = $("<div></div>");
		shade.attr("style","display:box; position:absolute; width:" + w + "px; height:" + h + "px;");
		shade.addClass("shade");
		$(this).prepend(shade);
		$(this).find('.shade-highlight-inactive').addClass('shade-highlight');
	});
	
	$('.preview-link').on("mouseleave", function () {
		$(".shade").remove();
		$(this).find('.shade-highlight').removeClass('shade-highlight');
	});
	
	/*
	$('.challenges .preview').on("click", function () {
		$(this).attr("style","position:relative; z-index:111");
		$(".overlay").show();
	});	
	
	$('.challenges .preview').on("mouseleave", function () {
		$(this).attr("style","position:relative; z-index:0");
		$(".overlay").hide();
	});	
	*/
	
}

var initPreviewLink = function() {
	$('.preview-link').click(function() {
		window.location = $(this).attr('data-url');
	});
}

////////// modals

$(document).ready(function() {

	var first_vote_modal_done = false;
	
	if ($('#first_vote_modal').length > 0) {
		$('.star-form').on("click", function () {
			if (first_vote_modal_done) return true;
			$('#first_vote_modal').modal(); 
			first_vote_modal_done = true;
			return true;
		});
	}

	var anonymous_modal_done = false;
	
	if ($('#anonymous_modal').length > 0) {
		$('.comment-form').on("submit", function () {
			username=$(this).find("input.username").val();
			if (anonymous_modal_done || username!="Anonym") return true;
			$('#anonymous_modal').modal(); 
			//anonymous_modal_done = true;
			return false;
		});
	}

	$('#anonymous_modal button.anonymous-yes').click(function () {
		anonymous_modal_done = true;
		$('.comment-form').submit();
	});

	$('#anonymous_modal button.anonymous-no').click(function () {
		$('.comment-form input.username').focus();
	});
	
	
	$('.thumbnail').click(function(){
		$('#imageModal .modal-body').empty();
		var title = $(this).parent('a').attr("title");
		$('#imageModal .modal-title').html(title);
		$($(this).parents('div').html()).appendTo('.modal-body');
		$('#imageModal').modal({show:true});
	});	
	
	
});


