function removeActive() {
	$('.widget-form-section').each(function() {
		$(this).removeClass('active');
	});
}

function switchToColor() {
	$('#widget-color').addClass('active');
}

function switchToFont() {
	$('#widget-font').addClass('active');
}

function switchToOrientation() {
	$('#widget-orientation').addClass('active');
}

function switchToSize() {
	$('#widget-size').addClass('active');
}

function switchToText() {
	$('#widget-text').addClass('active');
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
})
