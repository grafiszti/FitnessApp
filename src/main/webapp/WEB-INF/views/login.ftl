<html>
	<head>
		<#include "partials/header.ftl">
		<link href="resources/css/signin.css" rel="stylesheet" media="screen">
		<script>
			
		</script>
	</head>
	<body>
		<#include "partials/menu.ftl">
		<div class="container">
			<form class="form-signin" action="/login" method="POST">
				<h2 class="form-signin-heading">Please sign in</h2>
				<label for="username" class="sr-only">Login</label>
				<input type="text" name="username" class="form-control" placeholder="Login">
				<label for="password" class="sr-only">Password</label>
				<input type="password" name="password" class="form-control" placeholder="Password">
				<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
			</form>
		</div>
	</body>
</html>