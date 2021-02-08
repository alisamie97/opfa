<?php
final class Parsian {
	public $data = array();
	public $errors = array();
	
	public function __construct($login_account = null) {
		
		## (Class)->Costruction
		$this->data['Config']['Login_account'] = isset($login_account) && !empty($login_account) ? ($login_account) : null;
	}
	
	public function __destruct() {
	
		## (Class)->Destruction
		$this->data = array();
		$this->errors = array();
	}
	
	public function getString($array) {
		if (is_array($array)) {
			foreach ($array as $key => $value) { $resultStr = $value; }
		} else {
			$resultStr = $array;
		}
		return $resultStr;
	}
	
	public function setErrors($errData = '', $note = '', $errNote = 'خطای سیستم') {
		
		## ErrData
		$errData = is_array($errData) ? implode(", ", $errData) : $errData;

		if (!empty($errData)) {
			$this->errors[] = $errNote . ' :: ' . $errData . (!empty($note) ? ' - ' . $note : '');
		}
	}
	
	public function getErrors($errCode = '', $note = '', $errNote = 'خطای وب سرویس') {
		
		switch($errCode) {
			case 11: $err = "شماره کارت معتبر نیست"; break;
			case 12: $err = "موجودی کافی نیست"; break;
			case 13: $err = "رمز دوم شما صحیح نیست"; break;
			case 14: $err = "دفعات مجاز ورود رمز بیش از حد است"; break;
			case 15: $err = "کارت معتبر نیست"; break;
			case 16: $err = "دفعات برداشت وجه بیش از حد مجاز است"; break;
			case 17: $err = "کاربر از انجام تراکنش منصرف شده است"; break;
			case 18: $err = "تاریخ انقضای کارت گذشته است"; break;
			case 19: $err = "مبلغ برداشت وجه بیش از حد مجاز است"; break;
			case 21: $err = "پذیرنده معتبر نیست"; break;
			case 23: $err = "خطای امنیتی رخ داده است"; break;
			case 24: $err = "اطلاعات کاربری پذیرنده معتبر نیست"; break;
			case 25: $err = "مبلغ نامعتبر است"; break;
			case 31: $err = "پاسخ نامعتبر است"; break;
			case 32: $err = "فرمت اطلاعات وارد شده صحیح نیست"; break;
			case 33: $err = "حساب نامعتبر است"; break;
			case 34: $err = "خطای سیستمی"; break;
			case 35: $err = "تاریخ نامعتبر است"; break;
			case 41: $err = "شماره درخواست تکراری است"; break;
			case 42: $err = "تراکنش Sale یافت نشد"; break;
			case 43: $err = "قبلا درخواست Verify داده شده است"; break;
			case 44: $err = "درخواست Verify یافت نشد"; break;
			case 45: $err = "تراکنش Settle شده است"; break;
			case 46: $err = "تراکنش Settle نشده است"; break;
			case 47: $err = "تراکنش Settle یافت نشد"; break;
			case 48: $err = "تراکنش Reverse شده است"; break;
			case 49: $err = "تراکنش Refund یافت نشد"; break;
			case 51: $err = "تراکنش تکراری است"; break;
			case 54: $err = "تراکنش مرجع موجود نیست"; break;
			case 55: $err = "تراکنش نامعتبر است"; break;
			case 61: $err = "خطا در واریز"; break;
			case 111: $err = "صادر کننده کارت نامعتبر است"; break;
			case 112: $err = "خطای سوییچ صادر کننده کارت"; break;
			case 113: $err = "پاسخی از صادر کننده کارت دریافت نشد"; break;
			case 114: $err = "دارنده کارت مجاز به انجام این تراکنش نمی باشد"; break;
			case 412: $err = "شناسه قبض نادرست است"; break;
			case 413: $err = "شناسه پرداخت نادرست است"; break;
			case 414: $err = "سازمان صادر کننده قبض معتبر نیست"; break;
			case 415: $err = "زمان جلسه کاری به پایان رسیده است"; break;
			case 416: $err = "خطا در ثبت اطلاعات"; break;
			case 417: $err = "شناسه پرداخت کننده نامعتبر است"; break;
			case 418: $err = "اشکال در تعریف اطلاعات مشتری"; break;
			case 419: $err = "تعداد دفعات ورود اطلاعات بیش از حد مجاز است"; break;
			case 421: $err = "IP معتبر نیست"; break;
		}
		
		if (isset($err) && $errCode) {
			$this->errors[] = $errNote . ' (' . $errCode . ' :: ' . $err . ')' . (!empty($note) ? ' - ' . $note : '');
		} 
		
		return isset($err) && $errCode ? ($errNote . ' (' . $errCode . ' :: ' . $err . ')' . (!empty($note) ? ' - ' . $note : '')) : true;
	}
	
