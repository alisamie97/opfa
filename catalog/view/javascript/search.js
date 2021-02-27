$(document).ready(function () {
    //get url
    origin = window.location.href;
    //initiate a global timeout
    timeout = 0;
    //make event listener
    $('#search input').on('keyup', function () {
        //reset timeout on each event call
        if (timeout) {
            clearTimeout(timeout);
        }
        //set timeout and assign value to global timeout
        timeout = setTimeout(function () {
            //get search term from input
            search_term = $('#search input').val();
            //select result list
            ajax_search_result_list = $('#ajax-search-result-list');
            product_list = $('#ajax-search-products-list');
            category_list = $('#ajax-search-categories-list');
            manufacturer_list = $('#ajax-search-manufacturers-list');
            not_found = $('#search-not-found');
            //if search term not empty start ajax
            if (search_term.length) {
                $.ajax({
                    type: 'get',
                    //send ajax request to live_search method
                    url: '?route=common/search/live_search&search_term=' + search_term,
                    beforeSend: function () {
                        // clear any child of result list
                        ajax_search_result_list.hide();
                        product_list.hide();
                        category_list.hide();
                        manufacturer_list.hide();
                        not_found.hide();
                    },
                    fail: function () {

                    },
                    success: function (data) {
                        console.log(data);
                        tempd= data;
                        console.log(tempd);

                        if($('#search-not-found',data).length > 0){
                            not_found.show()
                        }else{
                            if($('#ajax-search-products-list',data).length > 0){
                                product_list.html($('#ajax-search-products-list',data).html());
                            }

                            if($('#ajax-search-categories-list',data).length > 0){
                                category_list.html($('#ajax-search-categories-list',data).html());
                            }

                            if($('#ajax-search-manufacturers-list',data).length > 0){
                                manufacturer_list.html($('#ajax-search-manufacturers-list',data).html());
                            }
                        }
                        ajax_search_result_list.html($(data).html());
                        ajax_search_result_list.show();
                    }
                });
            }else{
                setTimeout(function (){
                    //clear list and hide it from view after 4000 ms if search term is empty and inactive
                    ajax_search_result_list.hide();
                },4000)
            }
        }, 500);
    });
});
