# Encoding the measures taken against COVID 2019

## Data format
I started by collecting all the data from the canton of Ticino. I settled on the current csv format:


| date_implemented | date_lifted | measure | unit | level | source |
| -----------------|-------------|----------|------|-------- | ---- |
| date when the measure is implemented | date when the measure is lifted | textual description of the measure | identifier of the administrative unit | level of the administrative unit (canton, city, federal) | url of the source of this measure |


## Next steps
- add measures for all cantons and federal and city level measures.
- code them according to general categories (Veranstaltungsverbot, ...) according to Art. 40 of the [Epiemiegesetzt](https://www.admin.ch/opc/de/classified-compilation/20071012/index.html#a40)
