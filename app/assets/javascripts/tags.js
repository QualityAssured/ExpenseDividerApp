$(document).ready(function() {
    var selected_Tags;

    $('.select_tags').click(function() {
        selected_Tags='';
        $(this).toggleClass('selected');
        $('.selected').each (function( index, element ){
            selected_Tags = selected_Tags +( $( element).attr('tag_id')+ ',');
        });
        $('#tag_ids').attr('value', selected_Tags);
    });
});