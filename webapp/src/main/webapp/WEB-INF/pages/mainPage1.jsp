<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" href="/resources/css/style1.css">
</head>
<body onload="getMail('inbox');">
	<div class="container app">
		<aside class="sidebar">
			<h1 class="logo">
				<a href="#" class="logo"><strong>lea</strong> mail platform</a>
			</h1>
			<nav class="main-nav">
				<ul>
					<li class="active"><br /> <a href="#" class="btn btn-primary"
						onclick="composeMail();">Compose new</a>
						<ul id="ul_menu">
							<li id="inbox" class="active"><a href="#"
								onclick="getMail('inbox');">Inbox</a></li>
							<li id="sent"><a href="#" onclick="getMail('outbox');">Sent</a></li>
						</ul></li>
				</ul>
			</nav>
		</aside>
		<div class="main">
			<header class="header">
				<nav class="nav-settings">
					<ul>
						<li><a href="#">Hi, ${user.username}</a></li>
						<li><a href="#" onClick="logout();">Logout</a></li>
						<li><a href="#" class="icon icon-gear"></a></li>
					</ul>
				</nav>
				<div class="clr"></div>
			</header>
			<div class="container" id="container_mail">
				<div class="messages">
					<h1 id="mail_list_name">
						Inbox
					</h1>
					<ul class="message-list" id="ul_messages">

						
					</ul>
				</div>
				<section class="message">
					<h2 id="mail_view_title"></h2>
					<div class="meta-data" id="mail_view_from"></div>
					<div class="body" id="mail_view_body"></div>
				</section>
			</div>
			<div class="container" id="container_compose" style="display:none">
				<section class="message">
					<div class="action">
						<p>To:</p>
						<div class="compose_area">
							<textarea name="r" placeholder="To" id="to"></textarea>

						</div>
						<p>Subject:</p>
						<div class="compose_area">
							<textarea name="r" placeholder="Subject" id="subject"></textarea>

						</div>
						<p>Mail message:</p>
						<div class="compose_area" >
							<textarea name="r" style="min-height: 100px;" id="daBody"></textarea>
						</div>
						<a href="#" class="btn btn-primary"
									onclick="sendMail();">Send</a>
					</div>
				</section>
			</div>
		</div>
	</div>

	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script type="text/javascript">
		var mailList = null;
		var currentMail = null;
		var currentPage = 'inbox';
		function logout() {
			window.location.href = "/";
		}
		window.setInterval(function(){
			if(currentPage != 'compose')	
			{
				getMail(currentPage);
			}
		}, 5000);
		function getMail(MailSource) {
			clearPrintMail();
			var container_mail = document.getElementById("container_mail");
			var cotainer_compose = document.getElementById("container_compose");
			container_compose.setAttribute("style","display:none");
			container_mail.removeAttribute("style");
			if (MailSource == 'inbox') {
				currentPage = 'inbox';
				document.getElementById("mail_list_name").innerHTML = "";
				document.getElementById("mail_list_name").appendChild(document
										.createTextNode("Inbox"));
				document.getElementById("inbox").className = "active";
				document.getElementById("sent").classList.remove("active");
			} else {
				currentPage = 'outbox';
				document.getElementById("mail_list_name").innerHTML = "";
				document.getElementById("mail_list_name").appendChild(document
										.createTextNode("Sent"));
				document.getElementById("sent").className = "active";
				document.getElementById("inbox").classList.remove("active");
			}
			firstItem = null;
			$.ajax({
				type : 'GET',
				url : MailSource,
				async : false,
				data : "id=${user.id}",
				success : function(data) {
					var ulst = document.getElementById("ul_messages");
					ulst.innerHTML = "";
					mailList = data;
					$(data).each(
							function(index, item) {
								var li = document.createElement("li");
								li.setAttribute("id", "mail_" + item.id);
								li.setAttribute("onclick", "printMail(this);")
								if(firstItem == null)
								{
									firstItem = "mail_" + item.id;
								}
								var checkbox = document.createElement("input");
								checkbox.setAttribute("type", "checkbox");
								var dasDiv = document.createElement("div");
								dasDiv.setAttribute("class", "preview");
								var subject = document.createElement("h3");
								subject.appendChild(document
										.createTextNode(item.subject));
								var date = document.createElement("small");
								date.appendChild(document
										.createTextNode(item.date));
								subject.appendChild(date);
								var preview = document.createElement("p");
								var strongText = document
										.createElement("strong");
								strongText.appendChild(document
										.createTextNode((item.message.length > 50) ? item.message.substring(0, 50) + "..." : item.message));
								preview.appendChild(strongText);
								dasDiv.appendChild(subject);
								dasDiv.appendChild(preview);
								li.appendChild(checkbox);
								li.appendChild(dasDiv);
								ulst.appendChild(li);
							});
				},
				error : function() {
					alert("Eroare! Va rugam reincercati mai tarziu!");
				}
			});
			if(firstItem != null)
			{
				document.getElementById(firstItem).click();
			}
		}
		function printMail(Element) {
			if (currentMail != null) {
				document.getElementById(currentMail).classList.remove("active");
			}
			document.getElementById(Element.id).className = "active";
			currentMail = Element.id;
			if (mailList == null) {
				return;
			}
			$(mailList).each(
					function(index, item) {
						if ("mail_" + item.id == Element.id) {
							var title = document
									.getElementById("mail_view_title");
							title.innerHTML = "";
							var span1 = document.createElement("span");
							span1.setAttribute("class", "icon-star-large");
							title.appendChild(span1);
							title.appendChild(document
									.createTextNode(item.subject));
							var span2 = document.createElement("span");
							span2
									.setAttribute("class",
											"icon icon-reply-large");
							title.appendChild(span2);
							var span3 = document.createElement("span");
							span3.setAttribute("class",
									"icon icon-delete-large");
							title.appendChild(span3);
							var from = document
									.getElementById("mail_view_from");
							from.innerHTML = "";
							var prgf = document.createElement("p");
							if(currentPage == 'inbox')
							{
								prgf.appendChild(document.createTextNode("From: " + item.from));
							}
							else
							{
								prgf.appendChild(document.createTextNode("To: " + item.to));
							}
							var span4 = document.createElement("span");
							span4.setAttribute("class", "date");
							span4.appendChild(document
									.createTextNode(item.date));
							prgf.appendChild(span4);
							from.appendChild(prgf);
							var body = document
									.getElementById("mail_view_body");
							body.innerHTML = "";
							body.appendChild(document
									.createTextNode(item.message));
						}
					});
		}
		function clearPrintMail(){
			var title = document
					.getElementById("mail_view_title");
			title.innerHTML = "";
			var span1 = document.createElement("span");
			span1.setAttribute("class", "icon-star-large");
			title.appendChild(span1);
			title.appendChild(document
					.createTextNode(""));
			var span2 = document.createElement("span");
			span2
					.setAttribute("class",
							"icon icon-reply-large");
			title.appendChild(span2);
			var span3 = document.createElement("span");
			span3.setAttribute("class",
					"icon icon-delete-large");
			title.appendChild(span3);
			var from = document
					.getElementById("mail_view_from");
			from.innerHTML = "";
			var prgf = document.createElement("p");
			prgf.appendChild(document.createTextNode(" "));
			var span4 = document.createElement("span");
			span4.setAttribute("class", "date");
			span4.appendChild(document
					.createTextNode(""));
			prgf.appendChild(span4);
			from.appendChild(prgf);
			var body = document
					.getElementById("mail_view_body");
			body.innerHTML = "";
			body.appendChild(document
					.createTextNode(""));
		}
		function get_XmlHttp() {
			// Creaza variabila care va contine instanta la XMLHttpRequest, initial cu valoare nula
			var xmlHttp = null;
			if (window.XMLHttpRequest) { // Daca browser-ul e Forefox, Opera, Safari, ...
				xmlHttp = new XMLHttpRequest();
			} else if (window.ActiveXObject) { // Daca browser-ul este Internet Explorer
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			return xmlHttp;
		}
		function composeMail() {
			currentPage = 'compose';
			var container_mail = document.getElementById("container_mail");
			var cotainer_compose = document.getElementById("container_compose");
			container_mail.setAttribute("style","display:none");
			container_compose.removeAttribute("style");
		}
		function sendMail()
		{
			var to = document.getElementById("to").value;
			var subject = document.getElementById("subject").value;
			var dabody = document.getElementById("daBody").value;
			$.ajax({
					type: 'PUT',
				    url: "sendMail",
				    async: false,
				    data: "to=" + to +"&idFrom=${user.id}" + "&subject=" +  subject + "&text=" + dabody,
				    success: function(data) {
				    	alert("Mail-ul a fost trimis cu succes");
				    	window.location.href="mainPage?id="+data.user.id;
				    		       
				    },
				    error:function() {
				    	alert("Eroare! Va rugam reincercati mai tarziu!");
				    }
				});
		}
	</script>

</body>
</html>