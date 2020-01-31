
		var btnEdit = document.getElementById("edit"), btnCancel = document
				.getElementById("cancel"), btnSubmit = document
				.getElementById("submit"), options = document
				.getElementById("options"), fontList = document
				.getElementById("font-list"), fonts = fontList
				.getElementsByTagName("li"), btnBold = document
				.getElementById("bold"), sizeList = document
				.getElementById("size-list"), sizes = sizeList
				.getElementsByTagName("li"), colorList = document
				.getElementById("color-list"), colors = colorList
				.getElementsByTagName("li"), input = document
				.getElementById("input"), output = document
				.getElementById("output");

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

		
		
		
		