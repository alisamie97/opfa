$(document).ready(function () {
    //if re_sorting exists hide it
    if($('#re_container_products #re_not_found').length){
        $('#re_container_products #re_sorting').hide();
    }

    //store filters in array
    filters_array = [];
    //store url
    url = new URL(decodeURIComponent(location.href));

    //make a copy of url for ajax usage
    url_for_ajax = new URL(url.href);

    //used in limit and sort
    temp_url = new URL(url.href);

    //get page
    if(url.searchParams.has('page')){
        page = url.searchParams.get('page');
    }else{
        page = 1;
    }

    //if filter in url exists
    if (url.searchParams.has('filter')) {
        //get filters from url as string
        //split filters from string and store in filters array
        filters_array = url.searchParams.get('filter').split(',');
    }

    //filter check box trigger
    $('input.filter-checkbox').change(function () {
        //get filter id from input
        filter = $(this).data('filter-id').toString();

        //if filter array has this filter
        if (filters_array.includes(filter)) {
            //delete this filter
            filters_array.splice($.inArray(filter, filters_array), 1);
        } else {
            //if filter array dont have this filter
            //add this filter
            filters_array.push(filter);
        }
        //now we have our filter ready for ajax and url

        //if filter array has filters in itself
        if (filters_array.length > 0) {
            //add filters to url
            url.searchParams.set('filter', filters_array.toString());
        } else {
            //if filter array is now empty so delete filter from url
            url.searchParams.delete('filter');
        }

        //if adding new filters on any page, then get products with new filters from page one
        if(page!=1){
            //so change page in url
            url.searchParams.set('page','1');
        }

        url.href = decodeURIComponent(url.href);

        //update url for ajax
        //add method to url, input of this function is a URL instance
        url_for_ajax.href = add_method_to_url(url,'ajax_filtered');

        // console.log(url.search);
        window.history.pushState({}, '', url.href);

        re_get_products_ajax(url_for_ajax.href);
    });

    $('select#input-sort').change(function () {
        sort_url = $(this).val();
        temp_url.href = sort_url;

        //set page to 1 on any change of sortings
        url.searchParams.set('page',1);
        //set sort to the value of selection
        url.searchParams.set('sort',temp_url.searchParams.get('sort'));
        url.searchParams.set('order',temp_url.searchParams.get('order'));

        url.href = decodeURIComponent(url.href);
        url_for_ajax.href = url.href;

        window.history.pushState({}, '', url.href);

        re_get_products_ajax(url_for_ajax.href);
    });

    $('select#input-limit').change(function () {
        limit_url = $(this).val();
        temp_url.href = limit_url;

        //set page to 1 on any change of limitings
        url.searchParams.set('page',1);
        //set limit to the value of selection
        url.searchParams.set('limit',temp_url.searchParams.get('limit'));

        url.href = decodeURIComponent(url.href);
        url_for_ajax.href = url.href;

        window.history.pushState({}, '', url.href);

        re_get_products_ajax(url_for_ajax.href);
    });
});

function add_method_to_url(url,method){
    //if url search part dont have this method:
    if (url.search.indexOf(method) < 0) {
        temp_url = new URL(url.href);
        start_part = url.search.substr(0, url.search.indexOf('&'));
        end_part = url.search.substr(url.search.indexOf('&'));
        temp_url.search = start_part + '/' + method + end_part;
        temp_url.href =  decodeURIComponent(temp_url.href);
        return temp_url;
    }else{
        return url;
    }
}

function re_get_products_ajax(url_ajax){
    $.ajax({
        type: 'post',
        url: url_ajax,
        data: {
            request: 'ajax_filtered',
        },
        beforeSend: function (){
            if( $('#grid-view').hasClass('active')){
                grid_view_is_active = true;
            }else{
                grid_view_is_active = false;
            }
            //remove not found box
            // $('#re_container_products #re_sorting').hide();
            // $('#re_container_products #re_category').hide();
            // $('#re_container_products #re_pagination').hide();
            $('#re_container_products #re_not_found').hide();
        },
        success:function (data){
            // if no products found
            if($('#re_not_found',data).length > 0){
                $('#re_container_products #re_sorting').hide();
                $('#re_container_products #re_category').hide();
                $('#re_container_products #re_pagination').hide();
                $('#re_container_products').append($('#re_not_found',data));
            } else {
                // $('#re_container_products #re_not_found').hide();

                // if($('#re_container_products #re_sorting').length){
                    $('#re_container_products #re_sorting').show();
                // }else{
                //     $('#re_container_products').append($('#re_sorting',data));
                // }

                if($('#re_container_products #re_category').length){
                    $('#re_container_products #re_category').html($('#re_category',data).html());
                    $('#re_container_products #re_category').show();
                }else{
                    $('#re_container_products').append($('#re_category',data));
                }

                if($('#re_container_products #re_pagination').length){
                    $('#re_container_products #re_pagination').html($('#re_pagination',data).html());
                    $('#re_container_products #re_pagination').show();
                }else{
                    $('#re_container_products').append($('#re_pagination',data));
                }
            }
            if(grid_view_is_active){
                $('#grid-view').click();
            }
        }
    });
}