SELECT p.product_id
FROM oc_product_to_category p2c
         LEFT JOIN oc_product_filter pf
                   ON (p2c.product_id = pf.product_id)
         LEFT JOIN oc_product p
                   ON (pf.product_id = p.product_id)
         LEFT JOIN oc_product_description pd
                   ON (p.product_id = pd.product_id)
         LEFT JOIN oc_product_to_store p2s
                   ON (p.product_id = p2s.product_id)
WHERE pd.language_id = '2'
  AND p.status = '1'
  AND p.date_available <= NOW()
  AND p2s.store_id = '0'
  AND p2c.category_id = '60'
  AND pf.filter_id IN (30, 72)
GROUP BY p.product_id
ORDER BY p.sort_order ASC, LCASE(pd.name) ASC