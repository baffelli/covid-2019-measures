# Encoding the measures taken against COVID 2019
## Introduction
Here we collect a timeline of all containment and public health measure taken in the course of the covid2019 pandemics. 

## Data format
I started by collecting all the data from cantons and from the federal government. I settled on the current csv format:


| date_implemented | date_lifted | measure | unit | level | source |
| -----------------|-------------|----------|------|-------- | ---- |
| date when the measure is implemented | date when the measure is lifted | textual description of the measure | identifier of the administrative unit | level of the administrative unit (canton, city, federal) | url of the source of this measure |


## Next steps
- add measures for all cantons and federal and city level measures.
- code them according to general categories (Veranstaltungsverbot, ...) according to Art. 40 of the [Epiemiegesetz](https://www.admin.ch/opc/de/classified-compilation/20071012/index.html#a40)

## Missing Entities
- [x] BE
- [ ] TG
- [ ] VS
- [ ] SH
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
- Select one of the missing entities
- Create a pull request and add a separate csv with the data you intend to add. -
- Stick to the date format dd.mm.yyyy
- Use commas as separator 
- Quote strings containing commas
- Data in long format: one measure per row. If multiple measures are decided by the same unit at the same time, make multiple entries.
- save the file in data
