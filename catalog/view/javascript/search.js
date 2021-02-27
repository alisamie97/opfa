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
            list = $('#search ul.dropdown-menu');
            //if search term not empty start ajax
            if (search_term.length) {
                $.ajax({
                    type: 'get',
                    //send ajax request to live_search method
                    url: '?route=product/search/live_search&search_term=' + search_term,
                    beforeSend: function () {
                        //clear any child of result list
                        list.empty();
                    },
                    fail: function () {

                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        list.show();

                        if (!data.products.length && !data.categories.length && !data.manufacturers.length) {
                            list.append('<li><span class="search-not-found" >چیزی پیدا نشد</span></li>');
                        } else {
                            if (data.products.length) {
                                list.append('<li><h5>محصولات</h5></li>')
                                $.each(data.products, function (i, item) {
                                    list.append('<li><a class="btn btn-link btn-block" href="' + item.href + '">' + item.name + '</a></li>');
                                });
                            }
                            if (data.categories.length) {
                                list.append('<li><h5>دسته ها</h5></li>')
                                $.each(data.categories, function (i, item) {
                                    list.append('<li><a class="btn btn-link btn-block" href="' + item.href + '">' + item.name + '</a></li>');
                                });
                            }
                            if (data.manufacturers.length) {
                                list.append('<li><h5>سازنده ها</h5></li>')
                                $.each(data.manufacturers, function (i, item) {
                                    list.append('<li><a class="btn btn-link btn-block" href="' + item.href + '">' + item.name + '</a></li>');
                                });
                            }
                        }
                    }
                });
            }else{
                setTimeout(function (){
                    //clear list and hide it from view after 4000 ms if search term is empty and inactive
                    list.empty();
                    list.hide();
                },4000)
            }
        }, 500);
    });
});
