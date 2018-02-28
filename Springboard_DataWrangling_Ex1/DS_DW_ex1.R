library(tidyverse)

raw_data <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_DataWrangling_Ex1/refine_original.csv")
raw_data %>% glimpse
raw_data %>% distinct(company)

#rename companies
raw_data <- raw_data %>%
  mutate(company = gsub(pattern = "[p|P|f].*", replacement = "philips", x = company),
         company = gsub(pattern = "[a|A].*", replacement = "azko", x = company),
         company = gsub(pattern =  "[v|V].*", replacement = "van houten", x = company),
         company = gsub(pattern =  "[u|U].*", replacement = "unilever", x = company))
raw_data %>% distinct(company)
raw_data %>% glimpse
View(raw_data)

#separate product code and product number
raw_data <-raw_data %>% separate("Product code / number", c("product code", "number"), sep = "-")
View(raw_data)

#create a product category
raw_data <-raw_data %>%
  mutate("Product category" = case_when(
    "product code" == "p" ~ "Smartphone",
    "product code" == "v" ~ "TV",
    "product code" == "x" ~ "Laptop",
    "product code" == "q" ~ "Tablet"
  ))
View(raw_data)

#add full ddress for geocoding
raw_data <-raw_data %>%
unite(raw_data, "full_address", address, city, country, sep = ",")
View(raw_data)

#creat dummy variables for company
raw_data <-raw_data %>%
  mutate(company_philips = ifelse(company == "philips", 1, 0),
         company_akzo = ifelse(company == "azko", 1, 0),
         company_van_houten = ifelse(company == "van_houten", 1, 0),
         company_unilever = ifelse(company == "unilever", 1, 0))
View(raw_data)

#creat dummy variables for product code
raw_data <-raw_data %>%
  mutate(product_smartphone = ifelse(product_code == "Smartphone", 1, 0),
         product_tv = ifelse(product_code == "TV", 1, 0),
         product_laptop = ifelse(product_code == "Laptop", 1, 0),
         product_tablet = ifelse(product_code == "Tablet", 1, 0))
View(raw_data)
  
  



  

                                  
                        
                                  