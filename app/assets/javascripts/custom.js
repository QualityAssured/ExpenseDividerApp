$(document).ready(function() {
        var selectedTags = [];

        $('#selected_tags_container').hide();

        $('#add_tags').click(function() {
            $('#tags_container').toggleClass('open');
            $('#bill_input').toggleClass('open');
        });

        $('.done').click(function() {
            $('#tags_container').toggleClass('open');
            $('#bill_input').toggleClass('open');
        });

        $('.tag').click(function() {
            value = $(this).val();
            index = $.inArray(value, selectedTags);

            $(this).toggleClass('selected btn-primary');
            if( index > -1) {
                selectedTags.splice(index, 1);
                $("#selected_tags_container input[value=" + $(this).val() + "]").remove();
                $("." + $(this).val()).next("br").remove();
                $("." + $(this).val()).remove();
            }
            else {
                selectedTags.push(value);
                $('#selected_tags_container').show();
                addLine(value);
            }
        })
});

function addLine(value) {
    line = $('#hidden_input_line').children().clone();
    button = line[0];
    button.value = value;
    line.appendTo('#selected_tags_container');
}