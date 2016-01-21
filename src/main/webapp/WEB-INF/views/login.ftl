<html>
	<head>
		<#include "partials/header.ftl">
		<link href="resources/css/signin.css" rel="stylesheet" media="screen">
		<script>

		</script>
	</head>
	<body>

    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
            <div class="container">
                <a class="navbar-brand" href="/">FitnessApp</a>
                <div class="" id="main-menu">
                    <ul class="nav navbar-nav" id="main-menu-left">
                        <li><a href="/employees">Employees</a></li>
                        <li><a href="/customers">Customers</a></li>
					<#--<li><a href="/roles">Roles</a></li>-->
                        <li><a href="/equipment">Equipment</a></li>
                        <li><a href="/membershipTypes">Membership types</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>		<div class="container">
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
