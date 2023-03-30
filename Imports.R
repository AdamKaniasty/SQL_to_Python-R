library(sqldf)
library(dplyr)
library(data.table)

Comments <- read.csv("./Data/Comments.csv.gz")
Posts <- read.csv("./Data/Posts.csv.gz")
Users <- read.csv("./Data/Users.csv.gz")

#COMPARATOR FUNCTION
comp <- function(sql,base,dplyr,table){

    sql <- as.data.table(sql)
    base <- as.data.table(base)
    dplyr <- as.data.table(dplyr)
    table <- as.data.table(table)
    print("COMPARING GIVEN OUTPUTS TO SQL ONE: ")
    if (length(all.equal(sql,base)) == 1 && all.equal(sql,base) == TRUE)
        print(paste("BASE:",TRUE))
    else if (length(all.equal(sql,base,ignore.row.order = TRUE)) == 1 && all.equal(sql,base,ignore.row.order = TRUE) == TRUE)
        print(paste("BASE:",TRUE," permuted"))
    else
        print(paste("BASE:",FALSE))
    
    if (length(all.equal(sql,dplyr)) == 1 && all.equal(sql,dplyr) == TRUE)
        print(paste("DPLYR:",TRUE))
    else if (length(all.equal(sql,dplyr,ignore.row.order = TRUE)) == 1 && all.equal(sql,dplyr,ignore.row.order = TRUE) == TRUE)
        print(paste("DPLYR:",TRUE," permuted"))
    else
        print(paste("DPLYR:",FALSE))
    
    if (length(all.equal(sql,table)) == 1 && all.equal(sql,table) == TRUE)
        print(paste("TABLE:",TRUE))
    else if (length(all.equal(sql,table,ignore.row.order = TRUE)) == 1 && all.equal(sql,table,ignore.row.order = TRUE) == TRUE)
        print(paste("TABLE:",TRUE," permuted"))
    else
        print(paste("TABLE:",FALSE))

    
}