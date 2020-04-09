# Control measures against COVID-19 in Switzerland
# Fabienne Krauer, Simone Baffelli

# Last updated: 09.04.2020
#-----------------------------------------------------------

library(ggplot2)

# 1. Load data ----------------------------

# some code here to pull data from a Google sheet(s)
# data <- 

# 2. Visualize ----------------------------


# EVENTS
events <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(events)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_brewer(palette="Blues", 
                    labels=c("no restriction", "events > 1000 banned", 
                             "events > 500 banned", "events > 100 banned", 
                             "events > 50 banned", "events > 10 banned", 
                             "events > 5 banned")) +
  ggtitle("Events and mass gatherings")

png(file = paste0("events.png"),
     width = 1000,
     height = 1000,
     res = 150)
events
dev.off()

# CARE FACILITIES
carefacilities <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(carefacilities)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_brewer(palette="Greens", 
                    labels=c("no restriction", "access restricted", 
                             "access prohibited")) +
  ggtitle("Short- and long-term care facilities")

png(file = paste0("carefacilities.png"),
     width = 1000,
     height = 1000,
     res = 150)
carefacilities
dev.off()

# Retail and gastronomy
retailgastro <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(retailgastro)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_brewer(palette="Purples", 
                    labels=c("no restriction", "access restricted", 
                             "closed")) +
  ggtitle("Retail, gastronomy and entertainment")

png(file = paste0("retailgastro.png"),
     width = 1000,
     height = 1000,
     res = 150)
retailgastro
dev.off()


# PUBLIC PLACES
publicplaces <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(publicplaces)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_manual(values=c("white", "grey50"), 
                    labels=c("no restriction", "closed")) +
  ggtitle("Public places (museums, sports facilities)")

png(file = paste0("publicplaces.png"),
     width = 1000,
     height = 1000,
     res = 150)
publicplaces
dev.off()

# INTERNATIONAL MOBILITY
mobilityint <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(mobilityint)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_manual(values=c("white", "grey50"), 
                    labels=c("no restriction", "restricted incoming mobility")) +
  ggtitle("Cross-border mobility")

png(file = paste0("mobilityint.png"),
     width = 1000,
     height = 1000,
     res = 150)
mobilityint
dev.off()


# DAY CARE
daycare <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(daycare)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_manual(values=c("white", "grey50"), 
                    labels=c("no restriction", "closed or restricted access")) +
  ggtitle("Day care")

png(file = paste0("daycare.png"),
     width = 1000,
     height = 1000,
     res = 150)
daycare
dev.off()

# SCHOOLS
schools <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(schools)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_manual(values=c("white", "grey50"), 
                    labels=c("open", "closed")) +
  ggtitle("Schools")

png(file = paste0("schools.png"),
     width = 1000,
     height = 1000,
     res = 150)
schools
dev.off()

# Universities
universities <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(universities)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_manual(values=c("white", "grey50"), 
                    labels=c("open", "closed")) +
  ggtitle("Universities")

png(file = paste0("universities.png"),
     width = 1000,
     height = 1000,
     res = 150)
universities
dev.off()


# Public and administrative offices
publicoffices <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(publicoffices)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_manual(values=c("white", "grey50"), 
                    labels=c("open", "closed")) +
  ggtitle("Public offices")

png(file = paste0("publicoffices.png"),
     width = 1000,
     height = 1000,
     res = 150)
publicoffices
dev.off()


# public transport
publictransport <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(publictransport)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_manual(values=c("white", "grey50"), 
                    labels=c("normal", "reduced")) +
  ggtitle("Public transport")

png(file = paste0("publictransport.png"),
     width = 1000,
     height = 1000,
     res = 150)
publictransport
dev.off()


# lockdown
lockdown <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(lockdown)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_manual(values=c("white", "grey50"), 
                    labels=c("no", "yes")) +
  ggtitle("Explicit stay-at-home recommendation")

png(file = paste0("lockdown.png"),
     width = 1000,
     height = 1000,
     res = 150)
lockdown
dev.off()


# case management
casemanagement <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(casemanagement)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_manual(values=c("white", "grey50"), 
                    labels=c("no", "yes")) +
  ggtitle("Case management (testing, isolation, quarantine, triage)")

png(file = paste0("casemanagement.png"),
     width = 1000,
     height = 1000,
     res = 150)
casemanagement
dev.off()


# Recommendations
recommendations <- ggplot(data) + geom_tile(aes(x=unit, y=date, fill=as.factor(recommendations)), color="grey") +
  xlab(NULL) + ylab(NULL)  +  
  scale_y_date(expand=c(0,0)) + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        axis.ticks.x = element_blank()) + labs(fill="category") +
  scale_fill_manual(values=c("white", "grey50"), 
                    labels=c("no", "yes")) +
  ggtitle("Recommendations and information campaigns")

png(file = paste0("recommendations.png"),
     width = 1000,
     height = 1000,
     res = 150)
recommendations
dev.off()


