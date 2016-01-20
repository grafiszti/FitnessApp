<html>
	<head>
		<#include "partials/header.ftl">
		<script type="text/javascript">
            $(document).ready(function() {
				$("#save_button").on("click", function(){
				    $.ajax({     
					    type: "GET",
					    url: "addMembershipType",
					    data: "id=" + $("#idInput").val() + 
					    	  "&name=" + $("#nameInput").val() + 
					    	  "&lengthInDays=" + $("#lengthInDaysInput").val() +
					    	  "&price=" + $("#priceInput").val(),
					    success: function (data) {
					    	document.location.reload(true);
					    }
					});
				});

                function setFormData(id, name, lengthDays, price) {
                    $("#idInput").val(id);
                    $("#nameInput").val(name);
                    $("#lengthInDaysInput").val(lengthDays);
                    $("#priceInput").val(price);
                }

                $(".edit_button").on("click", function(event){
                    $.ajax({
                               type: "GET",
                               url: "getMembershipType",
                               data: "id=" + event.target.id,
                               success: function (data) {
                                   setFormData(data.id, data.name, data.lengthDays, data.price);
                               },
                               dataType: "json"
                           });
                });
				
				$(".delete_button").on("click", function(event){
					$.get("removeMembershipType?id=" + event.target.id, function(){
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
                    <input id="lengthInDaysInput" type="number" placeholder="Length in days" />
                    <input id="priceInput" type="number" step="0.01" placeholder="Price" />
                    <button id="save_button" class="btn btn-default">save</button>
                </form>
            </div>

            <div>
                <h4>Membership types</h4>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Length in days</th>
                            <th>Price</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                    <#list membershipTypes as membershipType>
                    	<tr>
                            <td>${membershipType.id}</td>
                            <td>${membershipType.name}</td>
                            <td>${membershipType.lengthDays}</td>
                            <td>${membershipType.price}</td>
                            <td><button class="edit_button" id=${membershipType.id}>edit</button></td>
                            <td><button class="delete_button" id=${membershipType.id}>delete</button></td>
                        </tr>
                    </#list>
                    </tbody>
                <table>
            </div>
        </div>
	</body>
</html>
