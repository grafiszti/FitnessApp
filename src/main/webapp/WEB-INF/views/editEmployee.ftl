<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#save_button").on("click", function(){
					var url = "updateEmployee?id=" + $("#idInput").val() +
						"&name=" + $("#nameInput").val() +
						"&surname=" + $("#surnameInput").val() + 
						"&dateOfEmployment=" + $("#dateOfEmploymentInput").val() +
						"&contractType=" + $("#contractTypeInput").val() + 
						"&salaryHour=" + $("#salaryHourInput").val();
						alert(url);
					$.get(url, function(){
						location.reload("/editEmployee?id=1");
				    });
				});
			});
		</script>
	</head>
	<body>
		<div>
			<form>
				<input id="idInput" type="hidden" value="<#if employee.id??>${employee.id}</#if>"/>
				<input id="nameInput" type="text" label="Name: " value="<#if employee.name??>${employee.name}</#if>"/>
				<input id="surnameInput" type="text" label="Surname: " value="<#if employee.surname??>${employee.surname}</#if>"/>
				<input id="dateOfEmploymentInput" type="date" label="Date of employment: " value="<#if employee.dateOfEmployment??>${employee.dateOfEmployment?date}</#if>"/>
				<input id="contractTypeInput" type="text" label="Contract type: " value="<#if employee.contractType.name??>${employee.contractType.name}</#if>"/>
				<input id="salaryHourInput" type="number" label="salary/h: " value="<#if employee.salaryHour??>${employee.salaryHour}</#if>"/>
				<button id="save_button" >save</>
			</form>
		</div>
	</body>
</html>