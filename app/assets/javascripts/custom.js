$(document).ready(function() {
        var selectedTags = [];

        $('#selected_tags_container').hide();

        $('#add_tags').click(function() {
            $('#tags_container').toggleClass('open');
            $('#bill_input').toggleClass('open');
        })

        $('.done').click(function() {
            $('#tags_container').toggleClass('open');
            $('#bill_input').toggleClass('open');
        })

        $('.tag').click(function() {
            value = $(this).val();
            index = $.inArray(value, selectedTags)
            previousLength = selectedTags.length;
            $(this).toggleClass('selected btn-primary');
            if( index > -1) {
                selectedTags.splice(index, 1);
            }
            else {
                selectedTags.push(value);
            }

            if(selectedTags.length >= 0) {
                $('#selected_tags_container').show();
                if(selectedTags.length > previousLength){
                    $(this).clone().appendTo('#selected_tags_container');
                }
                if(selectedTags.length < previousLength) {
                    $("#selected_tags_container input[value=" + $(this).val() + "]").remove();
                }
            }
            else {
                $('#selected_tags_container').hide();
            }
        })
});