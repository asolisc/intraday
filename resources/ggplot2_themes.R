# --- Load tidyverse ---
library(tidyverse)


# --- Setup fonts ---
library(extrafont)
# font_import(paths = "../02-RStudio-Fonts")
loadfonts(device = "win", quiet = T)


# Decima Theme ------------------------------------------------------------


theme_decima <- function(base_size = 13){
  
  theme_minimal(base_family = "Decima Mono X", base_size = base_size) +
    
    theme(
      # Remove minor grid lines
      panel.grid.minor = element_blank(),
      
      # Far-left title position
      plot.title.position = "plot",
      
      # Background color
      # plot.background = element_rect(fill = "#F4F3EE"),
      
      # Legends
      legend.position = "top",
      legend.direction = "horizontal",
      
      # left-aligned caption
      plot.caption.position = 'plot',
      plot.caption = element_text(hjust = 0)
    )
}


# Roboto Theme ------------------------------------------------------------


theme_roboto <- function(base_size = 13){
  
  theme_minimal(base_family = "Roboto Condensed", base_size = base_size) +
    
    theme(
      # Remove minor grid lines
      panel.grid.minor = element_blank(),
      
      # Far-left title position
      plot.title.position = "plot",
      
      # Background color
      # plot.background = element_rect(fill = "#F4F3EE"),
      
      # Legends
      legend.position = "top",
      legend.direction = "horizontal",
      
      # left-aligned caption
      plot.caption.position = 'plot',
      plot.caption = element_text(hjust = 0)
    )
}



# Plex Theme --------------------------------------------------------------



theme_plex <- function(base_size = 13){
  
  theme_minimal(base_family = "IBM Plex Sans Condensed", base_size = base_size) +
    
    theme(
      # Remove minor grid lines
      panel.grid.minor = element_blank(),
      
      # Far-left title position
      plot.title.position = "plot",
      
      # Background color
      # plot.background = element_rect(fill = "#F4F3EE"),
      
      # Legends
      legend.position = "top",
      legend.direction = "horizontal",
      
      # left-aligned caption
      plot.caption.position = 'plot',
      plot.caption = element_text(hjust = 0)
    )
}


# Fira Theme --------------------------------------------------------------



theme_fira <- function(base_size = 13){
  
  theme_minimal(base_family = "Fira Mono", base_size = base_size) +
    
    theme(
      # Remove minor grid lines
      panel.grid.minor = element_blank(),
      
      # Far-left title position
      plot.title.position = "plot",
      
      # Background color
      plot.background = element_rect(fill = "#F4F3EE"),
      
      # Legends
      legend.position = "top",
      legend.direction = "horizontal",
      
      # left-aligned caption
      plot.caption.position = 'plot',
      plot.caption = element_text(hjust = 0)
    )
}


# Overpass Theme ----------------------------------------------------------

theme_overpass <- function(base_size = 13){
  
  theme_minimal(base_family = "Overpass Mono", base_size = base_size) +
    
    theme(
      # Remove minor grid lines
      panel.grid.minor = element_blank(),
      
      # Far-left title position
      plot.title.position = "plot",
      
      # Background color
      # plot.background = element_rect(fill = "#F4F3EE"),
      
      # Legends
      legend.position = "top",
      legend.direction = "horizontal",
      
      # left-aligned caption
      plot.caption.position = 'plot',
      plot.caption = element_text(hjust = 0)
    )
}




# Open Sans Theme ---------------------------------------------------------

theme_opensans <- function(base_size = 13){
  
  theme_minimal(base_family = "Open Sans", base_size = base_size) +
    
    theme(
      # Remove minor grid lines
      panel.grid.minor = element_blank(),
      
      # Far-left title position
      plot.title.position = "plot",
      
      # Background color
      # plot.background = element_rect(fill = "#F4F3EE"),
      
      # Legends
      legend.position = "top",
      legend.direction = "horizontal",
      
      # left-aligned caption
      plot.caption.position = 'plot',
      plot.caption = element_text(hjust = 0)
    )
}



# Petrona Theme ------------------------------------------------------------


theme_petrona <- function(.base_size = 13){
  
  theme_minimal(base_family = "Petrona", base_size = .base_size) +
    
    theme(
      # Remove minor grid lines
      panel.grid.minor = element_blank(),
      
      # Far-left title position
      plot.title.position = "plot",
      
      # Background color
      # plot.background = element_rect(fill = "#F4F3EE"),
      
      # Legends
      legend.position = "top",
      legend.direction = "horizontal",
      
      # left-aligned caption
      plot.caption.position = 'plot',
      plot.caption = element_text(hjust = 0)
    )
}



# Set Theme & Colors ---------------------------------------------------------------

ggplot2::theme_set(
  theme_fira()
  )


# --- set colors ---
amazing_colors <- c(
  "#134162", "#F26F20", "#48A949", "#318FB5", 
  "#DE4576", "#FFCD49", "#2C8697", 
  "#13364C", "#ABDDE3", "#318B71"
  # "#D14D38", "#4C91B7"
  # "#47802B", "#E23E57", "#532647",
  # "#2F4C58", "#63A583", "#6E93D6",
  # "#EF6101", "#47802B", "#FDAC07"
)

blog_colors <- c("#0018A8", "#00CF7A", "#E7553C", "#454FE6", "#4DF4C1", "#F26F20")







# Play --------------------------------------------------------------------



palmerpenguins::penguins %>%
  as_tibble() %>%
  drop_na %>%
  filter(species %in% c("Adelie", "Chinstrap")) %>% 
  ggplot(aes(bill_length_mm, flipper_length_mm, colour = species)) +
  geom_point(size = 3) +
  labs(
    title = "Palmer Penguins",
    subtitle = "– sub",
    x = "Bill Length (mm)",
    y = "Flipper Length (mm)",
    color = NULL,
    caption = paste0("Figure 1:  is a Toronto, Ontario-based online social networking service for healthcare professionals to post and comment on medical images.",
    "Figure 1 was founded in Toronto by Dr. Joshua Landy, Richard Penner and Gregory Levey.",
    "The platform launched in North America in May 2013 and is now available in more than 100 countries.[2]",
    "The privately held company reports more than 1 million healthcare professionals use its app and website.[3]") %>% str_wrap(width = 140)
  ) +
  scale_colour_manual(values = blog_colors) +
  theme_decima()
#   
# 

# tidyquant::FANG %>%
#   mutate(symbol = fct_relevel(symbol, c("FB", "AMZN", "NFLX", "GOOG"))) %>%
#   ggplot(aes(date, close)) +
#   geom_line(aes(colour = symbol)) +
#   facet_wrap(~ symbol, ncol = 2, scales = "free_y") +
#   scale_colour_manual(values = amazing_colors) +
#   scale_y_continuous(labels = scales::number_format(big.mark = ",")) +
#   labs(
#     title = "FANG Stocks",
#     x = NULL,
#     y = "Close Price"
#   ) +
#   theme_opensans()



# # 
# # 
# ggsave(
#   filename = "amzn.png",
#   units = "in",
#   width = 8 * 1.61803398875,
#   height = 8,
#   path = "plots/",
#   dpi = 400,
#   device = "png"
# )
