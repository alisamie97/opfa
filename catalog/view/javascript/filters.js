$(document).ready(function (){

});

function filter_ajax(){
    $.ajax({
        type:'get',
        url: '?route=product/category/live_search&search_term=' + search_term,
    })
}