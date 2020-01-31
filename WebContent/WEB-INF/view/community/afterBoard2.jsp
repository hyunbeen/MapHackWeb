<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style type="text/css">

html {
  box-sizing: border-box;
  height: 100%;
}

*, *:before, *:after {
  box-sizing: inherit;
}

body {
  height: 100%;
  font-family: "Open Sans", sans-serif;
  font-size: 18px;
  margin: 0;
  overflow: hidden;
}

.hidden {
  display: none !important;
}

.container {
  position: absolute;
  left: 50%;
  width: 600px;
  height: 100%;
  -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
}

.text-area {
  position: relative;
  height: calc(100% - 160px);
  background-color: #bbb;
}

.text-input {
  width: 100%;
  height: 100%;
  outline: none;
  resize: none;
  padding: 10px;
  font-family: inherit;
  font-size: inherit;
  border: 2px solid #0E9AA7;
}

.text-output {
  position: absolute;
  top: 0;
  bottom: 0;
  width: 100%;
  padding: 10px;
  overflow-y: auto;
  background: #fff;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}

.btn-bar {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  height: 120px;
  z-index: 10;
}

.btn-area {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.btn {
  position: relative;
  width: 44px;
  height: 44px;
  padding: 10px;
  border-radius: 50%;
  background-color: #D8E2EC;
  color: #0E9AA7;
}
.btn:not(:last-child) {
  margin-right: 10px;
}
.btn:hover, .btn.activated {
  background-color: #0E9AA7;
  color: #D8E2EC;
}
.btn:hover {
  cursor: pointer;
}
.btn:hover > .dropdown {
  display: block;
}
.btn:hover > .color-picker {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
}
.btn > svg {
  fill: currentColor;
}
.btn-small {
  width: 32px;
  height: 32px;
  padding: 6px 7px;
}

.dropdown,
.color-picker {
  display: none;
  position: absolute;
  top: 44px;
  left: 5px;
  margin: 0;
  padding: 5px 5px 0;
  border-radius: 5px;
  background-color: #D8E2EC;
  list-style: none;
  font-size: 15px;
}
.dropdown::after,
.color-picker::after {
  content: "";
  position: absolute;
  top: -6px;
  left: 10px;
  display: block;
  z-index: 1;
  width: 14px;
  height: 14px;
  border-radius: 3px;
  background-color: #D8E2EC;
  -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
}
.dropdown > *,
.color-picker > * {
  position: relative;
  margin: 0 0 5px;
  z-index: 2;
  border-radius: 4px;
}

.dropdown > li {
  padding: 5px 10px;
  color: #0E9AA7;
  white-space: nowrap;
}
.dropdown > li:hover, .dropdown > li.activated {
  background-color: #0E9AA7;
  color: #D8E2EC;
}

.color-picker {
  -ms-flex-wrap: wrap;
      flex-wrap: wrap;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  width: 75px;
}
.color-picker > li {
  width: 30px;
  height: 20px;
}





.btn-edit-cancel,
.btn-edit-submit {
  display: none;
}

.btn-edit.activated ~ .btn-edit-cancel,
.btn-edit.activated ~ .btn-edit-submit {
  display: block;
}

[data-font="font-sans"] {
  font-family: "Open Sans", sans-serif;
}

[data-font="font-serif"] {
  font-family: "Lora", serif;
}

[data-font="font-mono"] {
  font-family: "Source Code Pro", monospace;
}

[data-font="font-hand"] {
  font-family: "Dancing Script", cursive;
  font-size: 120%;
}

.font-bold {
  font-weight: 700;
}

.text-output[data-size="12"] {
  font-size: 12px;
}
.text-output[data-size="15"] {
  font-size: 15px;
}
.text-output[data-size="18"] {
  font-size: 18px;
}
.text-output[data-size="24"] {
  font-size: 24px;
}

</style>
</head>
<body>

	<div class="page">
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
		<section class="section section-xl bg-gray-lighter"
			style="padding-bottom: 80px;">


		<div class="container">
			<div class="btn-bar">
				<div class="btn-area">
					<div class="btn btn-edit" id="edit">
						<svg viewBox="0 0 16 16"> <path class="path1"
							d="M13.5 0c1.381 0 2.5 1.119 2.5 2.5 0 0.563-0.186 1.082-0.5 1.5l-1 1-3.5-3.5 1-1c0.418-0.314 0.937-0.5 1.5-0.5zM1 11.5l-1 4.5 4.5-1 9.25-9.25-3.5-3.5-9.25 9.25zM11.181 5.681l-7 7-0.862-0.862 7-7 0.862 0.862z"></path>
						</svg>
					</div>
					<div class="btn btn-small btn-edit-cancel" id="cancel">
						<svg viewBox="-2 0 25 28"> <path class="path1"
							d="M20.281 20.656q0 0.625-0.438 1.062l-2.125 2.125q-0.438 0.438-1.062 0.438t-1.062-0.438l-4.594-4.594-4.594 4.594q-0.438 0.438-1.062 0.438t-1.062-0.438l-2.125-2.125q-0.438-0.438-0.438-1.062t0.438-1.062l4.594-4.594-4.594-4.594q-0.438-0.438-0.438-1.062t0.438-1.062l2.125-2.125q0.438-0.438 1.062-0.438t1.062 0.438l4.594 4.594 4.594-4.594q0.438-0.438 1.062-0.438t1.062 0.438l2.125 2.125q0.438 0.438 0.438 1.062t-0.438 1.062l-4.594 4.594 4.594 4.594q0.438 0.438 0.438 1.062z"></path>
						</svg>
					</div>
					<div class="btn btn-small btn-edit-submit" id="submit">
						<svg viewBox="0 0 16 16"> <path class="path1"
							d="M13.5 2l-7.5 7.5-3.5-3.5-2.5 2.5 6 6 10-10z"></path> </svg>
					</div>
				</div>
				<div class="btn-area" id="options">
					<div class="btn" id="font">
						<svg viewBox="0 0 16 16"> <path class="path1"
							d="M12.494 0.253c-1.414 0-2.322-0.253-3.779-0.253-4.708 0-6.903 2.681-6.903 5.404 0 1.604 0.76 2.132 2.259 2.132-0.106-0.232-0.296-0.486-0.296-1.626 0-3.188 1.203-4.117 2.744-4.18 0 0-1.264 12.396-4.934 13.883v0.385h4.947l1.688-8h3.091l0.689-2h-3.358l0.812-3.847c0.929 0.19 1.837 0.38 2.618 0.38 0.971 0 1.858-0.296 2.343-2.533-0.591 0.19-1.224 0.253-1.921 0.253z"></path>
						</svg>
						<ul class="dropdown" id="font-list">
							<li class="font-sans activated" data-font="font-sans">Open
								Sans</li>
							<li class="font-serif" data-font="font-serif">Lora</li>
							<li class="font-mono" data-font="font-mono">Source Code Pro</li>
							<li class="font-hand" data-font="font-hand">Dancing Script</li>
						</ul>
					</div>
					<div class="btn" id="bold">
						<svg viewBox="0 0 16 16"> <path class="path1"
							d="M11.061 7.573c0.586-0.696 0.939-1.594 0.939-2.573 0-2.206-1.794-4-4-4h-5v14h6c2.206 0 4-1.794 4-4 0-1.452-0.778-2.726-1.939-3.427zM6 3h1.586c0.874 0 1.586 0.897 1.586 2s-0.711 2-1.586 2h-1.586v-4zM8.484 13h-2.484v-4h2.484c0.913 0 1.656 0.897 1.656 2s-0.743 2-1.656 2z"></path>
						</svg>
					</div>
					<div class="btn" id="size">
						<svg viewBox="0 0 16 16"> <path class="path1"
							d="M1 8h6v2h-2v6h-2v-6h-2zM15 4h-3.934v12h-2.133v-12h-3.934v-2h10z"></path>
						</svg>
						<ul class="dropdown" id="size-list">
							<li>15</li>
							<li class="activated">18</li>
							<li>24</li>
							<li>32</li>
						</ul>
					</div>
					<div class="btn" id="color">
						<svg viewBox="0 0 16 16"> <path class="path1"
							d="M13.51 7.393c-1.027-2.866-3.205-5.44-5.51-7.393-2.305 1.953-4.482 4.527-5.51 7.393-0.635 1.772-0.698 3.696 0.197 5.397 1.029 1.955 3.104 3.21 5.313 3.21s4.284-1.255 5.313-3.21c0.895-1.701 0.832-3.624 0.197-5.397zM11.543 11.859c-0.684 1.301-2.075 2.141-3.543 2.141-0.861 0-1.696-0.29-2.377-0.791 0.207 0.027 0.416 0.041 0.627 0.041 1.835 0 3.573-1.050 4.428-2.676 0.701-1.333 0.64-2.716 0.373-3.818 0.227 0.44 0.42 0.878 0.576 1.311 0.353 0.985 0.625 2.443-0.084 3.791z"></path>
						</svg>
						<ul class="color-picker" id="color-list">
							<li style="background: #000000" data-color="000000"></li>
							<li style="background: #647387" data-color="647387"></li>
							<li style="background: #FFC153" data-color="FFC153"></li>
							<li style="background: #FF7416" data-color="FF7416"></li>
							<li style="background: #C82647" data-color="C82647"></li>
							<li style="background: #702A87" data-color="702A87"></li>
							<li style="background: #1D628B" data-color="1D628B"></li>
							<li style="background: #5BC0DE" data-color="5BC0DE"></li>
							<li style="background: #4A6B4E" data-color="4A6B4E"></li>
							<li style="background: #62C462" data-color="62C462"></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="text-area">
				<textarea class="text-input hidden" id="input"></textarea>
				<div class="text-output" id="output"></div>
			</div>
		</div>
</section>
</div>

	<script type="text/javascript">
	
	
	var btnEdit = document.getElementById("edit"),
	  btnCancel = document.getElementById("cancel"),
	  btnSubmit = document.getElementById("submit"),
	  options = document.getElementById("options"),
	  fontList = document.getElementById("font-list"),
	  fonts = fontList.getElementsByTagName("li"),
	  btnBold = document.getElementById("bold"),
	  sizeList = document.getElementById("size-list"),
	  sizes = sizeList.getElementsByTagName("li"),
	  colorList = document.getElementById("color-list"),
	  colors = colorList.getElementsByTagName("li"),
	  input = document.getElementById("input"),
	  output = document.getElementById("output");

	function setFont(elem) {
	  var font = elem.getAttribute("data-font");
	  output.setAttribute("data-font", font);
	  for (var i = 0; i < fonts.length; i++) {
	    fonts[i].classList.remove("activated");
	  }
	  elem.classList.add("activated");
	}

	function setBold() {
	  btnBold.classList.toggle("activated");
	  if (btnBold.classList.contains("activated")) {
	    output.classList.add("font-bold");
	  } else {
	    output.classList.remove("font-bold");
	  }
	}

	function setSize(elem) {
	  size = elem.innerHTML + "px";
	  output.style.fontSize = size;
	  for (var i = 0; i < sizes.length; i++) {
	    sizes[i].classList.remove("activated");
	  }
	  elem.classList.add("activated");
	}

	function setColor(elem) {
	  color = "#" + elem.getAttribute("data-color");
	  output.style.color = color;
	  for (var i = 0; i < colors.length; i++) {
	    colors[i].classList.remove("activated");
	  }
	  elem.classList.add("activated");
	}

	function activateInput() {
	  var currentText = output.innerHTML;
	  input.value = currentText.replace(/<br>/g, "\n");
	  btnEdit.classList.add("activated");
	  options.classList.add("hidden");
	  output.classList.add("hidden");
	  input.classList.remove("hidden");
	  input.focus();
	}

	function submitInput() {
	  var newText = input.value;
	  output.innerHTML = newText.replace(/\n\r?/g, "<br>");
	  deactivateInput();
	}

	function deactivateInput() {
	  btnEdit.classList.remove("activated");
	  options.classList.remove("hidden");
	  input.classList.add("hidden");
	  output.classList.remove("hidden");
	}

	(function init() {
	  // add event handler: option buttons
	  // ---------------------------------

	  // font-family
	  for (var i = 0; i < fonts.length; i++) {
	    fonts[i].addEventListener("click", function() {
	      setFont(this);
	    });
	  }

	  // font-weight
	  btnBold.addEventListener("click", function() {
	    setBold();
	  });

	  // font-size
	  for (var i = 0; i < sizes.length; i++) {
	    sizes[i].addEventListener("click", function() {
	      setSize(this);
	    });
	  }

	  // color
	  for (var i = 0; i < colors.length; i++) {
	    colors[i].addEventListener("click", function() {
	      setColor(this);
	    });
	  }

	  // add event handler: edit text
	  // ----------------------------

	  // start editing
	  btnEdit.addEventListener("click", function() {
	    if (!btnEdit.classList.contains("activated")) {
	      activateInput();
	    }
	  });

	  // cancel editing
	  btnCancel.addEventListener("click", function() {
	    deactivateInput();
	  });

	  // submit text
	  btnSubmit.addEventListener("click", function() {
	    submitInput();
	  });

	  // open input for initial text
	  // ---------------------------
	  activateInput();
	})();

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		/**
		 *  Plugin name:SWEDitor
		 *  Author: Moncho Varela / nakome
		 *  Date: 20/10/2013 ten day for my birthday LOL
		 *  @nakome on twitter
		 */
// 		(function(window) {

// 			'use strict';

// 			function getTemplate(el) {
// 				// Template html
// 				var html = '<div class="box-editor">'
// 						+ '<div id="thisForm">'
// 						+ '<input type="hidden" name="myDoc">'
// 						+ '<div id="toolBar2">'
// 						+ '<label class="custom-select fonthd">'
// 						+ '<select class="selectThis" data-chg="formatblock">'
// 						+ '<option selected>:: Formatting </option>'
// 						+ '<option value="h1">Header &lt;h1&gt;</option>'
// 						+ '<option value="h2">Header &lt;h2&gt;</option>'
// 						+ '<option value="h3">Header &lt;h3&gt;</option>'
// 						+ '<option value="h4">Header &lt;h4&gt;</option>'
// 						+ '<option value="h5">Header &lt;h5&gt;</option>'
// 						+ '<option value="h6">Header &lt;h6&gt;</option>'
// 						+ '<option value="p">Paragraph <p></option>'
// 						+ '<option value="pre">Preformatted <pre></option>'
// 						+ '</select>'
// 						+ '</label>'
// 						+ '<label class="custom-select fontFam">'
// 						+ '<select class="selectThis" data-chg="fontname">'
// 						+ '<option class="heading" selected>:: Font</option>'
// 						+ '<option value=\' Arial, "Helvetica Neue", Helvetica, sans-serif\'>Arial</option>'
// 						+ '<option value=\' "Arial Black", "Arial Bold", Gadget, sans-serif\'>Arial Black</option>'
// 						+ '<option value=\' "Arial Narrow", Arial, sans-serif\'>Arial Narrow</option>'
// 						+ '<option value=\' "Arial Rounded MT Bold", "Helvetica Rounded", Arial, sans-serif\'>Arial Rounded MT Bold</option>'
// 						+ '<option value=\' "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif\'>Avant Garde</option>'
// 						+ '<option value=\' Calibri, Candara, Segoe, "Segoe UI", Optima, Arial, sans-serif\'>Calibri</option>'
// 						+ '<option value=\' Candara, Calibri, Segoe, "Segoe UI", Optima, Arial, sans-serif\'>Candara</option>'
// 						+ '<option value=\' "Century Gothic", CenturyGothic, AppleGothic, sans-serif\'>Century Gothic</option>'
// 						+ '<option value=\' "Franklin Gothic Medium", "Franklin Gothic", "ITC Franklin Gothic", Arial, sans-serif\'>Franklin Gothic Medium</option>'
// 						+ '<option value=\' Futura, "Trebuchet MS", Arial, sans-serif\'>Futura</option>'
// 						+ '<option value=\' Geneva, Tahoma, Verdana, sans-serif\'>Geneva</option>'
// 						+ '<option value=\' "Gill Sans", "Gill Sans MT", Calibri, sans-serif\'>Gill Sans</option>'
// 						+ '<option value=\' "Helvetica Neue", Helvetica, Arial, sans-serif\'>Helvetica Neue</option>'
// 						+ '<option value=\' Impact, Haettenschweiler, "Franklin Gothic Bold", Charcoal, "Helvetica Inserat", "Bitstream Vera Sans Bold", "Arial Black", sans serif\'>Impact</option>'
// 						+ '<option value=\' "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif\'>Lucida Grande</option>'
// 						+ '<option value=\' Optima, Segoe, "Segoe UI", Candara, Calibri, Arial, sans-serif\'>Optima</option>'
// 						+ '<option value=\' "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif\'>Segoe UI</option>'
// 						+ '<option value=\' Tahoma, Verdana, Segoe, sans-serif\'>Tahoma</option>'
// 						+ '<option value=\' "Trebuchet MS", "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Tahoma, sans-serif\'>Trebuchet MS</option>'
// 						+ '<option value=\' Verdana, Geneva, sans-serif\'>Verdana</option>'
// 						+ '<option value=\' Baskerville, "Baskerville Old Face", "Hoefler Text", Garamond, "Times New Roman", serif\'>Baskerville</option>'
// 						+ '<option value=\' "Bodoni MT", Didot, "Didot LT STD", "Hoefler Text", Garamond, "Times New Roman", serif\'>Bodoni MT</option>'
// 						+ '<option value=\' "Book Antiqua", Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif\'>Book Antiqua</option>'
// 						+ '<option value=\' "Calisto MT", "Bookman Old Style", Bookman, "Goudy Old Style", Garamond, "Hoefler Text", "Bitstream Charter", Georgia, serif\'>Calisto MT</option>'
// 						+ '<option value=\' Cambria, Georgia, serif\'>Cambria</option>'
// 						+ '<option value=\' Didot, "Didot LT STD", "Hoefler Text", Garamond, "Times New Roman", serif\'>Didot</option>'
// 						+ '<option value=\' Garamond, Baskerville, "Baskerville Old Face", "Hoefler Text", "Times New Roman", serif\'>Garamond</option>'
// 						+ '<option value=\' Georgia, Times, "Times New Roman", serif\'>Georgia</option>'
// 						+ '<option value=\' "Goudy Old Style", Garamond, "Big Caslon", "Times New Roman", serif\'>Goudy Old Style</option>'
// 						+ '<option value=\' "Hoefler Text", "Baskerville old face", Garamond, "Times New Roman", serif\'>Hoefler Text</option>'
// 						+ '<option value=\' "Lucida Bright", Georgia, serif\'>Lucida Bright</option>'
// 						+ '<option value=\' Palatino, "Palatino Linotype", "Palatino LT STD", "Book Antiqua", Georgia, serif\'>Palatino</option>'
// 						+ '<option value=\' Perpetua, Baskerville, "Big Caslon", "Palatino Linotype", Palatino, "URW Palladio L", "Nimbus Roman No9 L", serif\'>Perpetua</option>'
// 						+ '<option value=\' Rockwell, "Courier Bold", Courier, Georgia, Times, "Times New Roman", serif\'>Rockwell</option>'
// 						+ '<option value=\' "Rockwell Extra Bold", "Rockwell Bold", monospace\'>Rockwell Extra Bold</option>'
// 						+ '<option value=\' TimesNewRoman, "Times New Roman", Times, Baskerville, Georgia, serif\'>TimesNewRoman</option>'
// 						+ '<option value=\' "Andale Mono", AndaleMono, monospace\'>Andale Mono</option>'
// 						+ '<option value=\' Consolas, monaco, monospace\'>Consolas</option>'
// 						+ '<option value=\' "Courier New", Courier, "Lucida Sans Typewriter", "Lucida Typewriter", monospace\'>Courier New</option>'
// 						+ '<option value=\' "Lucida Console", "Lucida Sans Typewriter", Monaco, "Bitstream Vera Sans Mono", monospace\'>Lucida Console</option>'
// 						+ '<option value=\' "Lucida Sans Typewriter", "Lucida Console", Monaco, "Bitstream Vera Sans Mono", monospace\'>Lucida Sans Typewriter</option>'
// 						+ '<option value=\' Monaco, Consolas, "Lucida Console", monospace\'>Monaco</option>'
// 						+ '<option value=\' Copperplate, "Copperplate Gothic Light", fantasy\'>Copperplate</option>'
// 						+ '<option value=\' Papyrus, fantasy\'>Papyrus</option>'
// 						+ '<option value=\' "Brush Script MT", cursive\'>Brush Script MT</option>  '
// 						+ '</select></label>'
// 						+ '<label class="custom-select fontSi">'
// 						+ '<select class="selectThis" data-chg="fontsize">'
// 						+ '<option class="heading" selected>:: Size</option>'
// 						+ '<option value="1">Very small</option>'
// 						+ '<option value="2">A bit small</option>'
// 						+ '<option value="3">Normal</option>'
// 						+ '<option value="4">Medium-large</option>'
// 						+ '<option value="5">Big</option>'
// 						+ '<option value="6">Very big</option>'
// 						+ '<option value="7">Maximum</option>'
// 						+ '</select>'
// 						+ '</label>'
// 						+ '<label class="custom-select fontCol">'
// 						+ '<select class="selectThis" data-chg="forecolor">'
// 						+ '<option class="heading" selected>:: Color</option>'
// 						+ '<option value="#1abc9c" style="background:#1abc9c;"> turquoise</option>'
// 						+ '<option value="#16a085" style="background:#16a085;"> greensea</option>'
// 						+ '<option value="#2ecc71" style="background:#2ecc71;"> emerald</option>'
// 						+ '<option value="#27ae60" style="background:#27ae60;"> nephritis</option>'
// 						+ '<option value="#3498db" style="background:#3498db;"> peterriver</option>'
// 						+ '<option value="#2980b9" style="background:#2980b9;"> belizehole</option>'
// 						+ '<option value="#9b59b6" style="background:#9b59b6;"> amethyst</option>'
// 						+ '<option value="#8e44ad" style="background:#8e44ad;"> westeria</option>'
// 						+ '<option value="#34495e" style="background:#34495e;"> wetasphalt</option>'
// 						+ '<option value="#2c3e50" style="background:#2c3e50;"> midnightblue</option>'
// 						+ '<option value="#f1c40f" style="background:#f1c40f;"> sunflower</option>'
// 						+ '<option value="#f39c12" style="background:#f39c12;"> orange</option>'
// 						+ '<option value="#e67e22" style="background:#e67e22;"> carrot</option>'
// 						+ '<option value="#d35400" style="background:#d35400;"> pumpkin</option>'
// 						+ '<option value="#e74c3c" style="background:#e74c3c;"> alizarin</option>'
// 						+ '<option value="#c0392b" style="background:#c0392b;"> pomegranate</option>'
// 						+ '<option value="#ecf0f1" style="background:#ecf0f1;"> clouds</option>'
// 						+ '<option value="#bdc3c7" style="background:#bdc3c7;"> silver</option>'
// 						+ '<option value="#95a5a6" style="background:#95a5a6;"> concrete</option>'
// 						+ '<option value="#7f8c8d" style="background:#7f8c8d;"> abestos</option>'
// 						+ '</select>'
// 						+ '</label>'
// 						+ '<label class="custom-select fontBck">'
// 						+ '<select class="selectThis" data-chg="backcolor">'
// 						+ '<option class="heading" selected>:: Background </option>'
// 						+ '<option value="#1abc9c" style="background:#1abc9c;"> turquoise</option>'
// 						+ '<option value="#16a085" style="background:#16a085;"> greensea</option>'
// 						+ '<option value="#2ecc71" style="background:#2ecc71;"> emerald</option>'
// 						+ '<option value="#27ae60" style="background:#27ae60;"> nephritis</option>'
// 						+ '<option value="#3498db" style="background:#3498db;"> peterriver</option>'
// 						+ '<option value="#2980b9" style="background:#2980b9;"> belizehole</option>'
// 						+ '<option value="#9b59b6" style="background:#9b59b6;"> amethyst</option>'
// 						+ '<option value="#8e44ad" style="background:#8e44ad;"> westeria</option>'
// 						+ '<option value="#34495e" style="background:#34495e;"> wetasphalt</option>'
// 						+ '<option value="#2c3e50" style="background:#2c3e50;"> midnightblue</option>'
// 						+ '<option value="#f1c40f" style="background:#f1c40f;"> sunflower</option>'
// 						+ '<option value="#f39c12" style="background:#f39c12;"> orange</option>'
// 						+ '<option value="#e67e22" style="background:#e67e22;"> carrot</option>'
// 						+ '<option value="#d35400" style="background:#d35400;"> pumpkin</option>'
// 						+ '<option value="#e74c3c" style="background:#e74c3c;"> alizarin</option>'
// 						+ '<option value="#c0392b" style="background:#c0392b;"> pomegranate</option>'
// 						+ '<option value="#ecf0f1" style="background:#ecf0f1;"> clouds</option>'
// 						+ '<option value="#bdc3c7" style="background:#bdc3c7;"> silver</option>'
// 						+ '<option value="#95a5a6" style="background:#95a5a6;"> concrete</option>'
// 						+ '<option value="#7f8c8d" style="background:#7f8c8d;"> abestos</option>'
// 						+ '</select>'
// 						+ '</label>'
// 						+ '<input type="checkbox" name="switchMode" id="switchBox"/>'
// 						+ '<label for="switchBox" class="intLink"><i class="icon-code"></i></label>'
// 						+ '<a href="javascript:void(0);" class="intLink" title="Clean" id="getClean">'
// 						+ '<i class="icon-eraser"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink" title="Print" id="getPrint">'
// 						+ '<i class="icon-print"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Undo"  data-fn="undo">'
// 						+ '<i class="icon-undo"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Redo"  data-fn="redo">'
// 						+ '<i class="icon-repeat"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Remove formatting"  data-fn="removeFormat">'
// 						+ '<i class="icon-remove"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Bold"  data-fn="bold">'
// 						+ '<i class="icon-bold"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Italic"  data-fn="italic">'
// 						+ '<i class="icon-italic"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Underline"  data-fn="underline">'
// 						+ '<i class="icon-underline"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Left align"  data-fn="justifyleft">'
// 						+ '<i class="icon-align-left"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Center align"  data-fn="justifycenter">'
// 						+ '<i class="icon-align-center"></i>'
// 						+ '</a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Right align"  data-fn="justifyright">'
// 						+ '<i class="icon-align-right">'
// 						+ '</i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Numbered list"  data-fn="insertorderedList">'
// 						+ '<i class="icon-list-ol"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Dotted list"  data-fn="insertunorderedList">'
// 						+ '<i class="icon-list-ul"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink" title="Quote"  id="quote" data-fn="blockquote">'
// 						+ '<i class="icon-quote-left"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Add indentation"  data-fn="indent">'
// 						+ '<i class="icon-indent-right"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Delete indentation"  data-fn="outdent">'
// 						+ '<i class="icon-indent-left"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink" title="Hyperlink" id="getLink" data-fn="createlink">'
// 						+ '<i class="icon-link"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Unlink"  data-fn="unlink">'
// 						+ '<i class="icon-unlink"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Select all"  data-fn="selectall">'
// 						+ '<i class="icon-copy"></i></a>'
// 						+ '<a href="javascript:void(0);" class="intLink formatBlock" title="Get hr"  data-fn="inserthorizontalrule">'
// 						+ 'HR </a>'
// 						+ ' <a href="javascript:void(0);" class="intLink" title="Get img" id="getImg" data-fn="insertImage">'
// 						+ '<i class="icon-picture">' + '</i></a>' + ' </div>'
// 						+ '<div id="textBox" contenteditable="true">'
// 						+ '</div></div></div>';
// 				// render html
// 				el.innerHTML = html;
// 			}

// 			function initDoc(fm, bx) {
// 				var elem = bx, sDefTxt;
// 				sDefTxt = bx.innerHTML;
// 				if (fm.checked) {
// 					setDocMode(true);
// 				}
// 			}

// 			function formatDoc(obj, val) {
// 				if (validateMode()) {
// 					document.execCommand(obj, false, val);
// 				}
// 			}

// 			function validateMode() {
// 				var thisForm = document.querySelector('#thisForm');
// 				if (!thisForm.checked) {
// 					return true;
// 				}
// 				alert("Uncheck \"Show HTML\".");
// 				return false;
// 			}

// 			function setDocMode(source, oDoc) {
// 				var sDefTxt = oDoc.innerHTML;
// 				var oContent;
// 				if (source) {
// 					oContent = document.createTextNode(sDefTxt);
// 					oDoc.innerHTML = "";
// 					var oPre = document.createElement("pre");
// 					oDoc.contentEditable = false;
// 					oPre.id = "sourceText";
// 					oPre.contentEditable = true;
// 					oPre.appendChild(oContent);
// 					oDoc.appendChild(oPre);
// 				} else {
// 					if (document.all) {
// 						sDefTxt = oDoc.innerText;
// 					} else {
// 						oContent = document.createRange();
// 						oContent.selectNodeContents(oDoc.firstChild);
// 						oDoc.innerHTML = oContent.toString();
// 					}
// 					oDoc.contentEditable = true;
// 				}
// 			}

// 			// print function 

// 			function printDoc(el) {
// 				if (!validateMode()) {
// 					return;
// 				}
// 				var oPrntWin = window
// 						.open(
// 								"",
// 								"_blank",
// 								"width=450,height=470,left=400,top=100,menubar=yes,toolbar=no,location=no,scrollbars=yes");
// 				oPrntWin.document.open();
// 				oPrntWin.document
// 						.write('<!doctype html><html><head><title>Print<\/title><\/head><body onload=\"print();\">'
// 								+ el + '<\/body><\/html>');
// 				oPrntWin.document.close();
// 			}

// 			// extend options

// 			function extend(a, b) {
// 				for ( var key in b) {
// 					if (b.hasOwnProperty(key)) {
// 						a[key] = b[key];
// 					}
// 				}
// 				return a;
// 			}

// 			function sweDitor(elem, options) {
// 				// The div of editor
// 				this.elem = elem;
// 				// The options  ex. this.options.type = hello
// 				this.options = extend(this.defaults, options);
// 				// Get Template
// 				getTemplate(elem);
// 				// Start init
// 				this._init();
// 			}

// 			sweDitor.prototype = {
// 				// this.options.type
// 				defaults : {
// 					textArea : 'editor_area',
// 					showTextarea : true
// 				},

// 				// this._init();
// 				_init : function() {
// 					var self = this;
// 					// Div of content
// 					this.box = document.querySelector('#textBox');
// 					// array for change event
// 					this.selects = Array.prototype.slice.call(this.elem
// 							.querySelectorAll('.selectThis'));
// 					// array for click event
// 					this.formats = Array.prototype.slice.call(this.elem
// 							.querySelectorAll('.formatBlock'));
// 					// get print id
// 					this.getPrint = document.getElementById('getPrint');
// 					// The textarea
// 					this.textArea = document
// 							.getElementById(this.options.textArea);
// 					// get clean id
// 					this.getClean = document.getElementById('getClean');
// 					// get link id
// 					this.getLink = document.getElementById('getLink');
// 					// get img id 
// 					this.getImg = document.getElementById('getImg');
// 					// get switchbox
// 					this.quote = document.getElementById('quote');
// 					// get switchbox
// 					this.switchBox = document.getElementById('switchBox');
// 					// Init Doc function
// 					initDoc(this, this.textArea);
// 					this._initEvents();
// 				},

// 				// this._initEvents();
// 				_initEvents : function() {

// 					var self = this;

// 					//Show or hide textarea
// 					if (this.options.showTextarea === true) {
// 						self.textArea.style.display = 'block';
// 					} else {
// 						self.textArea.style.display = 'none';
// 					}

// 					// On ready copy text of text area
// 					this.box.innerHTML = this.textArea.textContent;
// 					// On keyup copy text on textarea
// 					this.box.addEventListener('keyup', function() {
// 						self.textArea.textContent = self.box.innerHTML;
// 					}, false);
// 					// On keydown copy text on textarea
// 					this.box.addEventListener('keydown', function() {
// 						self.textArea.textContent = self.box.innerHTML;
// 					}, false);
// 					// add event on change for  all selects 
// 					this.selects
// 							.forEach(function(el, i) {
// 								el
// 										.addEventListener(
// 												'change',
// 												function() {
// 													formatDoc(
// 															this
// 																	.getAttribute('data-chg'),
// 															this.value);
// 													self.textArea.textContent = self.box.innerHTML;
// 												}, false);
// 							});
// 					// get print
// 					this.getPrint.addEventListener('click', function() {
// 						printDoc(self.textArea.textContent);
// 						self.textArea.textContent = self.box.innerHTML;
// 					}, false);
// 					// get clean
// 					this.getClean.addEventListener('click', function() {
// 						if (validateMode() && confirm('Are you sure?')) {
// 							self.box.innerHTML = '';
// 						}
// 						self.textArea.textContent = self.box.innerHTML;
// 					}, false);
// 					// link listener
// 					this.getLink.addEventListener('click', function() {
// 						var sLnk = prompt('Write the URL here', 'http:\/\/');
// 						if (sLnk && sLnk !== '' && sLnk !== 'http://') {
// 							formatDoc(this.getAttribute('data-fn'), sLnk);
// 							self.textArea.textContent = self.box.innerHTML;
// 						}
// 					}, false);
// 					// img listener
// 					this.getImg.addEventListener('click', function() {
// 						var simg = prompt('Write the URL of image here',
// 								'http:\/\/');
// 						if (simg && simg !== '') {
// 							formatDoc(this.getAttribute('data-fn'), simg);
// 							self.textArea.textContent = self.box.innerHTML;
// 						}
// 					}, false);

// 					// all other formats  
// 					this.formats.forEach(function(el, i) {
// 						el.addEventListener('click', function() {
// 							formatDoc(this.getAttribute('data-fn'));
// 							self.textArea.textContent = self.box.innerHTML;
// 						}, false);
// 					});
// 					// blockquote
// 					this.quote.addEventListener('click', function() {
// 						formatDoc('formatblock', this.getAttribute('data-fn'));
// 						self.textArea.textContent = self.box.innerHTML;
// 					}, false);
// 					// swich pre code
// 					this.switchBox.addEventListener('change', function() {
// 						setDocMode(this.checked, self.box);
// 						self.textArea.textContent = self.box.innerHTML;
// 					}, false);
// 				}

// 			};

// 			// add to global namespace
// 			window.sweDitor = sweDitor;

// 		})(window);

// 		// Init editor
// 		new sweDitor(document.getElementById('editor_panel'), {
// 			textArea : 'editor_area', //id of textarea
// 			showTextarea : false
// 		// if true show hidden text area
// 		});
	</script>

	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>


</body>
</html>