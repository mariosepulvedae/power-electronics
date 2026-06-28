library(ggplot2)
library(latex2exp)
name <- "~/Documentos/trabajosLaTex/inverter.txt"
data <- read.delim(name,header=TRUE,sep="\t")

datos <- data.frame(t=data$time[0:1500],
                    Vout=data$V.V2.V1.[0:1500],
                    V1=data$V.v1.[0:1500],
                    V2=data$V.v2.[0:1500])

ggplot(data=datos)+
  geom_line(mapping = aes(x=t,y=Vout))+
  ggtitle(TeX("$V_{out}$ Signal"))+
  theme(text = element_text(size=15, family="LM Roman 10"))


caracterizacion<-ggplot(data = datos)+
  geom_point(mapping = aes(x=dx,y=dy),colour=rgb(39/255, 39/255, 245/255,1),size=0.2)+
  scale_size_area(max_size = 19)+
  xlab(TeX("$V_{DS} \\ [V]$"))+
  ylab(TeX("$I_{D} \\ [A]$"))+
  ggtitle(TeX(" $I_{D}$\\[A] vs $V_{DS}$\\[V]"))+
  theme_linedraw()+
  theme(text = element_text(size=15, family="LM Roman 10"))+
  geom_vline(xintercept = 0,linetype="dotted",color="brown1",linewidth=1)+
  geom_hline(yintercept = 0,linetype="dotted",color="brown1",linewidth=1)+
  geom_text(label = "Corte",x=4,y=3,family="LM Roman 10")+
  annotate("rect", xmin = 0, xmax = 2.3, ymin = 0, ymax = 45,
           alpha = 0.2,fill="orange")+
  geom_text(label = "Triodo",x=1,y=40,family="LM Roman 10")+
  geom_text(label = "Saturación",x=4,y=44,family="LM Roman 10")

