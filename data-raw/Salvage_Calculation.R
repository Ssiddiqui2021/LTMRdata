library(tidyverse)
library(lubridate)
library(dplyr)
library(RODBC)

## Conenct with Access Database file

DRIVERINFO <- "Driver={Microsoft Access Driver (*.mdb, *.accdb)};"
MDBPATH <- "C:/Users/Ssiddiqui/OneDrive - California Department of Fish and Wildlife/Entrainment_2023/Salvage_StandaloneAccess_V1.accdb"
PATH <- paste0(DRIVERINFO, "DBQ=", MDBPATH)
channel <- odbcDriverConnect(PATH)
##RODBC::sqlTables(channel)

slbv_data<-RODBC::sqlFetch(channel,"Salvage_Length_Bay_Variables_all_Year", rownames = FALSE )

##1993_2000

##Filter data file

Data<-slbv_data %>% filter(SampleDate>="1993-01-01" & SampleDate<="2000-12-31")

##Calculate Salvage
Salvage<-Data %>%  
    mutate(Salvage=(LengthFrequency*(MinutesPumping/SampleTimeLength))) ###Length Freq instead of count, since length data included in the Data Excel file

Data_Salvage<-Salvage %>% mutate(SampleDate=ymd(SampleDate))%>% mutate(year = year(SampleDate))%>%
    mutate(month = month(SampleDate)) %>% mutate(day = day(SampleDate)) %>% group_by(month) %>% summarise(monthlysalvage=sum(Salvage))

##Save File
write.csv(Salvage, "Salvage_1993_2000.csv")

###################################

##2001-2005

##Filter data file

Data<-slbv_data %>% filter(SampleDate>="2001-01-01" & SampleDate<="2005-12-31")

##Calculate Salvage
Salvage<-Data %>%  
    mutate(Salvage=(LengthFrequency*(MinutesPumping/SampleTimeLength))) ###Length Freq instead of count, since length data included in the Data Excel file

Data_Salvage<-Salvage %>% mutate(SampleDate=ymd(SampleDate))%>% mutate(year = year(SampleDate))%>%
    mutate(month = month(SampleDate)) %>% mutate(day = day(SampleDate)) %>% group_by(month) %>% summarise(monthlysalvage=sum(Salvage))

##Save File
write.csv(Salvage, "Salvage_2001_2005.csv")

#########################################################################

##2006-2010

##Filter data file

Data<-slbv_data %>% filter(SampleDate>="2006-01-01" & SampleDate<="2010-12-31")

##Calculate Salvage
Salvage<-Data %>%  
    mutate(Salvage=(LengthFrequency*(MinutesPumping/SampleTimeLength))) ###Length Freq instead of count, since length data included in the Data Excel file

Data_Salvage<-Salvage %>% mutate(SampleDate=ymd(SampleDate))%>% mutate(year = year(SampleDate))%>%
    mutate(month = month(SampleDate)) %>% mutate(day = day(SampleDate)) %>% group_by(month) %>% summarise(monthlysalvage=sum(Salvage))

##Save File
write.csv(Salvage, "Salvage_2006_2010.csv")


#########################################################################

##2010-2015

##Filter data file

Data<-slbv_data %>% filter(SampleDate>="2010-01-01" & SampleDate<="2015-12-31")

##Calculate Salvage
Salvage<-Data %>%  
    mutate(Salvage=(LengthFrequency*(MinutesPumping/SampleTimeLength))) ###Length Freq instead of count, since length data included in the Data Excel file

Data_Salvage<-Salvage %>% mutate(SampleDate=ymd(SampleDate))%>% mutate(year = year(SampleDate))%>%
    mutate(month = month(SampleDate)) %>% mutate(day = day(SampleDate)) %>% group_by(month) %>% summarise(monthlysalvage=sum(Salvage))

##Save File
write.csv(Salvage, "Salvage_2010_2015.csv")

#########################################################################

##2016-2020

##Filter data file

Data<-slbv_data %>% filter(SampleDate>="2016-01-01" & SampleDate<="2020-12-31")

##Calculate Salvage
Salvage<-Data %>%  
    mutate(Salvage=(LengthFrequency*(MinutesPumping/SampleTimeLength))) ###Length Freq instead of count, since length data included in the Data Excel file

Data_Salvage<-Salvage %>% mutate(SampleDate=ymd(SampleDate))%>% mutate(year = year(SampleDate))%>%
    mutate(month = month(SampleDate)) %>% mutate(day = day(SampleDate)) %>% group_by(month) %>% summarise(monthlysalvage=sum(Salvage))

##Save File
write.csv(Salvage, "Salvage_2016_2020.csv")

#########################################################################

##2021-2022

##Filter data file

Data<-slbv_data %>% filter(SampleDate>="2021-01-01" & SampleDate<="2022-12-31")

##Calculate Salvage
Salvage<-Data %>%  
    mutate(Salvage=(LengthFrequency*(MinutesPumping/SampleTimeLength))) ###Length Freq instead of count, since length data included in the Data Excel file

Data_Salvage<-Salvage %>% mutate(SampleDate=ymd(SampleDate))%>% mutate(year = year(SampleDate))%>%
    mutate(month = month(SampleDate)) %>% mutate(day = day(SampleDate)) %>% group_by(month) %>% summarise(monthlysalvage=sum(Salvage))

##Save File
write.csv(Salvage, "Salvage_2021_2022.csv")
