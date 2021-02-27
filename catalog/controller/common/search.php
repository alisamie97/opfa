<?php
class ControllerCommonSearch extends Controller {
	public function index() {
		$this->load->language('common/search');

		$data['text_search'] = $this->language->get('text_search');

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}

		return $this->load->view('common/search', $data);
	}

    //ali97rey edit: live ajax search
    public function live_search()
    {
        //get search term
        $search_term = $this->request->get['search_term'];
        //if search term is empty exit
        if (empty($search_term)) exit;

        //load product model
        $this->load->model('catalog/product');
        $filter = array(
            'filter_product_name' =>   $search_term ,
            'start' => 0,
            'limit' => 5
        );
        $data['products'] = $this->model_catalog_product->reSearchProducts($filter);

        //load category model
        $this->load->model('catalog/category');
        $filter = array(
            'filter_category_name' =>   $search_term ,
            'start' => 0,
            'limit' => 5
        );
        $data['categories'] = $this->model_catalog_category->reSearchCategories($filter);


        $this->load->model('catalog/manufacturer');
        $filter = array(
            'filter_manufacturer_name' =>   $search_term ,
            'start' => 0,
            'limit' => 5
        );
        $data['manufacturers'] = $this->model_catalog_manufacturer->reSearchManufacturers($filter);

        if(empty($data['products']) and empty($data['categories']) and empty($data['manufacturers'])){
            $data['not_found']=true;
        }

        $this->response->setOutput($this->load->view('common/re_search', $data));
    }
}