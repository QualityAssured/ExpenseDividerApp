$(document).ready(function() {
    var selected_Tags;

    $('.select_tags','#tags_input').click(function() {
        selected_Tags='';
        $(this).toggleClass('selected');
        $('.selected','#tags_input').each (function( index, element ){
            selected_Tags = selected_Tags +( $( element).attr('tag_id')+ ',');
        });
        $('#tag_ids','#tags_input').attr('value', selected_Tags);
    });
});