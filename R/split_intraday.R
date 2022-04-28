split_intraday <- function(data, 
                           grid = 1, 
                           .date_col = index_date) {
  
  data %>%
    dtplyr::lazy_dt() %>% 
    
    # We group by index_date since all the operations are done per day
    group_by({{.date_col}}) %>% 
    
    # Get and ID for each trade
    mutate(id = row_number() - 1, .after = 3) %>% 
    filter(id %% grid == 0) %>%
    summarise(
      index_time,
      sparse_return = log(last_price/lag(last_price)),
      .groups = 'drop') %>% 
    
    mutate(sparse_grid = grid) %>% 
    
    # Join with the price at each minute
    left_join(data %>% 
                select({{.date_col}}, index_time, last_price),
              by = c("index_date", "index_time")) %>% 
    as_tibble()
}