	private function Connect() {
		$this->data['Config']['nameSpace'] = 'http://interfaces.core.sw.bps.com/';
		
		## WSDL
		$soapClient	= new nusoap_client($this->data['Config']['Wsdl']);
		$soapClient->xml_encoding = "UTF-8";
		$soapClient->soap_defencoding = "UTF-8";
		$soapClient->decode_utf8 = false;
		
		## Construct Errors
		$this->setErrors($soapClient->getError(), 'Info :: ConstructError');
		
		$this->data['Proxy'] = $soapClient;
	}
	
	public function PayAction($orderTotal, $address_confirm, $order_id = '') {
		$output = array();
		if($order_id > 0){
			$LoginAccount	= $this->data['Config']['Login_account'];
			$amount			= $orderTotal;
			$Request = self::PecPayRequest($LoginAccount,$amount,$order_id,$address_confirm);
			if($Request->Status == '0' && $Request->Token > 0){
				$output['Token'] = $Request->Token;
			}
			else{
				$error_code = $Request->Status;
			}
		}
		else{
			$error_code = 'error_creating_order';
		}
		if(isset($error_code)){
			$output['error'] = self::display_error($error_code,'',$order_id,0);
		}
		return $output;
	}
	
	public function PayConfirm($address_cancel) {
		$Token		= isset($_REQUEST['Token']) ? $_REQUEST['Token'] : '';
		$status		= isset($_REQUEST['status']) ? $_REQUEST['status'] : '';
		$OrderId	= isset($_REQUEST['OrderId']) ? $_REQUEST['OrderId'] : '';
		$TerminalNo	= isset($_REQUEST['TerminalNo']) ? $_REQUEST['TerminalNo'] : '';
		$RRN		= isset($_REQUEST['RRN']) ? $_REQUEST['RRN'] : '';

		if($status == '0' && $Token > 0)
		{
			$LoginAccount = $this->data['Config']['Login_account'];
			$Request = self::PecVerifyRequest($LoginAccount,$Token);
			if($Request->Status == '0' && $Request->RRN > 0)
			{
				return array('settled' => true, 'orderId' => $this->data['Parameters']['Confirm']['orderId'], 'saleOrderId' => $OrderId, 'saleReferenceId' => $Token);
			}
		}
		else{
			$error_code = $status;
		}
		if(isset($error_code)){
			return array('settled' => false, 'orderId' => $this->data['Parameters']['Confirm']['orderId'], 'saleOrderId' => $OrderId, 'saleReferenceId' => $Token);
		}
	}

