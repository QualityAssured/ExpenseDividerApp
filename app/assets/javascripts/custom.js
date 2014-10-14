$(document).ready(function() {
        var selectedTags = [];

        $('#selected_tags_container','#bill_input').hide();

        $('#add_tags','#bill_input').click(function() {
            $('#tags_container').toggleClass('open');
            $('#bill_input').toggleClass('open');
        });

        $('.done','#tags_container').click(function() {
            $('#tags_container').toggleClass('open');
            $('#bill_input').toggleClass('open');
        });

        $('.tag','#tags_container').click(function() {
            value = $(this).val();
            index = $.inArray(value, selectedTags);

            $(this).toggleClass('selected btn-primary','#bill_input');
            if( index > -1) {
                selectedTags.splice(index, 1);
                $("#selected_tags_container input[value=" + $(this).val() + "]",'#bill_input').remove();
                $("." + $(this).val()).next("br").remove();
                $("." + $(this).val()).remove();
            }
            else {
                selectedTags.push(value);
                $('#selected_tags_container','#bill_input').show();
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
    line.appendTo('#selected_tags_container','#bill_input');
}

function buildNameFromValueAndId(value, id) {
    return "tags_with_amount_per_user[][" + id + "][" + value + "]";
}