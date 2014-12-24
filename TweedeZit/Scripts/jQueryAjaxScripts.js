﻿$(function() {
    $("#GetMessage").click(function() {
        $.get("/JQuery/GetMessage", null, function(data) {
            $("#result").html(data);
        });
    });

    $("#GetJson").click(function() {
        $.getJSON("/JQuery/GetJson", null, function(data) {
            $("#result").html("");
            $.each(data, function(key, val) {
                $("#result").append(val.FullName + "<br/>");
            });
        });
    });

    $("#AjaxJson").click(function() {
        $.ajax({ url: "/JQuery/GetJson" })
            .done(function(data) {
                $("#result").html("");
                $.each(data, function(key, val) {
                    $("#result").append(val.FullName + "<br/>");
                });
            })
            .fail(function() { alert("error"); })
            .always(function() { alert("complete"); });
    });
});

function handleSuccess(data) {
    $("#result").html("");
    $.each(data, function(key, val) {
        $("#result").append(val.FullName + "<br/>");
    });
};