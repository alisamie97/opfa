$(document).ready(function () {
    //get url
    origin = window.location.href;
    //initiate a global timeout
    timeout = 0;

    //select result list
    ajax_search_result_list = $('#ajax-search-result-list');

    //store last search
    last_search = '';

    //make event listener after typing is finished
    $('#search input').on('keyup', function (e) {

        //reset timeout on each event call
        if (timeout) {
            clearTimeout(timeout);
        }
        //set timeout and assign value to global timeout
        timeout = setTimeout(function () {
            //get search term from input
            search_term = $('#search input').val();

            //if search term not empty start ajax
            if (search_term.length) {
                $.ajax({
                    type: 'get',
                    //send ajax request to live_search method
                    url: '?route=common/search/live_search&search_term=' + search_term,
                    success: function (data) {
                        ajax_search_result_list.fadeOut(300,'swing',function (){
                            ajax_search_result_list.html($(data).html());
                        });
                    },
                    complete: function (){
                        ajax_search_result_list.fadeIn(300,'swing');
                    }
                });
            }else{
                setTimeout(function (){
                    //hide list from view after 4000 ms if search term is empty and inactive
                    ajax_search_result_list.fadeOut(300,'swing');
                },4000)
            }
        }, 500);
    });


    $('#search input').on('click',function (){
        ajax_search_result_list.fadeIn(300,'swing');

    });

    $(this).on('mouseup',function(e)
    {
        //if clicked on any where of document hide search list result
        ajax_search_result_list = $('#ajax-search-result-list');

        // if the target of the click isn't the container nor a descendant of the container
        if (!ajax_search_result_list.is(e.target) && ajax_search_result_list.has(e.target).length === 0)
        {
            ajax_search_result_list.fadeOut(300,'swing');
        }
    });
});

