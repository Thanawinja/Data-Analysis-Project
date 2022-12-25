# -*- coding: utf-8 -*-

# -- Sheet --

# # - R Crash Course - by ... P'Toy Data Rockie


# Tip - shift + enter รัน code cell บน DataLore 

# คำสั่ง print() = แสดงผล
print("Hello World")

# * Variables


x <- 15
y <- 5
print(x+y)

# กา่รประกาศชื่อตัวแปรห้ามขึ้นต้นด้วยตัวเลข
my_name <- "Thanawin"

age <- 22

print(my_name)
print(age)

# rm() = ลบตัวแปร


# * Data Types
# 
# numeric เช่น 34, 35, 100.25, 1500
# 
# character เช่น "hello world", "data science", "R programming"
# 
# logical เช่น TRUE, FALSE


subject <- "Physics"
score <- 90
mean <- 45.5
grade <- "A"
# คำสั่ง class() = ตรวจสอบ data type
class(subject)
class(score)
class(mean)
class(grade)

# * Create Vectors


# c() = สร้างเวกเตอร์
friends <- c("John", "David", "Deft")

# length() = นับจำนวน vectors
length(friends)

# สามารถเรียกดูข้อมูลเเต่ละ index ใน vectors ด้วย variable[index] ; index ในภาษา R จะเริ่มต้นที่ 1 แต่ใน python จะเริ่มต้นที่ 0
friends[1] 

friends[1:3]

friends[2:3]

# * Data Frame 
# 
# หัวใจสำคัญในการทำงานของ Data Analyst


# คุณลักษณะสำคัญของ Vector คือจะเก็บข้อมูล (Data Type) ได้แค่ประเภทเดียวเท่านั้น
name <- c("Jim", "John", "Mark", "Tom", "Dan")
age <- c(20, 21, 20, 18, 24)
movie_lover <- c(TRUE, FALSE, TRUE, TRUE, FALSE)

# ประกาศตัวแปรใหม่ที่เก็บ dataframe ; เงื่อนไขคือต้องมี dimension ที่เท่ากัน
# data.frame() = สร้าง dataframe
df <- data.frame(name, age, movie_lover)

df

# dim() = ดู dimension ของ dataframe
dim(df)

# เพิ่ม column ใหม่ใน dataframe
df$location <- c("Bangkok", "London", "London", "Bangkok", "London")
df

# ลบ column ใหม่ใน dataframe
df$location <- NULL
df

# subset() = filter dataframe
subset(df, df$age > 20)


subset(df, df$movie_lover == TRUE)

# * Function


square <- function(x) {
    return(x^2)
}

square(4)

# * Control Flow
#   
# If-Else
# 
# For
# 
# While


# R ใช้ {} ในการกำหนด scope หรือ block ในการ execute code
check_weather <- function(weather) {
    if (weather == "sunny") {
        print("Lovely weather!")
    }  else {
        print("Bad weather!")
    }
}

check_weather("sunny")

check_weather("cloudy")

# * Read and Write Data
# 
# read.csv("https://example.com/filename.csv") ไว้อ่านไฟล์ csv เข้าสู่ R
# 
# write.csv(df, "filename.csv") ไว้เขียนไฟล์ csv ไปเปิดในโปรแกรมอื่นๆ เช่น Excel, Google Sheets


url <- "https://gist.githubusercontent.com/toyeiei/77576fc3b016ea073cb4a2b331cb9584/raw/13f65efcbf230e595fd46f17c791a2d090eb57b1/r_example_dataframe.csv"

blackpink <- read.csv(url)

blackpink

# * Save Our Notebook as PDF
# 
# คลิก File > Print .pdf เพื่อ save notebook ของเราเป็น .pdf ไว้แชร์ต่อได้
# 
# ctrl+m เพื่อเปลี่ยนจาก code cell เป็น markdown cell
# 
# ctrl+shift+up หรือ ctrl+shift+down เพื่อย้าย cell ขึ้น/ลงใน notebook



