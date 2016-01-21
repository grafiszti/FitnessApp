<html>
<head>
<#include "partials/header.ftl">
    <script type="text/javascript">
        $(document).ready(function () {

            $.ajax({
                       type: "GET",
                       url: "eqTypes",
                       dataType: "json",
                       success: function (data) {
                           $("#typeInput").autocomplete({
                                                            source: data
                                                        })
                       }
                   });

            $("#save_button").on("click", function () {
                $.ajax({
                           type: "POST",
                           url: "equipment",
                           data: {
                               "id": $("#idInput").val(),
                               "name": $("#nameInput").val(),
                               "typeName": $("#typeInput").val(),
                               "serialNumber": $("#serialInput").val(),
                               "purchaseDateString": $("#purchaseDateInput").val(),
                               "lastServiceDateString": $("#lastServiceDateInput").val()
                           },
                           success: function (data) {
                               document.location.reload(true);
                           }
                       });
            });

            $(".delete_button").on("click", function (event) {
                $.ajax({
                           type: "DELETE",
                           url: "equipment?id=" + event.target.id,
                           success: function () {
                               document.location.reload(true);
                           }
                       });
            });
            $(".edit_button").on("click", function (event) {
                $.ajax({
                           type: "GET",
                           url: "equipment/" + event.target.id,
                           success: function (data) {
                               $("#idInput").val(data.id);
                               $("#nameInput").val(data.name);
                               $("#serialInput").val(data.serialNumber);
                               $("#typeInput").val(data.equipmentType.name);
                               if (data.purchaseDate != null) {
                                   $("#purchaseDateInput")
                                           .val(getFormattedDate(new Date(data.purchaseDate)))
                               } else {
                                   $("#purchaseDateInput").val("");
                               }
                               if (data.lastServiceDate != null) {
                                   $("#lastServiceDateInput")
                                           .val(getFormattedDate(new Date(data.lastServiceDate)))
                               } else {
                                   $("#lastServiceDateInput").val("");
                               }

                           },
                           dataType: "json"
                       });
            });
            function getFormattedDate(date) {
                return date.getFullYear()
                       + "-"
                       + ("0" + (date.getMonth() + 1)).slice(-2)
                       + "-"
                       + ("0" + date.getDate()).slice(-2);
            }
        });
    </script>
</head>
<body>
<#include "partials/menu.ftl">
<div class="container">
    <h4>Add/edit equipment</h4>
    <div>
        <form class="form-inline">
            <input id="idInput" type="hidden"/>
            <input id="nameInput" type="text" placeholder="Name"/>
            <input id="serialInput" type="text" placeholder="Serial"/>
            <input id="typeInput" placeholder="Type"/>
            <input id="purchaseDateInput" type="date"/>
            <input id="lastServiceDateInput" type="date"/>
            <button id="save_button" class="btn btn-default">save</button>
        </form>
    </div>

    <div>
        <h4>Equipment</h4>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Serial</th>
                <th>Type</th>
                <th>Purchase date</th>
                <th>Last service date</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <#list equipments as eq>
            <tr>
                <td>${eq.id}</td>
                <td><#if eq.name??>${eq.name}</#if></td>
                <td><#if eq.serialNumber??>${eq.serialNumber}</#if></td>
                <td><#if eq.equipmentType??>${eq.equipmentType.name}</#if></td>
                <td><#if eq.purchaseDate??>${eq.purchaseDate?date}</#if></td>
                <td><#if eq.lastServiceDate??>${eq.lastServiceDate?date}</#if></td>
                <td>
                    <button class="edit_button" id=${eq.id}>edit</button>
                </td>
                <td>
                    <button class="delete_button" id=${eq.id}>delete</button>
                </td>
            </tr>
            </#list>
            </tbody>
            <table>
    </div>
</div>
</body>
</html>
