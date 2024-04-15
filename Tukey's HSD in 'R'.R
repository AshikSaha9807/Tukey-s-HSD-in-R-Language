library(tidyverse)
 
library(ggplot2)

library(agricolae)

library(dplyr)

S2 <- read.csv('TUKEY_HSD.csv')
str(S2)


S2$GEN=as.factor(S2$GEN)

### Tukey-HSD

value_max = S2 %>% group_by(GEN) %>% summarize(max_value = max(PH))

hsd=HSD.test(aov(PH~GEN, data=S2), trt = "GEN", group = T)

sig.letters <- hsd$groups[order(row.names(hsd$groups)), ]

waka<- ggplot(data =S2, aes(x = GEN, y = PH))+ 
  
  geom_boxplot(aes(fill= GEN))+geom_text(data = value_max, aes(x=GEN,
                                                               
                                                               y = 0.1 + max_value, label = sig.letters$groups),vjust=0)+stat_boxplot(geom = 'errorbar', 
                                                                                                                                      
                                                                                                                                      width = 0.1)+ ggtitle("Plant Height") + xlab("Genotypes 

  (PH)") +ylab("Plant height(cm)")

waka

value_max = S2 %>% group_by(GEN) %>% summarize(max_value = max(LA))

hsd=HSD.test(aov(LA~GEN, data=S2), trt = "GEN", group = T)

sig.letters <- hsd$groups[order(row.names(hsd$groups)), ]

waka2<- ggplot(data =S2, aes(x = GEN, y = LA))+ 
  
  geom_boxplot(aes(fill= GEN))+geom_text(data = value_max, aes(x=GEN,
                                                               
                                                               y = 0.1 + max_value, label = sig.letters$groups),vjust=0)+stat_boxplot(geom = 'errorbar', 
                                                                                                                                      
                                                                                                                                      width = 0.1)+ ggtitle("b") + xlab("brewery sludge 

  (t ha-1)") +ylab("qq(cm)")

waka2

value_max = S2 %>% group_by(GEN) %>% summarize(max_value = max(SPAD))

hsd=HSD.test(aov(SPAD~GEN, data=S2), trt = "GEN", group = T)

sig.letters <- hsd$groups[order(row.names(hsd$groups)), ]

waka3<- ggplot(data =S2, aes(x = GEN, y = SPAD))+ 
  
  geom_boxplot(aes(fill= GEN))+geom_text(data = value_max, aes(x=GEN,
                                                               
                                                               y = 0.1 + max_value, label = sig.letters$groups),vjust=0)+stat_boxplot(geom = 'errorbar', 
                                                                                                                                      
                                                                                                                                      width = 0.1)+ ggtitle("c") + xlab("brewery sludge 

  (t ha-1)") +ylab("zx(cm)")

waka3

value_max = S2 %>% group_by(GEN) %>% summarize(max_value = max(TDW))

hsd=HSD.test(aov(TDW~GEN, data=S2), trt = "GEN", group = T)

sig.letters <- hsd$groups[order(row.names(hsd$groups)), ]

waka4<- ggplot(data =S2, aes(x = GEN, y = TDW))+ 
  
  geom_boxplot(aes(fill= GEN))+geom_text(data = value_max, aes(x=GEN,
                                                               
                                                               y = 0.1 + max_value, label = sig.letters$groups),vjust=0)+stat_boxplot(geom = 'errorbar', 
                                                                                                                                      
                                                                                                                                      width = 0.1)+ ggtitle("d") + xlab("brewery sludge 

  (t ha-1)") +ylab("TDW(cm)")

waka4

#Combining boxplots using patchwork library

library(patchwork)

(waka|waka2|waka3|waka4)

(waka/waka2/waka3/waka4)

(waka/waka2)

(w|w2|w3|w4)

(w|w2)/(w3|w4)

# to remove lengend

w=waka + theme(legend.position="none")

w2=waka2 + theme(legend.position="none")

w3=waka3+ theme(legend.position="none")

w4=waka4+ theme(legend.position="none")

(w|w2|w3|w4)

(w|w2)/(w3|w4)

# to give one lengend for all response variables 

waka+ waka2 + waka3+waka4 + plot_layout(guides = 'collect')
