$(document).ready(function () {

    //store filters in array
    filters_array = [];
    //get full url
    url = new URL(location.href);
    //get search parameters
    // search_params = url.searchParams;

    //if filter in url exists
    if (url.searchParams.has('filter')) {
        //get filters from url as string
        filters_url = url.searchParams.get('filter');
        //split filters from string to filters array
        filters_array = filters_url.split(',');
    }

    $('input.filter-checkbox').change(function () {
        //get filter id when input status changes
        filter = $(this).data('filter-id');
        filter = filter.toString();

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

        if (filters_array.length > 0) {
            url.searchParams.set('filter', filters_array.toString());
        } else {
            url.searchParams.delete('filter');
        }
        url.href = decodeURIComponent(url.href)

        url_for_ajax = new URL(url.href);
        ajax_method_part = '/ajax_filtered';
        if (url_for_ajax.search.indexOf(ajax_method_part) < 0) {
            url_search_start_part = url.search.substr(0, url.search.indexOf('&'));
            url_search_end_part = url.search.substr(url.search.indexOf('&'));
            url_for_ajax.search = url_search_start_part + ajax_method_part + url_search_end_part;
        }
        console.log('url: '+url);
        console.log('ajax_url: '+url_for_ajax);

        // console.log(url.search);

        window.history.pushState({}, '', url.href);

        $.ajax({
            type: 'post',
            url: url_for_ajax,
            data: {
                request: 'ajax_filtered',
            },
            success:function (data){
                data = JSON.parse(data);
                console.log(data);
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