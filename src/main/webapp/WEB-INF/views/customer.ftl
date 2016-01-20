<html>
<head>
<#include "partials/header.ftl">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#save_button").on("click", function () {
                $.ajax({
                           type: "POST",
                           url: "customers",
                           data: {
                               "id": $("#idInput").val(),
                               "name": $("#nameInput").val(),
                               "surname": $("#surnameInput").val(),
                               "address": $("#addressInput").val(),
                               "membershipType": $("#membershipTypeInput").val(),
                               "membershipDate": $("#membershipDateInput").val()
                           },

                           success: function () {
                               document.location.reload(true);
                           }
                       })

            });

            $(".delete_button").on("click", function (event) {
                $.ajax({
                           type: "DELETE",
                           url: "customers?id=" + event.target.id
                       });
            });

            $(".edit_button").on("click", function (event) {
                $.ajax({
                           type: "GET",
                           url: "customers/" + event.target.id,
                           success: function (data) {
                               $("#idInput").val(data.id);
                               $("#nameInput").val(data.name);
                               $("#surnameInput").val(data.surname);
                               $("#addressInput").val(data.address);
                               if (data.membership != null) {
                                   $("#membershipTypeInput")
                                           .val(data.membership.membershipType.id).change();
                                   $("#membershipDateInput")
                                           .val(getFormattedDate(new Date(data.membership.startDate)));
                               } else {
                                   $("#membershipTypeInput").val();
                                   $("#membershipDateInput").val();
                               }
                           },
                           dataType: "json"
                       });
            });

            $(".clear_button").on("click", function (event) {

            });

        });
        function getFormattedDate(date) {
            return date.getFullYear()
                   + "-"
                   + ("0" + (date.getMonth() + 1)).slice(-2)
                   + "-"
                   + ("0" + date.getDate()).slice(-2);
        }
    </script>
</head>
<body>
<#include "partials/menu.ftl">
<div class="container">
    <h4>Add/edit customer</h4>
    <div>
        <form class="form-inline">
            <input id="idInput" type="hidden"/>
            <input id="nameInput" type="text" placeholder="Name"/>
            <input id="surnameInput" type="text" placeholder="Surname"/>
            <input id="addressInput" type="text" placeholder="Address"/>
            <select id="membershipTypeInput">
                <option value="-1"></option>
            <#list membershipTypes as membershipType>
                <option value="${membershipType.id}">${membershipType.name}</option>
            </#list>
            </select>
            <input id="membershipDateInput" type="date" placeholder="Date of employment"/>

            <button id="save_button" class="btn btn-default">save</button>
            <button id="clear_button" class="btn btn-alert">clear</button>
        </form>
    </div>

    <div>
        <h4>Customers</h4>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Surname</th>
                <th>Address</th>
                <th>Membership type</th>
                <th>Start date</th>
                <th>End date</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <#if customers??>
                <#list customers as customer>
                <tr>
                    <td><#if customer.id??>${customer.id}</#if></td>
                    <td><#if customer.name??>${customer.name}</#if></td>
                    <td><#if customer.surname??>${customer.surname}</#if></td>
                    <td><#if customer.address??>${customer.address}</#if></td>
                    <td><#if customer.membership??>${customer.membership.membershipType.name}</#if></td>
                    <td><#if customer.membership??>${customer.membership.startDate?date}</#if></td>
                    <td><#if customer.membership??>${customer.membership.getEndDate()?date}</#if></td>
                    <td>
                        <button class="edit_button" id=${customer.id}>edit</button>
                    </td>
                    <td>
                        <button class="delete_button" id=${customer.id}>delete</button>
                    </td>
                </tr>
                </#list>
            </#if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
