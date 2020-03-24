# Collecting and encoding the measures taken against the spread of COVID2019
## Introduction
Here we collect a timeline of all containment and public health measure taken in Switzerland in the course of the COVID2019 pandemics. This is not of immediate use but we believe it will be very percious for future studies on the effect of different control strategies. 
We know this is boring work, but we are grateful to all contributors even if they only contributed to one or two rows of data.

## Data format
To collect the measures, we settled a simple (long) csv format:


| date_implemented | date_lifted | measure | unit | level | source | measure_cat|
| -----------------|-------------|----------|------|-------- | ---- | --- |
| date when the measure is implemented | date when the measure is lifted | textual description of the measure | identifier of the administrative unit | level of the administrative unit (canton, city, federal) | url of the source of this measure | category of the measure |

The data _must_ be stored in *long* and *tidy* format: if multiple measures for the same entities are introduced at the same data, repeated entries must be created.

*unit* should take one of the following values: 
- *federal* for federal level measures
- *canton* for cantonal measures
- *city* for measures taken by municipalities
- *private* for measures taken by businesses, events and other organisations

- unit: administrative unit. For cantons, use ISO abbreviations (2-letter). For cities, use full name in German, French or Italian. For measures taken by private enterprises or organisations, use their full name.  

- *level*: should take one of the following values: - federal for federal level measures - canton for cantonal measures - city for measures taken by municipalities - private for measures taken by businesses, events and other organisations

- source: paste the URL of the source so that it can be verified

- measure_cat: category of the measure according to the swiss epidemics law. If unsure, leave this field empty.

## TODO

### General
- [ ] add measures for all cantons and federal and city level measures.
- [ ] code them according to general categories (Veranstaltungsverbot, ...) according to Art. 40 of the [Epiemiegesetz](https://www.admin.ch/opc/de/classified-compilation/20071012/index.html#a40)
- [ ] prepare an interactive visualization of these measures

### Missing Entities
- [x] BE
- [ ] TG
- [ ] VS
- [X] SH
- [x] AG
- [x] LU
- [ ] OW
- [ ] NW
- [x] UR
- [ ] AR
- [ ] AI
- [ ] GE
- [ ] NE
- [x] SO
- [x] JU
- [ ] Cities
- [ ] Private measures (Events, companies, ...)
- [ ] Federal measures after 20.03.2020



## How to contribute
1. Select an entity where data is still missing or incomplete.
2. Find the correspoding sheet on the collaborative Google Sheet [here](https://drive.google.com/drive/folders/1qy3yExwzflZJKIOcWvhbbhisaWr5qmO5)
3. For cantonal level, find the corresponding home page of the cantonal administration where recommendations and orders are published. These are usually published as PDF's under "media announcements / Medienmitteilungen"
3. Extract the information given in these published orders into the Google sheet. Use the language you are most comfortable with
Extract the following information:
- date_implemented: Date of implementation of the measures. Usually this is the date of the publication. If the publication just announces a future measure, do not register it yet as it is not implemented yet. Format is dd.mm.yyyy
- date_lifted: Date when the control measures are lifted or undone. In most cases, you will not know this, so leave the field empty. For actions with a clear time horizon (i.e. School closure), the date_lifted can be added. However, we will have to check this continuously, since these measures are subject to change. Format is dd.mm.yyyy
-  measure: Free text, short description of measures taken. Look for any recommendation or action/orders issued in relation to stopping the transmission. Examples are given below.
- measure_cat: category of measure. These are coded according to measures described in the Federal Pandemic law and according to the recommendations of WHO. If you are unsure about the category, leave the field empty. Use only the categories provided, do not make new categories. 

