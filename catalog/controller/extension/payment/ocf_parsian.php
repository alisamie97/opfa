<?php
/* ********************** Support And Update By Mojtaba Moghani ***************************** */
/* ************************* Our WebSite - www.OpenCartFarsi.ir ***************************** */
/* ******************************* Last Update In 2020/10/31 ******************************** */
require_once(DIR_SYSTEM . 'library/nuSoap/nusoap.php');
class ControllerExtensionPaymentOCFParsian extends Controller {
	private $WebService = array();
	private $errors = array();

	public function index() {
		$this->load->language('extension/payment/ocf_parsian');

		$data['text_wait'] = $this->language->get('text_wait');
		$data['text_connect'] = $this->language->get('text_connect');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_error_in_send'] = $this->language->get('text_error_in_send');

		$data['button_confirm'] = $this->language->get('button_confirm');

		return $this->load->view('extension/payment/ocf_parsian', $data);
	}

	public function confirm() {
		$this->load->language('extension/payment/ocf_parsian');

		$this->load->model('checkout/order');

		$json = array();

		$address_cancel = $this->url->link('checkout/checkout', '', true);
		$address_success = $this->url->link('checkout/success', '', true);

		$order_id = isset($this->session->data['order_id']) ? $this->session->data['order_id'] : 0;
		$order_info = $this->model_checkout_order->getOrder($order_id);

		if ($order_info) {
			$data['orderTotal'] = $this->currency->format($order_info['total'], $order_info['currency_code'], false, false);
			$data['orderTotal'] = $this->currency->convert($data['orderTotal'], $order_info['currency_code'], "RLS");
			$data['orderId'] = $order_id;

			/*$data['address_confirm'] = $this->url->link('extension/payment/ocf_parsian/callback', 'order_id=' . $this->encryption->encrypt($this->config->get('config_encryption'), $order_id), true);*/
			$data['address_confirm'] = $this->url->link('extension/payment/ocf_parsian/callback', 'order_id=' . $order_id, true);

			/* Connect */
			$this->load->library('parsian');
			$this->WebService = new Parsian($this->config->get('payment_ocf_parsian_login_account'));
		
			$json = $this->WebService->PayAction($data['orderTotal'], $data['address_confirm'], $data['orderId']);
		} else {
			$json['error'] = $this->language->get('error_order_id');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function callback() {
		/*if ($this->session->data['payment_method']['code'] == 'ocf_parsian') {*/
			$this->load->language('extension/payment/ocf_parsian');

			$this->document->setTitle($this->language->get('text_heading'));

			$data['heading_title'] = '';

			$data['text_pay_result'] = $this->language->get('text_pay_result');
			$data['text_orderId'] = $this->language->get('text_orderId');
			$data['text_tran_trace_no'] = $this->language->get('text_tran_trace_no');

			$data['button_confirm'] = $this->language->get('button_confirm');
			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('checkout/success', '', true);

			$data['results'] = "";
			$data['error_warning'] = "";
			$data['orderId'] = "";
			$data['pay_result'] = "";
			$data['tran_trace_no'] = "";

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'href'      => $this->url->link('common/home'),
				'text'      => $this->language->get('text_home')
			); 

			$data['breadcrumbs'][] = array(
				'href'      => $this->url->link('extension/payment/ocf_parsian/callback', '', true),
				'text'      => $this->language->get('text_heading')
			);

			$this->load->model('checkout/order');

			$address_cancel = $this->url->link('checkout/checkout', '', true);
			$address_success = $this->url->link('checkout/success', '', true);

			if (isset($this->request->get['order_id'])) {
				/*$my_order_id = $this->encryption->decrypt($this->config->get('config_encryption'), $this->request->get['order_id']);*/
				$my_order_id = $this->request->get['order_id'];
			} else {
				$my_order_id = 0;
			}
			if ($my_order_id > 0) {
				$order_id = $my_order_id;
			} else {
				if (isset($this->session->data['order_id'])) {
					$order_id = $this->session->data['order_id'];
				} else {
					$order_id = 0;
				}
			}
			$order_info = $this->model_checkout_order->getOrder($order_id);

			if($order_info) {
				$this->load->library('parsian');
				$this->WebService = new Parsian($this->config->get('payment_ocf_parsian_login_account'));

				$Token		= isset($_REQUEST['Token']) ? $_REQUEST['Token'] : '';
				$status		= isset($_REQUEST['status']) ? $_REQUEST['status'] : '';
				$OrderId	= isset($_REQUEST['OrderId']) ? $_REQUEST['OrderId'] : '';
				$TerminalNo	= isset($_REQUEST['TerminalNo']) ? $_REQUEST['TerminalNo'] : '';
				$RRN		= isset($_REQUEST['RRN']) ? $_REQUEST['RRN'] : '';
				
				if($status == '0' && $Token > 0) {
					if($order_info['order_id'] == $OrderId) {
						$data['orderId'] = $OrderId;
						$LoginAccount = $this->config->get('payment_ocf_parsian_login_account');
						$Request = self::PecVerifyRequest($LoginAccount,$Token);
						if($Request->Status == '0' && $Request->RRN > 0) {
							$tran_success = true;
							$comment = $this->language->get('text_pay_result').' '.$this->language->get('pay_result_success')."\n";
							$comment .= $this->language->get('text_orderId')." $OrderId\n";
							$comment .= $this->language->get('text_tran_trace_no')." $Token\n";
							$data['heading_title'] = $this->language->get('heading_title_success');
							$data['pay_result'] = $this->language->get('pay_result_success');
							$data['tran_trace_no'] = $Token;
							
							$this->model_checkout_order->addOrderHistory($order_info['order_id'], $this->config->get('payment_ocf_parsian_order_status_id'), $comment, true);
							$data['continue'] = $address_success;
							$this->cart->clear();
						} elseif($Request->Status == '-1533') {
							$error_code = 'already_been_completed';
							$this->cart->clear();
						} elseif($Request->Status == '-1') {
							$error_code = 'retry';
						} else {
							$error_code = $Request->Status;
						}
					} else {
						$error_code = 'order_not_for_this_person';
					}
				} else {
					$error_code = $status;
				}
				if(!isset($tran_success)) {
					$data['error_warning'] = self::display_error($error_code,$Token,$order_info['order_id']);
					if($error_code != 'already_been_completed') {
						$data['heading_title'] = $this->language->get('heading_title_unsuccess');
					}
					$comment = "واریز به حساب : خیر\n";
					$comment .= "علت : ".$data['error_warning']."\n";
					
					$data['continue'] = $address_cancel;
				}
			} else {
				$data['error_warning'] = $this->language->get('error_order_id');
				$data['continue'] = $address_cancel;
			}

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('extension/payment/ocf_parsian_confirm', $data));
		/*}*/
	}

