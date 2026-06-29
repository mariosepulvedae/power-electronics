library(ggplot2)
library(latex2exp)
library(gridExtra)
name <- "~/Documentos/trabajosLaTex/inverter.txt"
data <- read.delim(name,header=TRUE,sep="\t")

datos <- data.frame(t=data$time[0:1500],
                    Vout=data$V.V2.V1.[0:1500],
                    V1=data$V.v1.[0:1500],
                    V2=data$V.v2.[0:1500])

vout<-ggplot(data=datos)+
  geom_line(mapping = aes(x=t,y=Vout),colour=rgb(255/255, 60/255, 0/255,1),linewidth=1.6)+
  xlab(TeX("$t[s]$"))+
  ylab(TeX("$V_{out}\\ [V]$"))+
  theme_classic()+
  theme(text = element_text(size=20, family="LM Roman 10"))

v1<-ggplot(data=datos)+
  geom_line(mapping = aes(x=t,y=V1),colour=rgb(100/255, 176/255, 128/255,1),linewidth=1.6)+
  xlab(TeX("$t[s]$"))+
  ylab(TeX("$V_{1}\\ [V]$"))+
  theme_classic()+
  theme(text = element_text(size=20, family="LM Roman 10"))

v2<-ggplot(data=datos)+
  geom_line(mapping = aes(x=t,y=V2),colour=rgb(255/255, 208/255, 0/255,1),linewidth=1.6)+
  xlab(TeX("$t[s]$"))+
  ylab(TeX("$V_{2}\\ [V]$"))+
  theme_classic()+
  theme(text = element_text(size=20, family="LM Roman 10"))

out<-grid.arrange(v1, v2, vout, nrow = 3)

ggsave(filename="/home/eduardo/dev/repos/power-electronics/Files/Inverter-SinglePhase/Inverter.png",
       plot=out,
       dpi=500,
       width=16,
       height=8)


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

