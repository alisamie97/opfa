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
            if (search_term.length) {
                $.ajax({
                    type: 'get',
                    url: 'http://localhost/opfa/index.php?route=product/search/live_search&search_term=' + search_term,
                    beforeSend: function () {
                        $('#search ul.dropdown-menu').empty();
                    },
                    fail: function () {

                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        $('#search ul.dropdown-menu').css('display', 'block');

                        if (!data.products.length && !data.categories.length && !data.manufacturers.length) {
                            $('#search ul.dropdown-menu').append('<li><span class="search-not-found" >چیزی پیدا نشد</span></li>');
                            // $('#search ul.dropdown-menu').append('<li><span class="search-not-found" ></span></li>');
                        } else {
                            if (data.products.length) {
                                // $('#search ul.dropdown-menu').append('<hr>');
                                $('#search ul.dropdown-menu').append('<li><h5>محصولات</h5></li>')
                                $.each(data.products, function (i, item) {
                                    $('#search ul.dropdown-menu').append('<li><button class="btn btn-link btn-block" type="button" name="product_id_' + item.product_id + '">' + item.name + '</button></li>');
                                });
                            }
                            if (data.categories.length) {
                                $('#search ul.dropdown-menu').append('<li><h5>دسته ها</h5></li>')
                                $.each(data.categories, function (i, item) {
                                    $('#search ul.dropdown-menu').append('<li><button class="btn btn-link btn-block" type="button" name="product_id_' + item.category_id + '">' + item.name + '</button></li>');
                                });
                                // $('#search ul.dropdown-menu').append('<hr>');
                            }
                            if (data.manufacturers.length) {
                                $('#search ul.dropdown-menu').append('<li><h5>سازنده ها</h5></li>')
                                $.each(data.manufacturers, function (i, item) {
                                    $('#search ul.dropdown-menu').append('<li><button class="btn btn-link btn-block" type="button" name="product_id_' + item.manufacturer_id + '">' + item.name + '</button></li>');
                                });
                                // $('#search ul.dropdown-menu').append('<hr>');
                            }
                        }
                    }
                });
            }
        }, 500);
    });
});