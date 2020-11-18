library(tidyverse)
library(rstudioapi)


# function to select .csv file location
get_csv_path <- function(x){
  
  # prompt dialogue box to select .csv file of exported references 
  request_path <- file.choose()
  
  if(grepl(request_path, pattern = "*.csv$")){
    request_path
  }else{
    warning('Must be .CSV file. Please try again.')
    get_csv_path()
  }
}
path_name <- get_csv_path()

# read .csv file
zotero_refs <- read.csv(path_name)
zotero_refs %>% glimpse

# format for NCBI Batch Citation Manager:
#    journal_title|year|volume|first_page|author_name|your_key|
ncbi_batch_format <- zotero_refs %>% 
  dplyr::mutate(
    ncbi_string = paste0(
      paste(sep = "|",
            Publication.Title, Publication.Year, Volume, 
            str_extract(Pages, "^(\\d|\\w)+"), Author, Key), 
      "|"
      )
    )


ncbi_batch_format$ncbi_string %>% head

# save as .txt file to upload to NCBI at:
#   https://www.ncbi.nlm.nih.gov/pubmed/batchcitmatch
write.table(
  ncbi_batch_format$ncbi_string, file = paste0("refs_ncbi_batch_citation_manager_", Sys.Date(), ".txt"),
  sep = "\t", row.names = FALSE, col.names = FALSE, quote = FALSE
  )
