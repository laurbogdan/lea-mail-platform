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
				<a href="#">Simpl<strong>est</strong></a>
			</h1>
			<nav class="main-nav">
				<ul>
					<li class="active"><br /> <a href="#" class="btn btn-primary">Compose
							new</a>
						<ul id="ul_menu">
							<li id="inbox" class="active"><a href="#"
								onclick="getMail('inbox');">Inbox <span
									class="btn btn-primary">25</span></a></li>
							<li><a href="#">Drafts</a></li>
							<li id="sent"><a href="#" onclick="getMail('outbox');">Sent</a></li>
							<li><a href="#">Trash</a></li>
							<li><a href="#">Junk Mail</a></li>
						</ul></li>
				</ul>
			</nav>
		</aside>
		<div class="main">
			<header class="header">
				<form action="">
					<input type="search" name="s" placeholder="Search on simplest" />
				</form>
				<nav class="nav-settings">
					<ul>
						<li><a href="#">Hi, ${user.username}</a></li>
						<li><a href="#" onClick="logout();">Logout</a></li>
						<li><a href="#" class="icon icon-gear"></a></li>
					</ul>
				</nav>
				<div class="clr"></div>
			</header>
			<div class="container">
				<div class="messages">
					<h1>
						Inbox <span class="icon icon-arrow-down"></span>
					</h1>
					<form action="">
						<input type="search" class="search" placeholder="Search Inbox" />
					</form>
					<ul class="message-list" id="ul_messages">

						<li class="new"><input type="checkbox" />
							<div class="preview" onclick="getInbox()">
								<h3>
									Sarach Connor <small>Jul 15</small>
								</h3>
								<p>
									<strong>I've been hunted - </strong>A crazing robot ...
								</p>
							</div></li>

						<li class="active"><input type="checkbox" />
							<div class="preview">
								<h3>
									Jeremy Clarkson <small>Jul 15</small>
								</h3>
								<p>The brand new season of Top Gear</p>
							</div></li>
						<li class=""><input type="checkbox" />
							<div class="preview">
								<h3>
									Eureka.com <small>Jul 14</small>
								</h3>
								<p>
									<strong>Interface design - </strong>Hi Greg ...
								</p>
							</div></li>
					</ul>
				</div>
				<section class="message">
					<h2 id="mail_view_title">
						
					</h2>
					<div class="meta-data" id="mail_view_from">
						
					</div>
					<div class="body" id="mail_view_body">
						
					</div>
					<div class="action">
						<ul class="options">
							<li><a href="#" class="active">Answering</a></li>
							<li><a href="#">Forward</a></li>
							<div class="clr"></div>
						</ul>
						<div class="textarea">
							<textarea name="r">Hello Jeremy,
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit qui impedit magni fuga velit nobis quas fugit odio voluptas voluptates odit animi quos nam dolorem harum molestiae culpa sint rem ad esse laboriosam vero quod molestias porro ea dolores eligendi!
            </textarea>

						</div>
					</div>
				</section>
			</div>
		</div>
	</div>

	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script type="text/javascript">
		var mailList = null;
		var currentMail = null;

		function logout() {
			window.location.href = "/";
		}

		function getMail(MailSource) {
			if (MailSource == 'inbox') {
				document.getElementById("inbox").className = "active";
				document.getElementById("sent").classList.remove("active");
			} else {
				document.getElementById("sent").className = "active";
				document.getElementById("inbox").classList.remove("active");
			}
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
										.createTextNode(item.message));
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
		}

		function printMail(Element)
		{
			alert(Element.id);
			if(currentMail != null)
			{
				document.getElementById(currentMail).classList.remove("active");
			}
			document.getElementById(Element.id).className = "active";
			currentMail = Element.id;

			
			if(mailList == null){
				return;
			}
			$(mailList).each(
							function(index, item) {
								if("mail_" + item.id == Element.id){
									var title = document.getElementById("mail_view_title");
									title.innerHTML = "";
									var span1 = document.createElement("span");
									span1.setAttribute("class", "icon-star-large");
									title.appendChild(span1);
									title.appendChild(document.createTextNode(item.subject));
									var span2 = document.createElement("span");
									span2.setAttribute("class", "icon icon-reply-large");
									title.appendChild(span2);
									var span3 = document.createElement("span");
									span3.setAttribute("class", "icon icon-delete-large");
									title.appendChild(span3);

									var from = document.getElementById("mail_view_from");
									from.innerHTML = "";
									var prgf = document.createElement("p");
									prgf.appendChild(document.createTextNode("From: " + item.id_user_from))
									var span4 = document.createElement("span");
									span4.setAttribute("class", "date");
									span4.appendChild(document.createTextNode(item.date));
									prgf.appendChild(span4);
									from.appendChild(prgf);

									var body = document.getElementById("mail_view_body");
									body.innerHTML = "";
									body.appendChild(document
											.createTextNode(item.message));
								}
							});
		}
	</script>

</body>
</html>