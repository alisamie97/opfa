$(document).ready(function () {

    //store filters in array
    filters_array = [];
    //store url
    url = new URL(decodeURIComponent(location.href));

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

        console.log('changed filter: ' + filter);

        if (filters_array.includes(filter)) {
            //delete this filter
            filters_array.splice($.inArray(filter, filters_array), 1);
            console.log('  filter: ' + filter + ' removed');
        } else {
            //add this filter
            filters_array.push(filter);
            console.log('  filter: ' + filter + ' added');
        }

        //now we have our filter ready for ajax and url
        console.log(filters_array);

        //make a copy of url to add ajax method
        url_for_ajax = new URL(url.href);

        //if filter array has filters
        if (filters_array.length > 0) {
            url.searchParams.set('filter', filters_array.toString());
        } else {
            url.searchParams.delete('filter');
        }

        url.href = decodeURIComponent(url.href);

        ajax_method_part = '/ajax_filtered';
        if (url_for_ajax.search.indexOf(ajax_method_part) < 0) {
            url_search_start_part = url.search.substr(0, url.search.indexOf('&'));
            url_search_end_part = url.search.substr(url.search.indexOf('&'));
            url_for_ajax.search = url_search_start_part + ajax_method_part + url_search_end_part;
        }

        console.log('url: '+url.href);
        console.log('ajax_url: '+url_for_ajax.href);

        // console.log(url.search);
        window.history.pushState({}, '', url.href);

        $.ajax({
            type: 'post',
            url: url_for_ajax,
            data: {
                request: 'ajax_filtered',
            },
            success:function (data){
                $('#re_ajax_filter_products #re_category').remove();
                $('#re_ajax_filter_products #re_soring').after($('#re_category',data));

                $('#re_ajax_filter_products #re_pagination').remove();
                $('#re_ajax_filter_products').append($('#re_pagination',data));
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