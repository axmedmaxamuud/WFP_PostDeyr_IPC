## Testing survey tool and filling dumpy data for scripting
rm(list = ls())
today <- Sys.Date()

# load required packages
library(tidyverse)
library(readxl)
library(openxlsx)
# remotes::install_github("mabafaba/xlsformfill")
library(xlsformfill)

# load survey tool
questions <- read_excel("input/tool/WFP_VAM_Post_Deyr_IPC_Survey_2024.xlsx", sheet = "survey")
choices <- read_excel("input/tool/WFP_VAM_Post_Deyr_IPC_Survey_2024.xlsx", sheet = "choices")

# generate dumpy data for testing and scripting
dummy_dataset <- xlsformfill::xlsform_fill(questions = questions, choices = choices, n = 500)

# export dumpy data
write.xlsx(dummy_dataset, file = "input/data/Raw_data.xlsx")
