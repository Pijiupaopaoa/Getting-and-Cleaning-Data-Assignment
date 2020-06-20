---
title: "Code Book"
author: "pijiupaopao"
date: "6/19/2020"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
The run_analysis.R stores the code used in assginment for Coursera course - Getting and Cleaning Data.

The run_analysis.R performs the data loading, data cleaning, data manipulation and then finalize the data in the Final.txt file.

## data download

It first loads all the related data files into R, giving each dataset a meaningfull name.

## data cleaning and data manipulation

Then it binds the traning dataset with the test dataset, and then merge the x dataset, y daset and subject.

It then performed data cleaning. Replaced the ambiguous names or abbreviations with meanfull clear names like changing 'tBody' to 'TimeBody'.

## write data
Finally, it grouped the dataset and summarized the dataset.

