$(document).ready(function () {
    origin = window.location.href;
    console.log(origin);
    var timeout;
    $('#search input').on('keyup', function () {
        if (timeout) {
            clearTimeout(timeout);
        }
        timeout = setTimeout(function () {
            search_term = $('#search input').val();
            if (search_term.length) {
                $.ajax({
                    type: 'get',
                    url: 'http://localhost/opfa/index.php?route=product/search/live_search&search_term=' + search_term,
                    beforeSend: function (){

                    },
                    fail: function (){

                    },
                    success:function (data){
                        data = JSON.parse(data);
                        console.log('data.search_term: '+data.search_term);
                    }
                });
            }
        }, 500);
    });
});