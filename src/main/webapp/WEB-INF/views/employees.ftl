<html>
	<head>
		<#include "header.ftl">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script type="text/javascript">
            $(document).ready(function() {
				$("#save_button").on("click", function(){
				    $.ajax({     
					    type: "GET",
					    url: "addEmployee",
					    data: "id=" + $("#idInput").val() + "&name=" + $("#nameInput").val() +
								"&surname=" + $("#surnameInput").val() + "&dateOfEmployment=" + $("#dateOfEmploymentInput").val() +
								"&contractTypeId=" + $("#contractTypeSelectBox").val() + "&salaryHour=" + $("#salaryHourInput").val(),
					    success: function (data) {
					    	document.location.reload(true);
					    },
					});
				});
				
				$(".delete_button").on("click", function(event){
					$.get("removeEmployee?id=" + event.target.id, function(){
						location.reload();
				    });
				});

				$(".edit_button").on("click", function(event){
					$.ajax({     
					    type: "GET",
					    url: "getEmployee",
					    data: "id=" + event.target.id,
					    success: function (data) {
					    	setFormData(data.id, data.name, data.surname, new Date(data.dateOfEmployment), data.contractType.name, data.salaryHour);
					    },
					    dataType: "json"
					});
				});
				
				function setFormData(id, name, surname, dateOfEmployment, contractType, salaryHour){
					$("#idInput").val(id);
			    	$("#nameInput").val(name);
			    	$("#surnameInput").val(surname);
			    	$("#dateOfEmploymentInput").val(dateOfEmployment);
			    	$("#contractTypeSelectBox").attr("selected", contractType.name);
			    	$("#salaryHourInput").val(salaryHour);
				}
				
				$(".clear_button").on("click", function(event){
					setFormData("", "", "", new Date(), $('#contractTypeSelectBox option:first-child').attr("selected", "selected").name, "");
				});
				
			});
		</script>
	</head>
	<#include "menu.ftl">
	<body>
        <div class="container">
            <h4>Add employee</h4>
            <div>
                <form class="form-inline">
                    <input id="idInput" type="hidden"/>
                    <input id="nameInput" type="text" placeholder="Name" />
                    <input id="surnameInput" type="text" placeholder="Surname" />
                    <input id="dateOfEmploymentInput" type="date" placeholder="Date of employment" />
                    <select id="contractTypeSelectBox" selected="">
                    	<#list contractTypes as contractType>
                    		<option value=${contractType.id}>${contractType.name}</option>
                    	</#list>
                    </select>
                    <input id="salaryHourInput" type="number" placeholder="$/h" />
                    <button id="save_button" class="btn btn-default">save</button>
                    <button id="clear_button" class="btn btn-alert">clear</button>
                </form>
            </div>

            <div>
                <h4>Employees</h4>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Surname</th>
                            <th>Date of employment</th>
                            <th>Contract type</th>
                            <th>Salary/h</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                    <#if employees??>
                        <#list employees as employee>
                            <tr>
                                <td><#if employee.id??>${employee.id}</#if></td>
                                <td><#if employee.name??>${employee.name}</#if></td>
                                <td><#if employee.surname??>${employee.surname}</#if></td>
                                <td><#if employee.dateOfEmployment??>${employee.dateOfEmployment?date}</#if></td>
                                <td><#if employee.contractType??>${employee.contractType.name}</#if></td>
                                <td><#if employee.salaryHour??>${employee.salaryHour}</#if></td>
                                <td><button class="edit_button" id=${employee.id}>edit</button></td>
                                <td><button class="delete_button" id=${employee.id}>delete</button></td>
                            </tr>
                        </#list>
                    </#if>
                    </tbody>
                <table>
            </div>
        </div>
	</body>
</html>
