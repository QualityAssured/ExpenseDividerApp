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
                $(this).clone().appendTo('#selected_tags_container');
                $('#selected_tags_container').append('<input class=' + $(this).val() + ' name=tagswithamount[' + $(this).val() + '] type="number" /><i class="fa fa-times ' + $(this).val() + '"></i></br>');
            }
        })
});