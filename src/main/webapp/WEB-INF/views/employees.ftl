<html>
	<head>
		<#include "header.ftl">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#save_button").on("click", function(){
					var url = "addEmployee?id=" + "<#if currentEmployee??>${currentEmployee.id}</#if>" +
						"&name=" + $("#nameInput").val() +
						"&surname=" + $("#surnameInput").val() + 
						"&dateOfEmployment=" + $("#dateOfEmploymentInput").val() +
						"&contractType=" + $("#contractTypeInput").val() + 
						"&salaryHour=" + $("#salaryHourInput").val();
						alert(url);
					$.get(url, function(){
						location.reload();
				    });
				});
				
				$(".delete_button").on("click", function(event){
					alert(event.target.id);
					$.get("removeEmployee?id=" + event.target.id, function(){
						location.reload();
				    });
				});
				
				$(".edit_button").on("click", function(event){
					window.open("editEmployee?id=" + event.target.id);
				});
			});
		</script>
	</head>
	<#include "menu.ftl">
	<body>
		<div>
			<form>
				<label></label>
				<input id="idInput" type="hidden" />
				<input id="nameInput" type="text" label="Name: " />
				<input id="surnameInput" type="text" label="Surname: " />
				<input id="dateOfEmploymentInput" type="date" label="Date of employment: " />
				<input id="contractTypeInput" type="text" label="Contract type: " />
				<input id="salaryHourInput" type="number" label="salary/h: " />
				<input id="save_button" type="submit" label="save"/>
				<button id="clear_button">clear</button>
			</form>
		</div>
		
		<div>
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
	</body>
</html>