	public static function PecVerifyRequest($LoginAccount,$Token) {
		$parameters = array(
			'LoginAccount'		=> $LoginAccount,
			'Token' 			=> $Token
		);
		if(extension_loaded('soap')){
			try {
				$client	= new SoapClient('https://pec.shaparak.ir/NewIPGServices/Confirm/ConfirmService.asmx?WSDL',array('soap_version'=>'SOAP_1_1','cache_wsdl'=>WSDL_CACHE_NONE  ,'encoding'=>'UTF-8'));
				$result	= $client->ConfirmPayment(array("requestData" => $parameters));
				$output['Status'] = $result->ConfirmPaymentResult->Status;
				$output['RRN'] = $result->ConfirmPaymentResult->RRN;
				$output['CardNumberMasked'] = isset($result->ConfirmPaymentResult->CardNumberMasked) ? $result->ConfirmPaymentResult->CardNumberMasked : '';
			}
			catch(Exception $e){
				$output = array('Status' =>	'-1','RRN' => '');
			}
		}
		else{
			$output = array('Status' =>	'-2','RRN' => '');
		}
		return (object)$output;
	}

	public static function PecStatus($code='',$error_page=0) {
		
		switch($code){
			case '-32768':
				$response = 'خطای ناشناخته رخ داده است';
				break;
			case '-1552':
				$response = 'برگشت تراکنش مجاز نمی باشد';
				break;
			case '-1551':
				$response = 'برگشت تراکنش قبلاً انجام شده است';
				break;
			case '-1550':
				$response = 'برگشت تراکنش در وضعیت جاری امکان پذیر نمی باشد';
				break;
			case '-1549':
				$response = 'زمان مجاز برای درخواست برگشت تراکنش به اتمام رسیده است';
				break;
			case '-1548':
				$response = 'فراخوانی سرویس درخواست پرداخت قبض ناموفق بود';
				break;
			case '-1540':
				$response = 'تاييد تراکنش ناموفق مي باشد';
				break;
			case '-1536':
				$response = 'فراخوانی سرویس درخواست شارژ تاپ آپ ناموفق بود';
				break;
			case '-1533':
				$response = 'تراکنش قبلاً تایید شده است';
				break;
			case '1532':
				$response = 'تراکنش از سوی پذیرنده تایید شد';
				break;
			case '-1531':
				$response = 'تراکنش به دلیل انصراف شما در بانک ناموفق بود';
				break;
			case '-1530':
				$response = 'پذیرنده مجاز به تایید این تراکنش نمی باشد';
				break;
			case '-1528':
				$response = 'اطلاعات پرداخت یافت نشد';
				break;
			case '-1527':
				$response = 'انجام عملیات درخواست پرداخت تراکنش خرید ناموفق بود';
				break;
			case '-1507':
				$response = 'تراکنش برگشت به سوئیچ ارسال شد';
				break;
			case '-1505':
				$response = 'تایید تراکنش توسط پذیرنده انجام شد';
				break;
			case '-132':
				$response = 'مبلغ تراکنش کمتر از حداقل مجاز می باشد';
				break;
			case '-131':
				$response = 'Token نامعتبر می باشد';
				break;
			case '-130':
				$response = 'Token زمان منقضی شده است';
				break;
			case '-128':
				$response = 'قالب آدرس IP معتبر نمی باشد';
				break;
			case '-127':
				$response = 'آدرس اینترنتی معتبر نمی باشد';
				break;
			case '-126':
				$response = 'کد شناسایی پذیرنده معتبر نمی باشد';
				break;
			case '-121':
				$response = 'رشته داده شده بطور کامل عددی نمی باشد';
				break;
			case '-120':
				$response = 'طول داده ورودی معتبر نمی باشد';
				break;
			case '-119':
				$response = 'سازمان نامعتبر می باشد';
				break;
			case '-118':
				$response = 'مقدار ارسال شده عدد نمی باشد';
				break;
			case '-117':
				$response = 'طول رشته کم تر از حد مجاز می باشد';
				break;
			case '-116':
				$response = 'طول رشته بیش از حد مجاز می باشد';
				break;
			case '-115':
				$response = 'شناسه پرداخت نامعتبر می باشد';
				break;
			case '-114':
				$response = 'شناسه قبض نامعتبر می باشد';
				break;
			case '-113':
				$response = 'پارامتر ورودی خالی می باشد';
				break;
			case '-112':
				$response = 'شماره سفارش تکراری است';
				break;
			case '-111':
				$response = 'مبلغ تراکنش بیش از حد مجاز پذیرنده می باشد';
				break;
			case '-108':
				$response = 'قابلیت برگشت تراکنش برای پذیرنده غیر فعال می باشد';
				break;
			case '-107':
				$response = 'قابلیت ارسال تاییده تراکنش برای پذیرنده غیر فعال می باشد';
				break;
			case '-106':
				$response = 'قابلیت شارژ برای پذیرنده غیر فعال می باشد';
				break;
			case '-105':
				$response = 'قابلیت تاپ آپ برای پذیرنده غیر فعال می باشد';
				break;
			case '-104':
				$response = 'قابلیت پرداخت قبض برای پذیرنده غیر فعال می باشد';
				break;
			case '-103':
				$response = 'قابلیت خرید برای پذیرنده غیر فعال می باشد';
				break;
			case '-102':
				$response = 'تراکنش با موفقیت برگشت داده شد';
				break;
			case '-101':
				$response = 'پذیرنده اهراز هویت نشد';
				break;
			case '-100':
				$response = 'پذیرنده غیرفعال می باشد';
				break;
			case '-1':
				$response = 'خطای سرور';
				break;
			case '0':
				$response = 'عملیات موفق می باشد';
				break;
			case '1':
				$response = 'صادرکننده ی کارت از انجام تراکنش صرف نظر کرد';
				break;
			case '2':
				$response = 'عملیات تاییدیه این تراکنش قبلا باموفقیت صورت پذیرفته است';
				break;
			case '3':
				$response = 'پذیرنده ی فروشگاهی نامعتبر می باشد';
				break;
			case '5':
				$response = 'از انجام تراکنش صرف نظر شد';
				break;
			case '6':
				$response = 'بروز خطايي ناشناخته';
				break;
			case '8':
				$response = 'باتشخیص هویت دارنده ی کارت، تراکنش موفق می باشد';
				break;
			case '9':
				$response = 'درخواست رسيده در حال پي گيري و انجام است ';
				break;
			case '10':
				$response = 'تراکنش با مبلغي پايين تر از مبلغ درخواستي ( کمبود حساب مشتري ) پذيرفته شده است ';
				break;
			case '12':
				$response = 'تراکنش نامعتبر است';
				break;
			case '13':
				$response = 'مبلغ تراکنش نادرست است';
				break;
			case '14':
				$response = 'شماره کارت ارسالی نامعتبر است (وجود ندارد)';
				break;
			case '15':
				$response = 'صادرکننده ی کارت نامعتبراست (وجود ندارد)';
				break;
			case '17':
				$response = 'مشتري درخواست کننده حذف شده است ';
				break;
			case '20':
				$response = 'در موقعيتي که سوئيچ جهت پذيرش تراکنش نيازمند پرس و جو از کارت است ممکن است درخواست از کارت ( ترمينال) بنمايد اين پيام مبين نامعتبر بودن جواب است';
				break;
			case '21':
				$response = 'در صورتي که پاسخ به در خواست ترمينا ل نيازمند هيچ پاسخ خاص يا عملکردي نباشيم اين پيام را خواهيم داشت ';
				break;
			case '22':
				$response = 'تراکنش مشکوک به بد عمل کردن ( کارت ، ترمينال ، دارنده کارت ) بوده است لذا پذيرفته نشده است';
				break;
			case '30':
				$response = 'قالب پیام دارای اشکال است';
				break;
			case '31':
				$response = 'پذیرنده توسط سوئی پشتیبانی نمی شود';
				break;
			case '32':
				$response = 'تراکنش به صورت غير قطعي کامل شده است. به عنوان مثال تراکنش سپرده گزاري که از ديد مشتري کامل شده است ولي مي بايست تکميل گردد.';
				break;
			case '33':
				$response = 'تاریخ انقضای کارت سپری شده است';
				break;
			case '38':
				$response = 'تعداد دفعات ورود رمزغلط بیش از حدمجاز است. کارت توسط دستگاه ضبط شود';
				break;
			case '39':
				$response = 'کارت حساب اعتباری ندارد';
				break;
			case '40':
				$response = 'عملیات درخواستی پشتیبانی نمی گردد';
				break;
			case '41':
				$response = 'کارت مفقودی می باشد';
				break;
			case '43':
				$response = 'کارت مسروقه می باشد';
				break;
			case '45':
				$response = 'قبض قابل پرداخت نمی باشد';
				break;
			case '51':
				$response = 'موجودی کافی نمی باشد';
				break;
			case '54':
				$response = 'تاریخ انقضای کارت سپری شده است';
				break;
			case '55':
				$response = 'رمز کارت نا معتبر است';
				break;
			case '56':
				$response = 'کارت نا معتبر است';
				break;
			case '57':
				$response = 'انجام تراکنش مربوطه توسط دارنده ی کارت مجاز نمی باشد';
				break;
			case '58':
				$response = 'انجام تراکنش مربوطه توسط پایانه ی انجام دهنده مجاز نمی باشد';
				break;
			case '59':
				$response = 'کارت مظنون به تقلب است';
				break;
			case '61':
				$response = 'مبلغ تراکنش بیش از حد مجاز می باشد';
				break;
			case '62':
				$response = 'کارت محدود شده است';
				break;
			case '63':
				$response = 'تمهیدات امنیتی نقض گردیده است';
				break;
			case '65':
				$response = 'تعداد درخواست تراکنش بیش از حد مجاز می باشد';
				break;
			case '68':
				$response = 'پاسخ لازم براي تکميل يا انجام تراکنش خيلي دير رسيده است';
				break;
			case '69':
				$response = 'تعداد دفعات تکرار رمز از حد مجاز گذشته است ';
				break;
			case '75':
				$response = 'تعداد دفعات ورود رمزغلط بیش از حدمجاز است';
				break;
			case '78':
				$response = 'کارت فعال نیست';
				break;
			case '79':
				$response = 'حساب متصل به کارت نا معتبر است یا دارای اشکال است';
				break;
			case '80':
				$response = 'درخواست تراکنش رد شده است';
				break;
			case '81':
				$response = 'کارت پذيرفته نشد';
				break;
			case '83':
				$response = 'سرويس دهنده سوئيچ کارت تراکنش را نپذيرفته است';
				break;
			case '84':
				$response = 'در تراکنشهايي که انجام آن مستلزم ارتباط با صادر کننده است در صورت فعال نبودن صادر کننده اين پيام در پاسخ ارسال خواهد شد ';
				break;
			case '91':
				$response = 'سيستم صدور مجوز انجام تراکنش موقتا غير فعال است و يا  زمان تعيين شده براي صدور مجوز به پايان رسيده است';
				break;
			case '92':
				$response = 'مقصد تراکنش پيدا نشد';
				break;
			case '93':
				$response = 'امکان تکميل تراکنش وجود ندارد';
				break;
			default:
				$response = 'پرداخت تراکنش به دلیل انصراف در صفحه بانک ناموفق بود';
				break;
		}
		return $response;
	}

