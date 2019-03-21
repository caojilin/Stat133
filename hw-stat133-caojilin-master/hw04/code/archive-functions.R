library(XML)
library(stringr)
#1.1) Read Archive Data Table
read_archive = function(package){
    dat =readHTMLTable(paste0('http://cran.r-project.org/src/contrib/Archive/',package))
    dat= dat[[1]]
    dat["package"] = package
    return(dat)
}

raw_data <- read_archive('stringr')

#1.2) Data Cleaning
# version_names(): extracts the name of the package
# version_numbers(): extracts the number of the version
# version_dates(): extracts the date of the version
# version_sizes(): extracts the size of the version
version_names = function(dat){
   name = dat$package[1]
   name_vector = dat$Name[str_detect(dat$Name,pattern = name)]
   names = as.character(na.omit(name_vector))
   str_split(names,pattern = "_")
}

version_numbers = function(raw_data){
  name =unlist(lapply(version_names(raw_data),function(x) x[2]))
  
  numbers = str_sub(name, end = -8)
  return (numbers)
}

version_dates = function(raw_data){
  dates = raw_data$`Last modified`[3:(nrow(raw_data)-1)]
  #It's correct, but you can do it another way
  # dates = str_split(dates,pattern = " ")
  # dates = unlist(lapply(dates,function(x) x[1]))

  return(as.Date(dates))
}

version_sizes = function(raw_data){
  #convert factor to string
  size = as.character(raw_data$Size[3:(nrow(raw_data)-1)])
  size[str_detect(size,pattern = "M")] = as.numeric(str_sub(size[str_detect(size,pattern = "M")],
    end=-2))*1000
  size[str_detect(size,pattern = "K")] = str_sub(size[str_detect(size,pattern = "K")],
                                         end=-2)
  
  
  #size = str_sub(size,end=-2)
  return(as.numeric(size))
}

clean_archive = function(raw_data){
  name = unlist(lapply(version_names(raw_data),function(x) x[1]))
  version = version_numbers(raw_data)
  date =  version_dates(raw_data)
  #Do I have to use this step?
  date = as.Date(date)
  size = version_sizes(raw_data)
  dat = data.frame(name,version,date,size,stringsAsFactors = FALSE)
  write.csv(dat,file = paste0("../data/",name[1],"-archive.csv"))
  return(dat)
}

clean_data = clean_archive(raw_data)

#1.3) Timeline plot
library(ggplot2)
plot_archive = function(clean_data){
  ggplot(data=clean_data,mapping = aes(x=date,y=size),color="blue") + 
    geom_point(color='dodgerblue', size = 2,alpha=0.8)+
  scale_x_date() +geom_step(color="blue",size=1,alpha=0.5) +
    ggtitle(paste(clean_data$name[1],":timeline of version sizes"))+
    xlab("date")+ylab("Size (Kilobytes)")+theme(text = element_text(size=15))
  }
plot_archive(clean_data)
  