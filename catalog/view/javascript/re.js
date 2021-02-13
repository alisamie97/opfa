$('#upload-photo2').change(function(){
    var file_data = $('#upload-photo2').prop('files');

    var form_data = new FormData();
     $.each( $('#upload-photo2').prop('files'), function(i, value) {
        form_data.append('file[' + i + ']', value);
    });

    /*form_data.append('file', file_data);*/
    form_data.append('exeption', 'file');

     $.ajax({
        url: 'index.php?route=information/request/upload', // point to server-side PHP script 
          cache: false,
          contentType: false,
          processData: false,
          data: form_data,                         
          type: 'post',
          dataType: 'json',

        beforeSend: function() {
              Swal.fire({
                  title: 'درحال بارگذاری',
                   type: 'question',
                  confirmButtonText: 'باشه ',
                })
                swal.showLoading();

        },


        success: function(json){
            if (json.error) {
                
                Swal.fire({
                  title: 'خطا',
                  text: json.error ,
                  type: 'warning',
                  confirmButtonText: 'باشه ',
                })
             }


            if (json.success) {
              if (json.name) {
                 html = ''
                for (var i = 0; i < json.name.length; i++) {
                    html  +='<div class="d-flex upload-div">'
                    html  +='<a href="javascript:void(0)" class="d-flex" onclick="$(this).parent().remove()"> <img src="catalog/view/theme/default/assets/svg/close.svg"><span>'+json.name[i]+'</span>'
                    html  +='<input type="hidden" class="url_files" value="'+json.success[i]+'"></div>';
                }
              }

 
                $('#file_address').append(html)
                $('#text_ok').html('<i class="icon-check-circle"></i> بارگذاری شده');
                
                Swal.fire({
                   title: '',
                  text: 'فایل مورد نظر با موفقیت بارگذاری شد' ,
                  type: 'success',
                  confirmButtonText: 'باشه ',
                })
             }

        }
     });
});


function  save_reuqest() {

 

 
    



    $('#enquiry').removeClass('error-filed');
    $('#enquiry-error').html('');


    $('#name').removeClass('error-filed');
    $('#name-error').html('');


    $('#telephone').removeClass('error-filed');
    $('#telephone-error').html('');


  enquiry = $('#enquiry').val();
 
  if (enquiry == '' || enquiry == ' ' || !enquiry) {
    $('#enquiry').addClass('error-filed');
    $('#enquiry-error').html(' لطفا لیست اقلام مورد نیاز را بنویسید.');
    return 0;
  }


   name = $('#name').val();
 
  if (name == '' || name == ' ' || !name) {
    $('#name').addClass('error-filed');
    $('#name-error').html(' نام و نام خانوادگی  خود را وارد کنید . ');
    return 0;
  }

   telephone = $('#telephone').val();
 
  if (telephone == '' || telephone == ' ' || !telephone) {
    $('#telephone').addClass('error-filed');
    $('#telephone-error').html('شماره تلفن همرا خود را به شکل صحیح وارد کنید .');
    return 0;
  }

   url_files = [];
   $('.url_files').each(function(){
      url_files.push($(this).val())
    });


 

    city = $('#city').val();

  $.ajax({
      url: 'index.php?route=information/request/save_request' ,
      dataType: 'json',
      data: 'enquiry=' + encodeURIComponent(enquiry) + '&name='+ encodeURIComponent(name)+ '&telephone='+ encodeURIComponent(telephone) 
      + '&img_upload_data_input='+url_files + '&city='+city,    
      type: 'post',

       beforeSend: function() {
            $('#save_reuqest').attr('onclick' ,'')

         },

      success: function(json) {

           $('#save_reuqest').attr('onclick' ,'save_reuqest()')
        if (json.error_telephone) {
             $('#telephone').addClass('error-filed');
             $('#telephone-error').html('شماره تلفن همرا خود را به شکل صحیح وارد کنید .');
        }

        if (json.success) {

          $('#enquiry').val('');
          $('#name').val('');
          $('#telephone').val('');
          $('#img_upload_data_input').val('');
          $('#file_name').html('')
          $('#text_ok').html('')
          $('#file_address').html('')
          $('#city').val('')

                Swal.fire({
                   title: '',
                  text: 'درخواست شما با موفقیت ثبت شد و در اسرع وقت کارشناسان ما با شما تماس خواهند گرفت .' ,
                  type: 'success',
                  confirmButtonText: 'باشه ',
                })
        }
         
      }
    });




}

