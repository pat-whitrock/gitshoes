// Functions for switching active form section and view

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

// Call functions to switch active form sections and views

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

// Functions for live update Color

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

// Call functions for live update Color

$(function() {
	updateWidgetTabTextColor();
	updateWidgetTabBackgroundColor();
	updateWidgetBodyFontColor();
	updateWidgetFormBackgroundColor();
	updateWidgetFormBorderColor();
});

// Functions for live update Font

function updateWidgetTabFont() {
	$('#widget_tab_font').on('change', function(e) {
		$('#feedback-clone-zoom-gitshoes-button').css('font-family', $(this).val());
	});
}

function updateWidgetTabFontSize() {
	$('#widget_tab_font_size').on('change', function(e) {
		$('#feedback-clone-zoom-gitshoes-button').css('font-size', $(this).val());
	});
}

function updateWidgetBodyFont() {
	$('#widget_body_font').on('change', function(e) {
		$('#clone-zoom-new-issue label').css('font-family', $(this).val());
	});
}

function updateWidgetBodyFontSize() {
	$('#widget_body_font_size').on('change', function(e) {
		$('#clone-zoom-new-issue label').css('font-size', $(this).val());
	});
}

function updateWidgetFieldFont() {
	$('#widget_field_font').on('change', function(e) {
		$('#clone-zoom-new-issue').children('input:text, textarea').css('font-family', $(this).val());
	});
}

function updateWidgetFieldFontSize() {
	$('#widget_field_font_size').on('change', function(e) {
		$('#clone-zoom-new-issue').children('input:text, textarea').css('font-size', $(this).val());
	});
}

function updateWidgetButtonFont() {
	$('#widget_button_font').on('change', function(e) {
		$('#clone-zoom-new-issue input:button').css('font-family', $(this).val());
	});
}

function updateWidgetButtonFontSize() {
	$('#widget_button_font_size').on('change', function(e) {
		$('#clone-zoom-new-issue input:button').css('font-size', $(this).val());
	});
}

// Call functions for live update Font

$(function() {
	updateWidgetTabFont();
	updateWidgetTabFontSize();
	updateWidgetBodyFont();
	updateWidgetBodyFontSize();
	updateWidgetFieldFont();
	updateWidgetFieldFontSize();
	updateWidgetButtonFont();
	updateWidgetButtonFontSize();
});

// Leaving space for Orientation

function updateWidgetEdgeDistance() {
	$('#widget_edge').on('change', function(e) {
		$('#feedback-clone').css('top', '');
		$('#feedback-clone').css('bottom', '');
		$('#feedback-clone').css($(this).val(), 0);
	});
}

function updateWidgetOrientation() {
	$('#widget_orientation').on('change', function(e) {
		$('#feedback-clone').css('left', '');
		$('#feedback-clone').css('right', '');
		$('#feedback-clone').css($(this).val(), $('#widget_offset').val());
		$('#feedback-clone-gitshoes-button').css('float', $(this).val());
		$('#gitshoes-clone-form').css('float', $(this).val());
	});
}

function updateWidgetOffset() {
	$('#widget_offset').on('change', function(e) {
		$('#feedback-clone').css($('#widget_orientation').val(), $(this).val());
	});
}

$(function() {
	updateWidgetEdgeDistance();
	updateWidgetOrientation();
	updateWidgetOffset();
});

// Functions for live update Size

function updateWidgetTabWidth() {
	$('#widget_tab_width').on('change', function(e) {
		$('#feedback-clone-zoom-gitshoes-button').css('width', $(this).val());
	});
}

function updateWidgetTabHeight() {
	$('#widget_tab_height').on('change', function(e) {
		$('#feedback-clone-zoom-gitshoes-button').css('height', $(this).val());
	});
}

function updateWidgetTabLineHeight() {
	$('#widget_tab_line_height').on('change', function(e) {
		$('#feedback-clone-zoom-gitshoes-button').css('line-height', $(this).val());
	});
}

function updateWidgetTabPadding() {
	$('#widget_tab_padding').on('change', function(e) {
		$('#feedback-clone-zoom-gitshoes-button').css('padding', $(this).val());
	});
}

function updateWidgetTabEdges() {
	$('#widget_tab_edge_radius').on('change', function(e) {
		$('#feedback-clone-zoom-gitshoes-button').css('border-radius', $(this).val());
	});
}

function updateWidgetFormWidth() {
	$('#widget_form_width').on('change', function(e) {
		$('#gitshoes-clone-zoom-form').css('width', $(this).val());
	});
}

function updateWidgetFormEdges() {
	$('#widget_form_border_radius').on('change', function(e) {
		$('#gitshoes-clone-zoom-form').css('border-radius', $(this).val());
	});
}

function updateWidgetFormBorderWidth() {
	$('#widget_form_border_thickness').on('change', function(e) {
		$('#gitshoes-clone-zoom-form').css('border-width', $(this).val());
	});
}

// Call functions for live update Size

$(function() {
	updateWidgetTabWidth();
	updateWidgetTabHeight();
	updateWidgetTabLineHeight();
	updateWidgetTabPadding();
	updateWidgetTabEdges();
	updateWidgetFormWidth();
	updateWidgetFormEdges();
	updateWidgetFormBorderWidth();
});

function updateWidgetTabText() {
	$('#widget_tab_text').on('change', function(e) {
		$('#feedback-clone-zoom-gitshoes-button').text($(this).val());
	});
}

function updateWidgetTitleText() {
	$('#widget_title_field_text').on('change', function(e) {
		$($('#clone-zoom-new-issue').children('label')[1]).text($(this).val());
	});
}

function updateWidgetDescriptionText() {
	$('#widget_description_field_text').on('change', function(e) {
		$($('#clone-zoom-new-issue').children('label')[2]).text($(this).val());
	});
}

function updateWidgetButtonText() {
	$('#widget_button_text').on('change', function(e) {
		$('#clone-zoom-new-issue input:button').val($(this).val());
	});
}

function updateWidgetButtonText() {
	$('#widget_button_text').on('change', function(e) {
		$('#clone-zoom-new-issue input:button').val($(this).val());
	});
}

function updateWidgetButtonSuccessText() {
	$('#widget_button_success_text').on('change', function(e) {
		$('#gitshoes-clone-zoom-form').slideUp(function() {
			$('#feedback-clone-zoom-gitshoes-button').fadeOut(400, function() {
				$(this).html($('#widget_button_success_text').val()).delay(500).fadeIn(function() {
					$('#gitshoes-clone-zoom-form').delay(1000).slideDown(function() {
						$('#feedback-clone-zoom-gitshoes-button').fadeOut(400, function() {
							$(this).html($('#widget_tab_text').val()).delay(500).fadeIn();
						})
					});
				})
			});
		});
	});
}

$(function() {
	updateWidgetTabText();
	updateWidgetTitleText();
	updateWidgetDescriptionText();
	updateWidgetButtonText();
	updateWidgetButtonSuccessText();
});
