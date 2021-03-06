<html>
	<head>
		<#include "partials/header.ftl">
		<script type="text/javascript">
            $(document).ready(function() {
				$("#save_button").on("click", function(){
				    $.ajax({     
					    type: "GET",
					    url: "addRole",
					    data: "id=" + $("#idInput").val() + 
					    	  "&name=" + $("#nameInput").val(),
					    success: function (data) {
					    	document.location.reload(true);
					    },
					});
				});
				
				$(".delete_button").on("click", function(event){
					$.get("removeRole?id=" + event.target.id, function(){
						document.location.reload(true);
				    });
				});
			});
		</script>
	</head>
	<body>
		<#include "partials/menu.ftl">
        <div class="container">
            <h4>Add role</h4>
            <div>
                <form class="form-inline">
                    <input id="idInput" type="hidden"/>
                    <input id="nameInput" type="text" placeholder="Name" />
                    <button id="save_button" class="btn btn-default">save</button>
                </form>
            </div>

            <div>
                <h4>User roles</h4>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                    <#list roleTypes as roleType>
                    	<tr>
                            <td>${roleType.id}</td>
                            <td>${roleType.name}</td>
                            <td><button class="delete_button" id=${roleType.id}>delete</button></td>
                        </tr>
                    </#list>
                    </tbody>
                <table>
            </div>
        </div>
	</body>
</html>
