<?php
class ModelCatalogCategory extends Model {
	public function getCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row;
	}

	public function getCategories($parent_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");

		return $query->rows;
	}

	//ali97rey edit: get category filtered
    public function getCategoriesFiltered($filter=array()){

	    $sql = "SELECT cd.category_id as id,cd.name FROM ".DB_PREFIX."category_description cd WHERE 1=1 ";
	    if (@$filter['filter_category_name']){
	        $sql .=' AND cd.name LIKE "%'.$filter['filter_category_name'].'%" ';
        }

        if (isset($filter['start']) || isset($filter['limit'])) {
            if ($filter['start'] < 0) {
                $filter['start'] = 0;
            }

            if ($filter['limit'] < 1) {
                $filter['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$filter['start'] . "," . (int)$filter['limit'];
        }

        $data = array();
	    $query = $this->db->query($sql);
        foreach ($query->rows as $value){
            $data[] = array(
                'name' => $value['name'] ,
                'href' => $this->url->link('product/category' , 'path='.$value['id'])
            );
        }
        return $data;
    }

    //ali97rey edit: get category filter groups and filters
    public function reGetCategoryFilters($category_id){
	    $sql = 'SELECT cf.filter_id,fd.name AS filter_name,f.filter_group_id,fgd.name AS filter_group_name 
                FROM oc_category_filter cf
                JOIN oc_filter f ON cf.filter_id = f.filter_id
                JOIN oc_filter_description fd ON fd.filter_id = f.filter_id
                JOIN oc_filter_group_description fgd ON fgd.filter_group_id = f.filter_group_id
                WHERE cf.category_id='.$category_id;

        $query = $this->db->query($sql);

        return $query->rows;
    }

    //ali97rey edit: get filter groups
    public function getFilterGroups($category_id){
        $sql = 'SELECT filter_group_id,name AS filter_group_name FROM '.DB_PREFIX.'filter_group_description ';

        $query = $this->db->query($sql);

        return $query->rows;
    }

    //ali97rey edit: get filters
    public function getFilters($filter_group_id){
        $sql = 'SELECT filter_id,name AS filter_name FROM '.DB_PREFIX.'filter_description WHERE filter_group_id='.$filter_group_id;

        $query = $this->db->query($sql);

        return $query->rows;
    }

	public function getCategoryFilters($category_id) {
		$implode = array();

		$query = $this->db->query("SELECT filter_id FROM " . DB_PREFIX . "category_filter WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$implode[] = (int)$result['filter_id'];
		}

		$filter_group_data = array();

		if ($implode) {
			$filter_group_query = $this->db->query("SELECT DISTINCT f.filter_group_id, fgd.name, fg.sort_order FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_group fg ON (f.filter_group_id = fg.filter_group_id) LEFT JOIN " . DB_PREFIX . "filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND fgd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY f.filter_group_id ORDER BY fg.sort_order, LCASE(fgd.name)");

			foreach ($filter_group_query->rows as $filter_group) {
				$filter_data = array();

				$filter_query = $this->db->query("SELECT DISTINCT f.filter_id, fd.name FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_description fd ON (f.filter_id = fd.filter_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND f.filter_group_id = '" . (int)$filter_group['filter_group_id'] . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY f.sort_order, LCASE(fd.name)");

				foreach ($filter_query->rows as $filter) {
					$filter_data[] = array(
						'filter_id' => $filter['filter_id'],
						'name'      => $filter['name']
					);
				}

				if ($filter_data) {
					$filter_group_data[] = array(
						'filter_group_id' => $filter_group['filter_group_id'],
						'name'            => $filter_group['name'],
						'filter'          => $filter_data
					);
				}
			}
		}

		return $filter_group_data;
	}

	public function getCategoryLayoutId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_layout WHERE category_id = '" . (int)$category_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return (int)$query->row['layout_id'];
		} else {
			return 0;
		}
	}

	public function getTotalCategoriesByCategoryId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row['total'];
	}
}