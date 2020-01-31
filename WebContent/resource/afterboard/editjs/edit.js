//$(function(){
edit0();
edit1();
edit2();
edit3();
edit4();
function edit0() {
	$('#edit0').froalaEditor(
			{
				toolbarInline : true,
				toolbarVisibleWithoutSelection : true,
				toolbarButtons : [ 'bold', 'italic', 'underline',
						'strikeThrough', 'color', 'emoticons', '-',
						'paragraphFormat', 'align', 'formatOL', 'formatUL',
						'indent', 'outdent', '-', 'insertImage', 'insertLink',
						'insertFile', 'insertVideo', 'undo', 'redo' ],
				toolbarButtonsXS : null,
				toolbarButtonsSM : null,
				toolbarButtonsMD : null
			});
}
function edit1() {
	$('#edit1').froalaEditor(
			{
				toolbarInline : true,
				toolbarVisibleWithoutSelection : true,
				toolbarButtons : [ 'bold', 'italic', 'underline',
						'strikeThrough', 'color', 'emoticons', '-',
						'paragraphFormat', 'align', 'formatOL', 'formatUL',
						'indent', 'outdent', '-', 'insertImage', 'insertLink',
						'insertFile', 'insertVideo', 'undo', 'redo' ],
				toolbarButtonsXS : null,
				toolbarButtonsSM : null,
				toolbarButtonsMD : null
			});
}
function edit2() {
	$('#edit2').froalaEditor(
			{
				toolbarInline : true,
				toolbarVisibleWithoutSelection : true,
				toolbarButtons : [ 'bold', 'italic', 'underline',
						'strikeThrough', 'color', 'emoticons', '-',
						'paragraphFormat', 'align', 'formatOL', 'formatUL',
						'indent', 'outdent', '-', 'insertImage', 'insertLink',
						'insertFile', 'insertVideo', 'undo', 'redo' ],
				toolbarButtonsXS : null,
				toolbarButtonsSM : null,
				toolbarButtonsMD : null
			});
}
function edit3() {
	$('#edit3').froalaEditor(
			{
				toolbarInline : true,
				toolbarVisibleWithoutSelection : true,
				toolbarButtons : [ 'bold', 'italic', 'underline',
						'strikeThrough', 'color', 'emoticons', '-',
						'paragraphFormat', 'align', 'formatOL', 'formatUL',
						'indent', 'outdent', '-', 'insertImage', 'insertLink',
						'insertFile', 'insertVideo', 'undo', 'redo' ],
				toolbarButtonsXS : null,
				toolbarButtonsSM : null,
				toolbarButtonsMD : null
			});
}
function edit4() {
	$('#edit4').froalaEditor(
			{
				toolbarInline : true,
				toolbarVisibleWithoutSelection : true,
				toolbarButtons : [ 'bold', 'italic', 'underline',
						'strikeThrough', 'color', 'emoticons', '-',
						'paragraphFormat', 'align', 'formatOL', 'formatUL',
						'indent', 'outdent', '-', 'insertImage', 'insertLink',
						'insertFile', 'insertVideo', 'undo', 'redo' ],
				toolbarButtonsXS : null,
				toolbarButtonsSM : null,
				toolbarButtonsMD : null
			});
}

//$(document).on('click', '#edit1', edit1());
//
//$(document).on('click', '#edit2', edit2());

// 에디터 이벤트 제거 후 다시 등록 부분할차례

$('#btn1').click(
		function() {
			alert($('#edit1').children().children().html());
			$('#edit1').replaceWith(
					'<div id="noEdit1">'
							+ $('#edit1').children().children().html()
							+ '</div>');
		});

$(document)
		.on(
				"click",
				"#noEdit1",
				function() {
					$('#noEdit1')
							.replaceWith(
									'<div id="edit1"><div class="fr-wrapper" dir="auto"><div class="fr-element fr-view" dir="auto" contenteditable="true" aria-disabled="false" spellcheck="true">'
											+ $('#noEdit1').html()
											+ '</div></div></div>');
					edit1();
				});

$('#btn2').click(
		function() {
			alert($('#edit2').children().children().html());
			$('#edit2').replaceWith(
					'<div id="noEdit2">'
							+ $('#edit2').children().children().html()
							+ '</div>');
		});

$(document)
		.on(
				"click",
				"#noEdit2",
				function() {
					$('#noEdit2')
							.replaceWith(
									'<div id="edit2"><div class="fr-wrapper" dir="auto"><div class="fr-element fr-view" dir="auto" contenteditable="true" aria-disabled="false" spellcheck="true">'
											+ $('#noEdit2').html()
											+ '</div></div></div>');
					edit2();
				});

// });
