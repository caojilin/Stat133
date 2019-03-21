#Part 2
library(stringr)
split_chars = function(str){
  str_split(str,pattern = "")[[1]]
}
#test:
split_chars("Go Bears!")

split_chars("Expecto Patronum")

vec <-c('G','o',' ','B','e','a','r','s','!')
num_vowels = function(vec){
  tem = data.frame("a"=0,"e"=0,"i"=0,"o"=0,"u"=0)
  for(i in vec){
    if (i == "A" || i == "a"){
      tem["a"]=tem["a"] +1
    }else if(i == "e" || i == "E"){
      tem["e"]=tem["e"] +1
    }else if(i =="i" || i =="I"){
      tem["i"] = tem["i"] + 1
    }else if(i == "o" || i =="O"){
      tem["o"] = tem["o"] + 1
    }else if (i=="u" || i == "U"){
      tem["u"] = tem["u"] + 1
    }
    
  }
  return(tem)
}
#test
num_vowels(vec)

count_vowels = function(str){
  splited = split_chars(str)
  num_vowels(splited)
}

#test
count_vowels("The quick brown fox jumps over the lazy dog")

count_vowels("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")


#Reversing Characters
reverse_chars = function(str){
   splited = split_chars(str)
   rev = ""
   for(i in splited){
     rev = paste0(i,rev)
   }
   rev
}
#test
reverse_chars("gattaca")

reverse_chars("Lumox Maxima")

#reversing setences by words
#just change the pattern in str_split,notice that it returns a list,so
#add [[1]] to get the vector

#and use paste instead of paste0
reverse_words = function(str){
  splited = str_split(str,pattern = " ")[[1]]
  rev = ""
  for (i in splited){
    rev = paste(i,rev)
  }
  rev
}

#test
reverse_words("sentence! this reverse")

reverse_words("string")

















