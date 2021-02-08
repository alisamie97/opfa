$(document).ready(function () {
    var timeout;
    $('#search input').on('keyup', function () {
        if (timeout) {
            clearTimeout(timeout);
        }
        timeout = setTimeout(function () {
            search_term = $('#search input').val();
            console.log(search_term);
        }, 500);
    });
});