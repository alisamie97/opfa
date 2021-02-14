$(document).ready(function () {
    //store ilters in array
    filters_array = [];
    //get full url
    url = new URL(location.href);
    //get search parameters
    search_params = new URLSearchParams(location.search);

    //if filter in url exists
    if(search_params.has('filter')){
        //get filters from url as string
        filters_url = search_params.get('filter');
        //split filters from string to filters array
        filters_array = filters_url.split(',');
    }

    $('input.filter-checkbox').change(function () {
        //get filter id when input status changes
        filter = $(this).data('filter-id');
        //make it string
        // filter = toString(filter);
        console.log(typeof filter);

        console.log('changed filter: '+filter);

        if(filters_array.includes(filter)){
            //delete this filter
            filters_array.splice( $.inArray(filter,filters_array) ,1 );
            console.log('  filter: '+filter + ' removed');
        }else{
            //add this filter
            filters_array.push(filter);
            console.log('  filter: '+filter + ' added');
        }

        //now we have our filter ready for ajax and url
        console.log(filters_array)
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