$(document).ready(function() {
        $('#add_tags').click(function() {
            $('#tags_container').toggleClass('open');
            $('#bill_input').toggleClass('open');
        })

        $('.back').click(function() {
            $('#tags_container').toggleClass('open');
            $('#bill_input').toggleClass('open');
        })

        $('.tag').click(function() {
            $(this).toggleClass('selected btn-primary');
        })
    });