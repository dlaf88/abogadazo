$(function() {
    $("#phone").mask("(999) 999-9999");
   
});

$(document).ready(function() {
    var text_max = 750;
    $('#textarea_feedback').html(text_max + ' caracteres restantes');

    $('#description').keyup(function() {
        var text_length = $('#description').val().length;
        var text_remaining = text_max - text_length;

        $('#textarea_feedback').html(text_remaining + ' caracteres restantes');
    });
});
$(document).ready(function() {
    var text_max_2= 150;
    $('#textarea_feedback_titulo').html(text_max_2 + ' caracteres restantes');

    $('#titulo').keyup(function() {
        var text_length_2= $('#titulo').val().length;
        var text_remaining_2 = text_max_2 - text_length_2;

        $('#textarea_feedback_titulo').html(text_remaining_2 + ' caracteres restantes');
    });
});