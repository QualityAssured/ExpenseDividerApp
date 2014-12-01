$(document).ready(function() {
        var selectedTags = [];

        setHiddenFieldToGroupSelectValue();

        $('#groups_select').change(function() {
            setHiddenFieldToGroupSelectValue();
        });

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
            var value = $(this).val();
            var index = $.inArray(value, selectedTags);

            $(this).toggleClass('selected btn-primary','#bill_input');
            if( index > -1) {
                selectedTags.splice(index, 1);
                var tag_name = $(this).val();
                removeLine(tag_name);
                if( selectedTags.length == 0 ) {
                    $('#selected_tags_container','#bill_input').hide();
                }
            }
            else {
                selectedTags.push(value);
                $('#selected_tags_container','#bill_input').show();
                var default_user_id = $(this).attr('default_user_id');
                addLine(value, default_user_id);

                $('select#_user').change(function() {
                   var id = $(this).find(":selected").val();
                   var value = $(this).prev().prev().val();
                   $(this).prev('input').attr('name', buildNameFromValueAndId(value, id));
                });
            }
        })
});

function addLine(tag_value, default_user_id) {
    var line = $('#hidden_input_line').children().clone();
    var number_field = line[0];
    var select_box = line[1];
    var label = line[2];

    select_box.value = default_user_id;

    $(label).text(tag_value);
    $(label).attr('for', tag_value);
    number_field.name = buildNameFromValueAndId(tag_value, default_user_id);
    number_field.id = tag_value;
    line.appendTo('#selected_tags_container','#bill_input');
}

function removeLine(tag_name) {
    var line = [];
    line[0] = $("#selected_tags_container label[for='"+ tag_name + "']");
    line[1] = line[0].prev();
    line[2] = line[1].prev();
    line[3] = line[2].prev();
    for (var i = 3; i > -1; i--) {
        line[i].remove();
    }
}

function buildNameFromValueAndId(tag_value, id) {
    return "tags_with_amount_per_user[][" + id + "][" + tag_value + "]";
}

function setHiddenFieldToGroupSelectValue() {
    var id = $('#groups_select').find(":selected").val();
    $('#group_id').val(id);
}