	public function Refund($orderTotal, $saleOrderId, $saleReferenceId) {
		
		$this->Connect();
		$this->data['Resources']['code'] = "";
		$this->data['Resources']['VerifyData'] = "";
		$this->data['Resources']['InquiryData'] = "";
		
		$this->data['Resources']['orderId'] = date('YHis') . rand(1, 10000) . rand(1, 10000);
		$this->data['Resources']['orderTotal'] = $orderTotal;
		$this->data['Resources']['saleOrderId'] = $saleOrderId;
		$this->data['Resources']['saleReferenceId'] = $saleReferenceId;
		
		$this->data['Parameters']['Refund_1'] = array(
			'terminalId'   => $this->data['Config']['Login_account'],
			'orderId' 	   		=> $this->data['Resources']['orderId'],
			'saleOrderId'     => $this->data['Resources']['saleOrderId'],
			'saleReferenceId' => $this->data['Resources']['saleReferenceId'],
			'refundAmount'  => $this->data['Resources']['orderTotal'],
		);
		
		$this->data['Calls']['bpRefundRequest'] = $this->data['Proxy']->call('bpRefundRequest', $this->data['Parameters']['Refund_1'], $this->data['Config']['nameSpace']);
		$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
		
		if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
			$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['bpRefundRequest'] : $this->data['Calls']['getError']);
		} else {
	
			## Explode
			$result = explode(',', $this->getString($this->data['Calls']['bpRefundRequest']));
			
			## Resources
			if (isset($result[1]) && $result[0] == "0") {

				$this->data['Resources']['code'] = trim($result[1]);
			} else {
				## -- getErrors --
				$this->getErrors($result[0]);
			}
		}
		
		if ($this->data['Resources']['code']) {
			
			$this->data['Parameters']['Refund_2'] = array(
				'terminalId'   => $this->data['Config']['Login_account'],
				'orderId'	   	  => $this->data['Resources']['saleOrderId'],
				'saleOrderId'     => $this->data['Resources']['saleOrderId'],
				'saleReferenceId' => $this->data['Resources']['saleReferenceId']
			);
			
			## Varify Reauest
			$this->data['Calls']['bpRefundVerifyRequest'] = $this->data['Proxy']->call('bpRefundVerifyRequest', $this->data['Parameters']['Refund_2'], $this->data['Config']['nameSpace']);
			$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
			
			if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
				
				## Inquiry Reauest
				$this->data['Calls']['bpRefundInquiryRequest'] = $this->data['Proxy']->call('bpRefundInquiryRequest', $this->data['Parameters']['Refund_2'], $this->data['Config']['nameSpace']);
				$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
				
				if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
					$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['bpRefundRequest'] : $this->data['Calls']['getError']);
				} else {
					$this->data['Resources']['InquiryData'] = $this->getString($this->data['Calls']['bpRefundInquiryRequest']);
				}
			} else {
				$this->data['Resources']['VerifyData'] = $this->getString($this->data['Calls']['bpRefundVerifyRequest']);
			}
		}
		
		if ($this->data['Resources']['VerifyData'] == "0" || $this->data['Resources']['InquiryData'] == "0") { return (true); }
		return (false);
	}

	public function Settle($saleOrderId, $saleReferenceId) {
		
		$this->Connect();
		$this->data['Resources']['SettleData'] = "";
		
		$this->data['Resources']['orderId'] = date('YHis') . rand(1, 10000) . rand(1, 10000);
		$this->data['Resources']['saleOrderId'] = $saleOrderId;
		$this->data['Resources']['saleReferenceId'] = $saleReferenceId;
		
		$this->data['Parameters']['Settle'] = array(
			'terminalId'     => $this->data['Config']['Login_account'],
			'orderId'	   	  => $this->data['Resources']['orderId'],
			'saleOrderId'  => $this->data['Resources']['saleOrderId'],
			'saleReferenceId' => $this->data['Resources']['saleReferenceId']
		);
		
		## Settle Request
		$this->data['Calls']['bpSettleRequest'] = $this->data['Proxy']->call('bpSettleRequest', $this->data['Parameters']['Settle'], $this->data['Config']['nameSpace']);
		$this->data['Calls']['getError'] = $this->data['Proxy']->getError();
		
		if ($this->data['Proxy']->fault or $this->data['Calls']['getError']) {
			$this->data['setErrors'] = $this->setErrors($this->data['Proxy']->fault ? $this->data['Calls']['bpSettleRequest'] : $this->data['Calls']['getError']);
		} else {
			$this->data['Resources']['SettleData'] = $this->getString($this->data['Calls']['bpSettleRequest']);
		}
		
		if ($this->data['Resources']['SettleData'] == "0") {
			return (true);
		} else {
			$this->getErrors($this->data['Resources']['SettleData'], 'Info :: SettleError');
			return (false);
		}		
	}

	public static function PecPayRequest($LoginAccount,$amount,$order_id,$redirect,$additional='') {
		$parameters = array(
			'LoginAccount'		=> $LoginAccount,
			'Amount' 			=> $amount,
			'OrderId' 			=> $order_id,
			'CallBackUrl' 		=> $redirect,
			'AdditionalData' 	=> $additional
		);
		if(extension_loaded('soap')){
			try {
				$client	= new SoapClient('https://pec.shaparak.ir/NewIPGServices/Sale/SaleService.asmx?WSDL',array('soap_version'=>'SOAP_1_1','cache_wsdl'=>WSDL_CACHE_NONE  ,'encoding'=>'UTF-8'));
				$result	= $client->SalePaymentRequest(array("requestData" => $parameters));
				$output = array(
					'Status'	=>	$result->SalePaymentRequestResult->Status,
					'Token'		=>	$result->SalePaymentRequestResult->Token
				);
			}
			catch(Exception $e){
				$output = array('Status' =>	'-1','Token' =>	'');
			}
		}
		else{
			$output = array('Status' =>	'-2','Token' =>	'');
		}
		return (object)$output;
	}

	public static function PecStatus($code='',$error_page=0){
		
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

}
?>