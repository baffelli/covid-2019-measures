# Collecting and encoding the measures taken against the spread of COVID 2019
## Introduction
Here we collect a timeline of all containment and public health measure taken in the course of the covid2019 pandemics. This is not of immediate use but we believe it will be very useful for future studies on the effect of different control measures. 
We know this is boring work, but we are grateful to all contributors even if they only contributed to one or two rows of data.

## Data format
To collect the measures, we settled a simple (long) csv format:


| date_implemented | date_lifted | measure | unit | level | source |
| -----------------|-------------|----------|------|-------- | ---- |
| date when the measure is implemented | date when the measure is lifted | textual description of the measure | identifier of the administrative unit | level of the administrative unit (canton, city, federal) | url of the source of this measure |

The data _must_ be stored in *long* and *tidy* format: if multiple measures for the same entities are introduced at the same data, repeated entries must be created.

*unit* should take one of the following values: 
- *federal* for federal level measures
- *canton* for cantonal measures
- *city* for measures taken by municipalities
- *private* for measures taken by businesses, events and other organisations

## |TODO

### General
- add measures for all cantons and federal and city level measures.
- code them according to general categories (Veranstaltungsverbot, ...) according to Art. 40 of the [Epiemiegesetz](https://www.admin.ch/opc/de/classified-compilation/20071012/index.html#a40)

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
- Select one of the missing entities.
- Fork this repository
- Create a pull request and add a separate csv with the data you intend to add. 
- Stick to the date format dd.mm.yyyy
- For Cantons, use their official abreviations, for city their full name.
- Use commas as separator.
- Quote strings containing commas.
- if available, add link to the document where the measures are announced.
- Data in long format: one measure per row. If multiple measures are decided by the same unit at the same time, make multiple entries.
- Save the file in [data](https://github.com/baffelli/covid-2019-measures/tree/master/data).
