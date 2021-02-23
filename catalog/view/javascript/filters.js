$(document).ready(function () {

    //store filters in array
    filters_array = [];
    //store url
    url = new URL(decodeURIComponent(location.href));

    //get page
    if(url.searchParams.has('page')){
        page = url.searchParams.get('page');
    }else{
        page = 1;
    }

    url.href = decodeURIComponent(url.href);
    window.history.pushState({}, '', url.href);

    //if filter in url exists
    if (url.searchParams.has('filter')) {
        //get filters from url as string
        filters_url = url.searchParams.get('filter');
        //split filters from string and store in filters array
        filters_array = filters_url.split(',');
    }


    $('input.filter-checkbox').change(function () {
        //get filter id when input status changes
        filter = $(this).data('filter-id').toString();
        // filter_group = $(this).data('filter-group-id').toString();
        //
        // filter = filter_group + '_' + filter;



        // console.log('changed filter: ' + filter);

        if (filters_array.includes(filter)) {
            //delete this filter
            filters_array.splice($.inArray(filter, filters_array), 1);
            // console.log('  filter: ' + filter + ' removed');
        } else {
            //add this filter
            filters_array.push(filter);
            // console.log('  filter: ' + filter + ' added');
        }

        //now we have our filter ready for ajax and url
        // console.log(filters_array);

        //make a copy of url to add ajax method
        url_for_ajax = new URL(url.href);

        // console.log(url_for_ajax.href);

        //if filter array has filters
        if (filters_array.length > 0) {
            url.searchParams.set('filter', filters_array.toString());
        } else {
            url.searchParams.delete('filter');
        }

        //if asking for new filters on any page, then get products with new filters from page one
        if(page!=1){
            url_for_ajax.searchParams.set('page','1');
            url.searchParams.set('page','1');
        }

        url.href = decodeURIComponent(url.href);
        url_for_ajax.href = decodeURIComponent(url_for_ajax.href);



        ajax_method_part = '/ajax_filtered';
        if (url_for_ajax.search.indexOf(ajax_method_part) < 0) {
            url_search_start_part = url.search.substr(0, url.search.indexOf('&'));
            url_search_end_part = url.search.substr(url.search.indexOf('&'));
            url_for_ajax.search = url_search_start_part + ajax_method_part + url_search_end_part;
        }

        // console.log('url: '+url.href);
        // console.log('ajax_url: '+url_for_ajax.href);

        // console.log(url.search);
        window.history.pushState({}, '', url.href);

        $.ajax({
            type: 'post',
            url: url_for_ajax,
            data: {
                request: 'ajax_filtered',
            },
            beforeSend: function (){
                if( $('#grid-view').hasClass('active')){
                    set_grid_view = true;
                }else{
                    set_grid_view = false;
                }
            },
            success:function (data){

                // $('#re_ajax_filter_products').append($('#re_soring',data));

                $('#re_ajax_filter_products #re_category').html($('#re_category',data).html());

                $('#re_ajax_filter_products #re_pagination').html($('#re_pagination',data).html());

                if(set_grid_view){
                    $('#grid-view').click();
                }
            }
        });

    });
});

function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}