<?php
class ControllerExtensionPaymentOCFParsian extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/payment/ocf_parsian');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('payment_ocf_parsian', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_developer'] = $this->language->get('text_developer');
		$data['text_developer_title'] = $this->language->get('text_developer_title');

		$data['entry_login_account'] = $this->language->get('entry_login_account');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['login_account'])) {
			$data['error_login_account'] = $this->error['login_account'];
		} else {
			$data['error_login_account'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/payment/ocf_parsian', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/ocf_parsian', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true);

		if (isset($this->request->post['payment_ocf_parsian_login_account'])) {
			$data['payment_ocf_parsian_login_account'] = $this->request->post['payment_ocf_parsian_login_account'];
		} else {
			$data['payment_ocf_parsian_login_account'] = $this->config->get('payment_ocf_parsian_login_account');
		}

		if (isset($this->request->post['payment_ocf_parsian_order_status_id'])) {
			$data['payment_ocf_parsian_order_status_id'] = $this->request->post['payment_ocf_parsian_order_status_id'];
		} else {
			$data['payment_ocf_parsian_order_status_id'] = $this->config->get('payment_ocf_parsian_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['payment_ocf_parsian_status'])) {
			$data['payment_ocf_parsian_status'] = $this->request->post['payment_ocf_parsian_status'];
		} else {
			$data['payment_ocf_parsian_status'] = $this->config->get('payment_ocf_parsian_status');
		}

		if (isset($this->request->post['payment_ocf_parsian_sort_order'])) {
			$data['payment_ocf_parsian_sort_order'] = $this->request->post['payment_ocf_parsian_sort_order'];
		} else {
			$data['payment_ocf_parsian_sort_order'] = $this->config->get('payment_ocf_parsian_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/payment/ocf_parsian', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/ocf_parsian')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['payment_ocf_parsian_login_account']) {
			$this->error['login_account'] = $this->language->get('error_login_account');
		}

		return !$this->error;
	}

	public function install() {
		$unFiles = array(
			DIR_APPLICATION . 'controller/payment/parsian.php',
			DIR_APPLICATION . 'language/english/payment/parsian.php',
			DIR_APPLICATION . 'language/en-gb/payment/parsian.php',
			DIR_APPLICATION . 'language/persian/payment/parsian.php',
			DIR_APPLICATION . 'language/fa-ir/payment/parsian.php',
			DIR_APPLICATION . 'view/template/payment/parsian.tpl',
			DIR_CATALOG . 'controller/payment/parsian.php',
			DIR_CATALOG . 'language/english/payment/parsian.php',
			DIR_CATALOG . 'language/en-gb/payment/parsian.php',
			DIR_CATALOG . 'language/persian/payment/parsian.php',
			DIR_CATALOG . 'language/fa-ir/payment/parsian.php',
			DIR_CATALOG . 'model/payment/parsian.php',
			DIR_CATALOG . 'view/theme/default/template/payment/parsian.tpl',
			DIR_CATALOG . 'view/theme/default/template/payment/parsian_confirm.tpl',

			DIR_APPLICATION . 'controller/payment/ocf_parsian.php',
			DIR_APPLICATION . 'language/english/payment/ocf_parsian.php',
			DIR_APPLICATION . 'language/en-gb/payment/ocf_parsian.php',
			DIR_APPLICATION . 'language/persian/payment/ocf_parsian.php',
			DIR_APPLICATION . 'language/fa-ir/payment/ocf_parsian.php',
			DIR_APPLICATION . 'view/template/payment/ocf_parsian.tpl',
			DIR_CATALOG . 'controller/payment/ocf_parsian.php',
			DIR_CATALOG . 'language/english/payment/ocf_parsian.php',
			DIR_CATALOG . 'language/en-gb/payment/ocf_parsian.php',
			DIR_CATALOG . 'language/persian/payment/ocf_parsian.php',
			DIR_CATALOG . 'language/fa-ir/payment/ocf_parsian.php',
			DIR_CATALOG . 'model/payment/ocf_parsian.php',
			DIR_CATALOG . 'view/theme/default/template/payment/ocf_parsian.tpl',
			DIR_CATALOG . 'view/theme/default/template/payment/ocf_parsian_confirm.tpl',
		);
		
		foreach ($unFiles as $unFile) {
			if (file_exists($unFile)) { unlink($unFile); }
		}
	}
}
?>