$(document).ready(function() {

    var id = $('#groups_select option:selected').attr("value");
    $('.edit_group_button').attr('href', 'groups/'+id+'/edit');
    $("#groups_select").change(function() {
        var id = $('#groups_select option:selected').attr("value");
        $('.edit_group_button').attr('href', 'groups/'+id+'/edit');
        $('.edit_group_button').attr('id', id);
    });
});