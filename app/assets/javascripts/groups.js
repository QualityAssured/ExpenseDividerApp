$(document).ready(function() {

//    set href of edit link
    var id = $('#groups_select option:selected').attr("value");
    $('.edit_group_button').attr('href', 'groups/'+id+'/edit');
    $("#groups_select").change(function() {
        var id = $('#groups_select option:selected').attr("value");
        $('.edit_group_button').attr('href', 'groups/'+id+'/edit');
        $('.edit_group_button').attr('id', id);
    });

// set hidden field for removing members
    var selected_Members;

    $('.select_members').click(function() {
        selected_Members='';
        $(this).toggleClass('selected');
        $('.selected').each (function( index, element ){
            selected_Members = selected_Members +( $( element).attr('id')+ ',');
        });
        $('#members_ids').attr('value', selected_Members);

    });
});