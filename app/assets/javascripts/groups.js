$(document).ready(function() {

//    set href of edit link
    var id = $('#groups_select option:selected', "#group_input").attr("value");
    $('.edit_group_button').attr('href', 'groups/'+id+'/edit');
    $("#groups_select", "#group_input").change(function() {
        var id = $('#groups_select option:selected', "#group_input").attr("value");
        $('.edit_group_button').attr('href', 'groups/'+id+'/edit');
        $('.edit_group_button').attr('id', id);
    });

// set hidden field for removing members
    var selected_Members;

    $('.select_members','#member_input').click(function() {
        selected_Members='';
        $(this).toggleClass('selected');
        $('.selected','#member_input').each (function( index, element ){
            selected_Members = selected_Members +( $( element).attr('id')+ ',');
        });
        $('#members_ids','#member_input').attr('value', selected_Members);

    });

    $('#add_categories','#member_input').click(function() {
        $('#category_input').toggleClass('open');
        $('#member_input').toggleClass('open');
    });

    $('#done','#category_input').click(function() {
        $('#category_input').toggleClass('open');
        $('#member_input').toggleClass('open');
    });

    $('.select_categories','#category_input').click(function() {
        selected_Categories='';
        $(this).toggleClass('selected');
        $('.selected','#category_input').each (function( index, element ){
            selected_Categories = selected_Categories +( $( element).attr('expensecategory_id')+ ',');
        });
        $('#categories_ids','#category_input').attr('value', selected_Categories);
    });
});