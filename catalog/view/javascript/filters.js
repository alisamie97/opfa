function filter_ajax(filter_id){

    current_url = new URL(window.location.href);
    url_filter_id = current_url.searchParams.get("filter_id");

    if(url_filter_id && url_filter_id.length){
        filter_id += ','+url_filter_id;
    }

    $.ajax({
        type:'get',
        url: '?route=product/category/filter&filter_id=' + filter_id,
    })
}