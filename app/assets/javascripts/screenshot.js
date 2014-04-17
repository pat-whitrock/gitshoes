function screenshot(){
	html2canvas(document.body, {
	  onrendered: function(canvas) {
	    document.body.appendChild(canvas);
	  }
	});
}
$('#preview-btn').on('click', function(e){
	e.preventDefault();
	screenshot();
	console.log('in click event');
});
console.log('finished');