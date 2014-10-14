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
                $(this).clone().appendTo('#selected_tags_container','#bill_input');
                $('#selected_tags_container','#bill_input').append('<input class=' + $(this).val() + ' name=tagswithamount[' + $(this).val() + '] type="number" /><i class="fa fa-times ' + $(this).val() + '"></i></br>');
            }
        })
});