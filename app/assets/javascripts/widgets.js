function switchToOrientationMac() {
	if ($('#mac-orientation-container').is(':hidden')) {
		$('#mac-orientation-container').toggle();
		$('#mac-zoom-container').toggle();
	}
}

function switchToZoomMac() {
	if ($('#mac-zoom-container').is(':hidden')) {
		$('#mac-orientation-container').toggle();
		$('#mac-zoom-container').toggle();
	}
}

function removeActive() {
	$('.widget-form-section').each(function() {
		$(this).removeClass('active');
	});
}

function switchToColor() {
	$('#widget-color').addClass('active');
	switchToZoomMac();
}

function switchToFont() {
	$('#widget-font').addClass('active');
	switchToZoomMac();
}

function switchToOrientation() {
	$('#widget-orientation').addClass('active');
	switchToOrientationMac();
}

function switchToSize() {
	$('#widget-size').addClass('active');
	switchToZoomMac();
}

function switchToText() {
	$('#widget-text').addClass('active');
	switchToZoomMac();
}

$(function() {
	$('.switch-to-color').on('click', function(e) {
		e.preventDefault();
		removeActive();
		switchToColor();
	});
	$('.switch-to-font').on('click', function(e) {
		e.preventDefault();
		removeActive();
		switchToFont();
	});
	$('.switch-to-orientation').on('click', function(e) {
		e.preventDefault();
		removeActive();
		switchToOrientation();
	});
	$('.switch-to-size').on('click', function(e) {
		e.preventDefault();
		removeActive();
		switchToSize();
	});
	$('.switch-to-text').on('click', function(e) {
		e.preventDefault();
		removeActive();
		switchToText();
	});
});

function updateWidgetTabTextColor() {
	$('#widget_tab_font_color').on('change', function(e) {
		$('#feedback-clone-zoom-gitshoes-button').css('color', $(this).val());
	});
}

function updateWidgetTabBackgroundColor() {
	$('#widget_tab_background_color').on('change', function(e) {
		$('#feedback-clone-zoom-gitshoes-button').css('background-color', $(this).val());
	});
}

function updateWidgetBodyFontColor() {
	$('#widget_body_font_color').on('change', function(e) {
		$('#clone-zoom-new-issue label').css('color', $(this).val());
	});
}

function updateWidgetFormBackgroundColor() {
	$('#widget_form_background_color').on('change', function(e) {
		$('#gitshoes-clone-zoom-form').css('background-color', $(this).val());
	});
}

function updateWidgetFormBorderColor() {
	$('#widget_form_border_color').on('change', function(e) {
		$('#gitshoes-clone-zoom-form').css('border-color', $(this).val());
	});
}

$(function() {
	updateWidgetTabTextColor();
	updateWidgetTabBackgroundColor();
	updateWidgetBodyFontColor();
	updateWidgetFormBackgroundColor();
	updateWidgetFormBorderColor();
});