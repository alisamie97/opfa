$(document).ready(function () {

    $('input.filter-checkbox').change(function () {
        filter = $(this).data('filter-id');

        //get search part of url with 'window.location.search'
        searchParams = new URLSearchParams(window.location.search)

        console.log(searchParams);
        //if filter param exists
        // if(searchParams.has('filter')){
        //     url_filter = searchParams.get('filter')
        //     alert(url_filter)
        // }else{
        //
        // }
        // url_filter = getParameterByName('filter');
        //
        // if(url_filter){
        //     url_filter+=','+filter;
        // }
        //
        // window.history.replaceState(null, null, window.location.href+"&filter="+filter);


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