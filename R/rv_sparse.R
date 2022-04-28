rv_sparse <- function(split_data,
                      .index_by = index_date) {
  split_data %>% 
    dtplyr::lazy_dt() %>% 
    mutate(log_ret_sq = sparse_return^2) %>% 
    group_by({{ .index_by }}, sparse_grid) %>% 
    summarise(
      RV_sparse = sum(log_ret_sq, na.rm = T),
      .groups = "drop"
    ) %>% 
    mutate(RVol_sparse = sqrt(252 * RV_sparse)) %>% 
    as_tibble()
}