	public static function display_error($pay_status='',$tran_id='',$order_id='',$is_callback=1) {
		if($pay_status == 'retry')
		{
			$page_title = 'خطای موقت در پرداخت';
			$admin_mess = 'در هنگام بازگشت خریدار از بانک سرور بانک پاسخ نداد ، از خریدار درخواست شد صفحه را رفرش کند';
			$retry_mess = '
				<div style="margin:15px 0px 21px 0px;font-size: 12px;">
					سرور درگاه اینترنتی <span style="color:#ff0000;">به صورت موقت</span> با مشکل مواجه شده است ، جهت تکمیل تراکنش لحظاتی بعد بر روی دکمه زیر کلیک کنید
				</div>
				<div style="margin:20px 0px 25px 0px;color:#008800;" id="reqreload">
					<button onclick="reload_page()">تلاش مجدد</button>
				</div>
				<script>
					function reload_page(){
						document.getElementById("reqreload").innerHTML = "در حال تلاش مجدد لطفا صبر کنید ..";
						location.reload();
					}
				</script>';
		}
		elseif($pay_status == 'reversal_done')
		{
			$page_title = 'مشکل در ارائه خدمات';
			$admin_mess = 'خریدار مبلغ را پرداخت کرد اما در هنگام بازگشت از بانک مشکلی در ارائه خدمات رخ داد ، دستور بازگشت وجه به حساب خریدار در بانک ثبت شد';
			$client_mess = 'پرداخت شما با شماره پیگیری '.$tran_id.' با موفقیت در بانک انجام شده است اما در ارائه خدمات مشکلی رخ داده است !<br />دستور بازگشت وجه به حساب شما در بانک ثبت شده است ، در صورتی که وجه پرداختی تا ساعات آینده به حساب شما بازگشت داده نشد با پشتیبانی تماس بگیرید (نهایت مدت زمان بازگشت به حساب 72 ساعت می باشد)';
		}
		elseif($pay_status == 'reversal_error')
		{
			$page_title = 'مشکل در ارائه خدمات';
			$admin_mess = 'خریدار مبلغ را پرداخت کرد اما در هنگام بازگشت از بانک مشکلی در ارائه خدمات رخ داد ، دستور بازگشت وجه به حساب خریدار در بانک ثبت شد اما متاسفانه با خطا روبرو شد ، به این خریدار باید یا خدمات ارائه شود یا وجه استرداد گردد';
			$client_mess = 'پرداخت شما با شماره پیگیری '.$tran_id.' با موفقیت در بانک انجام شده است اما در ارائه خدمات مشکلی رخ داده است !<br />به منظور ثبت دستور بازگشت وجه به حساب شما در بانک اقدام شد اما متاسفانه با خطا روبرو شد ، لطفا به منظور دریافت خدمات و یا استرداد وجه پرداختی با پشتیبانی تماس بگیرید';
		}
		elseif($pay_status == 'order_not_exist')
		{
			$page_title = 'سفارش یافت نشد';
			$admin_mess = 'سفارش در سایت یافت نشد';
			$client_mess = 'متاسفانه سفارش شما در سایت یافت نشد ! در صورتی که وجه پرداختی از حساب بانکی شما کسر شده باشد به صورت خودکار از سوی بانک به حساب شما باز خواهد گشت (نهایت مدت زمان بازگشت به حساب 72 ساعت می باشد)';
		}
		elseif($pay_status == 'invoice_id_is_blank')
		{
			$page_title = 'خطا در پارامتر ورودی';
			$admin_mess = 'پس از بازگشت از بانک شماره سفارش موجود نبود';
			$client_mess = 'متاسفانه پارامتر ورودی شما معتبر نیست ! در صورتی که وجه پرداختی از حساب بانکی شما کسر شده باشد به صورت خودکار از سوی بانک به حساب شما باز خواهد گشت (نهایت مدت زمان بازگشت به حساب 72 ساعت می باشد)';
		}
		elseif($pay_status == 'already_been_completed')
		{
			$page_title = 'سفارش پیش از این موفق شده است';
			$client_mess = 'سفارش شما پیش از این با شماره پیگیری '.$tran_id.' با موفقیت ثبت شده است';
		}
		elseif($pay_status == 'order_not_for_this_person')
		{
			$page_title = $admin_mess = 'شماره سفارش نادرست است';
			$client_mess = 'شماره سفارش نادرست است ؛ در صورت نیاز به پشتیبانی تماس بگیرید';
		}
		elseif($is_callback == '0')
		{
			$page_title = 'خطا در ارسال به بانک';
			if($pay_status != ''){
				$admin_mess = 'خطای '.$pay_status.' در ارسال به بانک';
				$client_mess = self::PecStatus($pay_status).' (کد خطا : '.$pay_status.')';
			}
			else{
				$admin_mess = 'خطا در ارسال به بانک';
				$client_mess = self::PecStatus($pay_status);
			}
		}
		else
		{
			$page_title = $admin_mess = 'پرداخت انجام نشد';
			$client_mess = self::PecStatus($pay_status);
			if($pay_status != ''){
				$client_mess .= ' (کد خطا : '.$pay_status.')';
			}
			$client_mess .= ' ؛ در صورتی که وجه پرداختی از حساب بانکی شما کسر شده باشد به صورت خودکار از سوی بانک به حساب شما باز خواهد گشت (نهایت مدت زمان بازگشت به حساب 72 ساعت می باشد) - در صورت نیاز با پشتیبانی تماس بگیرید.';
		}
		if(isset($retry_mess)){
			echo '
			<!DOCTYPE html> 
			<html xmlns="http://www.w3.org/1999/xhtml" lang="fa">
			<head>
			<title>'.$page_title.'</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<style>body{font-family:tahoma;text-align:center;margin-top:30px;}</style>
			</head>
			<body>
				<div align="center" dir="rtl" style="font-family:tahoma;font-size:12px;border:1px dotted #c3c3c3; width:60%; margin: 50px auto 0px auto;line-height: 25px;padding-left: 12px;padding-top: 8px;">
					<span style="color:#ff0000;"><b>'.$page_title.'</b></span><br/>';
					if(isset($retry_mess)){
						echo $retry_mess;
					}
					else{
						echo '<p style="text-align:right;margin-right:8px;">'.$client_mess.'</p><a href="'.JURI::root().'index.php">بازگشت >></a><br/><br/>';
					}
				echo '</div>
			</body>
			</html>
			';
			exit();
		}
		else{
			return $client_mess;
		}
	}

	public function encrypt($value) {
		$key = $this->config->get('config_encryption');
		$my_key = hash('sha256', $key, true);
		return strtr(base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, hash('sha256', $my_key, true), $value, MCRYPT_MODE_ECB)), '+/=', '-_,');
	}
	public function decrypt($value) {
		$key = $this->config->get('config_encryption');
		$my_key = hash('sha256', $key, true);
		return trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, hash('sha256', $my_key, true), base64_decode(strtr($value, '-_,', '+/=')), MCRYPT_MODE_ECB));
	}
}
?>