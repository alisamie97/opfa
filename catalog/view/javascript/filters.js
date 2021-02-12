$(document).ready(function (){

});

function filter_ajax(filter_id){
    $.ajax({
        type:'get',
        url: '?route=product/category/filter&filter_id=' + filter_id,
    })
}