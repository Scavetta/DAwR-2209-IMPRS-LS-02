# SILAC Analysis
# Protein profiles during myocardial cell differentiation

# Load packages ----
library(tidyverse)
library(glue)

# Part 0: Import data ----
protein_df <- read.delim("data/Protein.txt")

# Examine the data:
glimpse(protein_df)


# Quantify the contaminants ----
# e.g. we can filter for only the contaminants
# This is a bit complicated
protein_df_con <- protein_df |> 
  filter(Contaminant == "+")
glimpse(protein_df_con)

# To expand:
protein_df$Contaminant == "+"

protein_df |> 
  filter(Contaminant == "+") |> 
  nrow() -> n_con

# length = number of elements (dataframe is actually a list with n number of elements)

# Nicest way:
sum(protein_df$Contaminant == "+")


# Proportion of contaminants

# Percentage of contaminants (just multiply proportion by 100)

# Transformations & cleaning data ----

# Remove contaminants ====


# log 10 transformations of the intensities ====


# Add the intensities ====

# log2 transformations of the ratios ====


# Part 2: Query data using filter() ----
# Exercise 9.2 (Find protein values) ====





# Exercise 9.3 (Find significant hits) and 10.2 ====
# For the H/M ratio column, create a new data 
# frame containing only proteins that have 
# a p-value less than 0.05


# Exercise 10.4 (Find top 20 values) ==== 


# Exercise 10.5 (Find intersections) ====

