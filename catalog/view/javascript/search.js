$(document).ready(function () {
    origin = window.location.href;
    console.log(origin);
    var timeout;
    $('#search input').on('keyup', function () {
        if (timeout) {
            clearTimeout(timeout);
        }
        timeout = setTimeout(function () {
            search_term = $('#search input').val();
            list = $('#search ul.dropdown-menu');
            if (search_term.length) {
                $.ajax({
                    type: 'get',
                    url: '?route=product/search/live_search&search_term=' + search_term,
                    beforeSend: function () {
                        list.empty();
                    },
                    fail: function () {

                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        list.css('display', 'block');

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
                    list.empty();
                    list.css('display', 'none');
                },4000)
            }
        }, 500);
    });
});
