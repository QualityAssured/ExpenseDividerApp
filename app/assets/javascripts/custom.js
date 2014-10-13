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
                addLine(value, 1);

                $('select').change(function() {
                   id = $(this).find(":selected").val();
                   value = $(this).prev().prev().val();
                   $(this).prev('input').attr('name', buildNameFromValueAndId(value, id));
                });
            }
        })
});

function addLine(value, default_user_id) {
    line = $('#hidden_input_line').children().clone();
    button = line[0];
    number_field = line[1];
    button.value = value;
    number_field.name = buildNameFromValueAndId(value, default_user_id);
    line.appendTo('#selected_tags_container');
}

function buildNameFromValueAndId(value, id) {
    return "tags_with_amount_per_user[][" + id + "][" + value + "]";
}