var set_timeOut ;
$('#m_search').keyup(function(){
  clearTimeout(set_timeOut);
  set_timeOut = setTimeout(function(){  get_all_category() }, 500);
})

function get_all_category(){


 
  path = $('#m_path').val();
  sort = $('#m_sort').val();
  page = $('#m_page').val();
  limit = $('#m_limit').val();
  filter = $('#m_filter').val();
  order = $('#m_order').val();

  available = $('#m_available').val();
  query = $('#m_query').val();
  manufacturer_id = $('#m_manufacturer_id').val();
  m_special = $('#m_special').val();
 
   search = $('#m_search').val();

   if ( typeof  search == 'undefined'  ) {
    search = '';
   }

  if (  typeof  path == 'undefined' ||  typeof  sort    == 'undefined' 
    ||  typeof  page == 'undefined' ||  typeof  limit   == 'undefined' 
    ||  typeof  order == 'undefined' ||  typeof  available == 'undefined' ||  typeof  query == 'undefined' ||  typeof  manufacturer_id == 'undefined' 
     ||  typeof  m_special == 'undefined'  )  {
     $('.my_category_products').html('چیزی یافت نشد'  );
    return 0 ;
  }


   var getUrl = window.location;
  var server_url = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
  

  url = '';

  query_url = $('#query_url').val();

  if (typeof query_url !='undefined') {
    
     base_url = server_url +'/'+ query_url;
 
    if (filter!='' && filter) {
      url += '&filter='+filter;
    } 


    if (page!='' && page) {
      url += '&page='+page;
    }


    if (order!='' && order) {
      url += '&order='+order;
    }

    if (order!='' && order) {
      url += '&order='+order;
    }

    if (available!='' && available) {
      url += '&available='+available;
    }

    if (query!='' && query) {
      url += '&query='+query;
    }


    if (search!='' && search) {
      url += '&search='+search;
    }



    full_url = base_url + url;

    window.history.pushState({url: "" + full_url + ""}, 'filter', full_url); 


  }


     $.ajax({
          url: 'index.php?route=product/product/getProducts',
          data:'path=' + path + '&sort=' + sort + '&page=' + page  + 
          '&limit=' + limit + '&filter=' + filter + '&order=' + order+ 
          '&search=' + search + '&available=' + available + '&query=' + query+ 
          '&manufacturer_id=' + manufacturer_id+ 
          '&m_special=' + m_special ,
          
          type: 'post',
          dataType: 'html',
          beforeSend: function() {
                  $('#modal_loading').modal('show');
                  $('#modal_filter').modal('hide');
                  $('#modal_sort').modal('hide');

           },

          complete: function() {         
           },

          success: function(html) {

           if (html) {
              $('.my_category_products').html(html  );  
                $('html, body').animate({ scrollTop: 0 }, 'slow');
              setTimeout(function () {
                $('#modal_loading').modal('hide')
              }, 100);

           $("input[type='number']").inputSpinner()

 

           }          
              
          },

          error: function(xhr, ajaxOptions, thrownError) {
            //alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }

        }); 

}



 
$('.my_filters input').change(function(){
    
 
  filter = [];

 $('.my_filters input:checked').each(function() {
    filter.push(this.value);
  });

    $('#m_filter').val(  filter.join(',') );

 
  

 get_all_category()


})



function change_size (href){
  if (href) {
      location = href
  }
}



function add_carta(product_id,zarib){



  if (product_id) {
    quantity = $('#quantity').val();
    $('#cart_result').html('');
     $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
        beforeSend: function() {
         },
        complete: function() {
         },
        success: function(json) {
          $('.alert-dismissible, .text-danger').remove();

          if (json['error']) {
            $('#cart_result ').html(json['error']);
            //$('#modal_popop ').modal('show');
          }

          if (json['success']) {
            
              $('.cart-count').html( json['total'] );
              $('.cart-count-footer').html( json['total'] );
              $('.my_cart_footer').css( 'bottom' , '0' );
            
 
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });

  }

}





function remove_cart(cart_id){

if(confirm('آیا مطمئن هستید ؟ ')){



  if (cart_id) {
     $('#cart_result').html('');
     $.ajax({
        url: 'index.php?route=checkout/cart/remove_cart',
        type: 'post',
        data: 'cart_id=' + cart_id  ,
        dataType: 'json',
        beforeSend: function() {
         },
        complete: function() {
         },
        success: function(json) {
          $('.alert-dismissible, .text-danger').remove();

           

          if (json['success']) {
            
              location.reload()
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
         // alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });

  }
  }

}






function clear_cart(cart_id){

if(confirm('آیا مطمئن هستید ؟ ')){



 
 
     $.ajax({
        url: 'index.php?route=checkout/cart/clear_cart',
        type: 'post',
        data: 'cart_id=' + cart_id  ,
        dataType: 'json',
        beforeSend: function() {
         },
        complete: function() {
         },
        success: function(json) {
          $('.alert-dismissible, .text-danger').remove();

           

          if (json['success']) {
            
              location.reload()
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
         // alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });

 
  }

}




$('#my_head_search_input').keyup(function(){


  filter_name = $('#my_head_search_input').val();
 
  if (filter_name !='' && filter_name !=' ' && filter_name !='  ' ) {
      $.ajax({
        url: 'index.php?route=product/product/getProductsForSearch',
        type: 'post',
        data: 'filter_name=' + filter_name  + '&limit=5&format=json',
        dataType: 'json',
        success: function(json) {


            html = '';
          /*if (json.products) {



            for (var i = 0; i < json.products.length; i++) {
              html += '<li><a href="'+json.products[i]['href']+'"><div class="col-md-12"><div class="my_head_search_img"><img   src="'+json.products[i]['image']+'"></div><div class="my_head_search_txt">'+json.products[i]['name']+'</div></div></a></li>';
            }

            if (html!='' && html!=' ') {
                $('.my_head_search_list').html(html)
            }else{
              
                $('.my_head_search_list').html('چیزی یافت نشد')
            }
          }*/


           if (json.categorys) {

             for (var i = 0; i < json.categorys.length; i++) {
              html += ' <div class="text_custom d-flex text_search align-items-center"><a class="d-block w-100" href="'+json.categorys[i]['href']+'"><i class="icon-long-arrow-left mr-2 text-primary"></i> همه کالاهای  دسته بندی  <span class="text-primary   ml-2">'+json.categorys[i]['name']+'</span></a></div>';
            }


          }

          if (json.manufacturers) {

             for (var i = 0; i < json.manufacturers.length; i++) {
              html += ' <div class="text_custom d-flex text_search align-items-center"><a class="d-block w-100" href="'+json.manufacturers[i]['href']+'"><i class="icon-long-arrow-left mr-2 text-primary"></i> همه کالاهای برند  <span class="text-primary   ml-2">'+json.manufacturers[i]['name_farsi']+'</span></a></div>';
            }
          }

           if (html == '') {
            
              
                 html += ' <div class="text_custom d-flex text_search align-items-center"><a class="d-block w-100" href="https://drtamin.com/index.php?route=product%2Fsearch&search='+filter_name+'"><i class="icon-long-arrow-left mr-2 text-primary"></i> نمایش همه نتایج برای  <span class="text-primary   ml-2">'+filter_name+'</span></a></div>';
              
          
         }else{
                html += '<hr>';
            if (json.products) {
                 for (var i = 0; i < json.products.length; i++) {
                html += ' <div class="text_custom d-flex text_search align-items-center"><a class="d-block w-100" href="'+json.products[i]['href']+'"><i class="icon-long-arrow-left mr-2 text-primary"></i> <span class="text-primary   ml-2">'+json.products[i]['group_name']+'</span></a></div>';
              }
            }
         }


         if (html) {
            $('.form-search .list_searched').hide()
            $('.form-search h6').hide();
          $('.my_head_search_list').html(html)

         }else{
           $('.form-search .list_searched').show()
            $('.form-search h6').show()

                      $('.my_head_search_list').html('چیزی یافت نشد .')

         }

        

         

          
          

        }

      });
    }


})


function  change_size_list(product_id , row_id) {
  


     $.ajax({
        url: 'index.php?route=product/product/getPordctById&product_id=' + product_id,
        type: 'post',
 
        dataType: 'json',
        beforeSend: function() {
         },
        complete: function() {
         },
        success: function(json) {

           if (json.product['price']) {
              $('#tr-price'+row_id).html(json.product['price'])

           }
        },
        error: function(xhr, ajaxOptions, thrownError) {
         // alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });



}


function  add_cart_row(row_id) {
    product_id = $('#t-'+row_id+' #my_select_size').val()
    quantity = $('#quantity-'+row_id).val()
    if (product_id != 0 && quantity != 0 && typeof product_id !== 'undefined') {

      $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
        beforeSend: function() {
         },
        complete: function() {
         },
        success: function(json) {
          $('.alert-dismissible, .text-danger').remove();

          if (json['error']) {
            $('#cart-result-'+row_id).html(json['error']);
            //$('#modal_popop ').modal('show');
          }

          if (json['success']) {
            
              $('.cart-count').html( json['total'] );
              $('.cart-count-footer').html( json['total'] );
              $('.my_cart_footer').css( 'bottom' , '0' );

 
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });

    }


  


}


$('#accordion1 .card-header').click(function(){

  $(this).toggleClass('active');
  $(this).parent().find('.faq_description').slideToggle();
});


  if (typeof $('#accordion1 .card-header')[0] !== 'undefined') {

      $('#accordion1 .card-header')[0].click()
  }




 

  function scrollToID(id ,off_ = 0  , tab_ = '') {
    /*if (tab_) {
      $('#'+tab_).trigger('click');
    }*/

  

  setTimeout(function(){
   $([document.documentElement, document.body]).animate({
          scrollTop: $("#"+id).offset().top - off_
      }, 1000);
  } , 100)

}


function add_special_offer(type){
  special_offer_mobile = $('#special_offer_mobile').val();

   $('#special_offer_mobile').removeClass('error-filed');
   $('.error-text').remove();

  if (special_offer_mobile.length != 11 ) {
    $('#special_offer_mobile').addClass('error-filed');
    $('#special_offer_mobile').after('<span class="error-text">شماره تلفن همرا خود را به شکل صحیح وارد کنید .</span>');
    return 0;
  }

  $.ajax({
        url: 'index.php?route=information/information/add_special_offer&mobile='+special_offer_mobile + '&type='+type,
        dataType: 'json',
        beforeSend: function() {
            $('#add_special_offer_btn').attr('onclick' ,'')
         },
        complete: function() {
         },
        success: function(json) {


            $('#add_special_offer_btn').attr('onclick' ,'add_special_offer('+type+')')



          if (json['error']) {
            $('#special_offer_mobile').addClass('error-filed');
            $('#special_offer_mobile').after('<span class="error-text">شماره تلفن همرا خود را به شکل صحیح وارد کنید .</span>');
          }

          if (json['success']) {

              $('#popop_offer_modal .justify-content-center ').html('<div><img src="catalog/view/theme/default/assets/svg/special-success-icon.svg"></div>')
              $('#popop_offer_modal .modal-footer ').html('<p class="text-center  m-auto font-weight-bold text-black ">به زودی باهاتون تماس میگیریم ... </p>')
          }



        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });


}