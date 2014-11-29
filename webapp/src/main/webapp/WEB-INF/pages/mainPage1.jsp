<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" href="/resources/css/style1.css">
</head>
<body onload="getMails('inbox');">
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
								onclick="getMails('inbox');">Inbox <span
									class="btn btn-primary">25</span></a></li>
							<li><a href="#">Drafts</a></li>
							<li id="sent"><a href="#" onclick="getMails('outbox');">Sent</a></li>
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
					<h2>
						<span class="icon icon-star-large"></span> The brand new season of
						Top Gear <span class="icon icon-reply-large"></span><span
							class="icon icon-delete-large"></span>
					</h2>
					<div class="meta-data">
						<p>
							<img src="http://placehold.it/40x40" class="avatar" alt="" />
							Jeremy Clarkson to <span class="user">me</span> <span
								class="date">July 15, 2013</span>
						</p>
					</div>
					<div class="body">
						<p>Hi Greg,</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Magnam modi possimus dignissimos maxime ipsa unde voluptatum
							consectetur harum debitis dolorum quas quibusdam vero iusto
							ducimus blanditiis. Enim autem illo praesentium est quis ab
							voluptate sequi quia magnam deleniti vero dicta iste. Harum velit
							asperiores expedita inventore error nulla eius nostrum voluptas
							aspernatur at quia eaque ipsa deserunt quas doloribus totam
							incidunt mollitia iure! Libero laudantium nobis necessitatibus
							veniam autem molestias distinctio voluptas quos aliquam vitae.
							Consequuntur adipisci natus hic sed rerum dolore cumque numquam
							illum rem at quaerat reprehenderit iste quis maiores fuga
							voluptates delectus suscipit dicta nulla itaque placeat.</p>
						<p>Cheers</p>
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
		function logout() {
			window.location.href = "/";
		}

		function getMails(MailSource) {
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
					$(data).each(
							function(index, item) {
								var li = document.createElement("li");
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
	</script>

</body>
</html>