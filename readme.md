# Collecting and encoding the measures taken against the spread of COVID2019
## Contributors
- Simone Baffelli
- [Fabienne Krauer](https://github.com/fkrauer)
- Nicolo Lardelli
## Introduction
Here we collect a timeline of all containment and public health measure taken in Switzerland in the course of the COVID2019 pandemics. This is not of immediate use but we believe it will be very percious for future studies on the effect of different control strategies. 
We know this is boring work, but we are grateful to all contributors even if they only contributed to one or two rows of data.

## Motivation
The federal council has announced the temporary closure of schools and public places non essential to daily life, ordered the cancellation of mass events and banned the gathering of more than 5 persons. These measures follow -and partially replicate at a federal level- similar measures taken earlier by local authorities and other organisations.  These strict measures are considered necessary to slow the spread of the SARS-CoV-2 virus and to mitigate the effects of  COVID-2019, the disease it causes. 


Measuring the effectiveness of these measures is important for multiple reasons. During the emergency, this information helps improve and quickly adapt policies and -more relevant in a political sense- is helpful to convince poplulations that it is necessary to adhere to them and that the policies are effective. Finally, over a longer timespan, these data are of scientific interest for studies in epidemology.



This evaluation rests on three types of data, all of which is actively collected at the moment:

- The first pillar is data on the number of confirmed cases and on the number of performed tests, patients with severe disease progression and number of recovered patients.  This is part of another [challenge](https://db.schoolofdata.ch/project/73) of this hackathon. This data can be considered the *dependent variable* and can be used directly (with the usual caveats regarding specificity, sensitivity, sampling bias etc.) to measure the effect of the measures.
- The second pillar is auxiliary information such as data on [mobility](https://db.schoolofdata.ch/project/66), [air quality](https://db.schoolofdata.ch/project/63), mobile phone location data (eg https://github.com/statistikZH/monitoring_covid19/blob/master/Mobility_GooglePopularTimeGraph.md) and data on [consumer behavior](https://db.schoolofdata.ch/project/62). This information doesn't directly correlate with case data, however it can be used to infer the adhesion of the general population to the imposed measures regardless of their disease status.
- The third pillar -and the main effort spent in this project so far- is the collection of a reliable, machine readable data set on _all_ the measures taken by authorities and organisations to slow the spread of SARS-CoV-2. This data is the independent variable -or regressor- to be used in later modeling attempt.


So far the primary outcome of the project has been a crowdsourced collection of all measures taken to slow down the spread of the virus. The data is stored in this repository.

The repository is open to contribution, contact Simone Baffelli (https://twitter.com/bafe) or Fabienne Krauer (https://twitter.com/FabiKrauer). 

## Data format
To collect the measures, we settled a simple (long) csv format, which can be used worldwide:


| country | unit | date_implemented | date_lifted | measure | level | source | measure_cat| measure_sub_cat |
| ---- | -----------------|-------------|----------|------|-------- | ---- | --- | --- | 
|the ISO  code of the country where the measure is implemented |  identifier of the administrative unit according to ISO_3166-2 | date when the measure is implemented | date when the measure is lifted | textual description of the measure | level of the administrative unit (nation, region, city, private) | url of the source of this measure | main category of the measure | sub category of the measure |

The data _must_ be stored in *long* and *tidy* format: if multiple measures for the same entities are introduced at the same data, repeated entries must be created.

 - *country*: ISO code of the country where the measure applies.

- *unit*: administrative unit. Whenever possible, use the ISO_3166-2 code. For cities, use full name in German, French or Italian. For measures taken by private enterprises or organisations, use their full name.  

- *level* should take one of the following values: 
  * *national* for nation-level measures
  * *regional* for measures taken at the level of regions
  * *city* for measures taken by municipalities
  * *private* for measures taken by businesses, events and other organisations
  
- *date_implemented*: the date when the misure first was implemented

- *date_lifted*: the date when the measure was lifted

- *measure*: the textual description (possibly in _english_) of the measure.

- *measure_cat* and *measure_sub_cat*: main and sub- category of the measure according to the following codebook. If unsure, leave these fields empty. 

- *source*:  paste the URL of the source so that it can be verified

#### Measure categorization
To fill the *measure_cat*  and *measure_sub_cat* columns, we propose the following categorization, which is based on the Swiss Epidemics Act and in agreement with the categorization used by Simom Heß and Patrick Schmidt found [here](https://docs.google.com/spreadsheets/d/1tYfD3vvSEaW3Cq9-UZoDtlKIfaMMVJq8XnV9XJUdK3s/edit#gid=540626239):

| measure_cat                | measure_sub_cat                                                    | note                                                                                                                        | law                                           |
|----------------------------|--------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| case management            | contact tracing                                                    |                                                                                                                             | Swiss Epidemics Act, Art. 15                  |
| case management            | isolation and self-isolation                                       | Isolation at home or in care facility of cases                                                                              | Swiss Epidemics Act, Art. 35b                 |
| case management            | management of dead bodies                                          |                                                                                                                             | Swiss Epidemics Act, Art. 46                  |
| case management            | quarantine and self-quarantine                                     | isolation at home or in care facility of suspected cases or contacts                                                        | Swiss Epidemics Act, Art. 35a                 |
| case management            | testing                                                            |                                                                                                                             |                                               |
| economic                   |                                                                    | Including monetary or fiscal support, suspension of tax claims                                                              |                                               |
| mass gatherings            | ban of events / mass gatherings of > 10 persons                    |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2a              |
| mass gatherings            | ban of events / mass gatherings of > 100 persons                   |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2a              |
| mass gatherings            | ban of events / mass gatherings of > 1000 persons                  |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2a              |
| mass gatherings            | ban of events / mass gatherings of > 5 persons                     |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2a              |
| mass gatherings            | ban of events / mass gatherings of > 50 persons                    |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2a              |
| mass gatherings            | ban of events / mass gatherings of > 500 persons                   |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2a              |
| mass gatherings            | event permit required                                              |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2a              |
| mobility                   | ban of cross-border mobility                                       | No incoming mobility allowed                                                                                                | Swiss Epidemics Act, Art. 41                  |
| mobility                   | restriction of cross-border mobility                               | Incoming mobility allowed for restricted purposes (e.g. work)                                                               | Swiss Epidemics Act, Art. 41                  |
| mobility                   | shelter-in-place order, curfew                                     | Prohibited to leave the house except for essential errands                                                                  |                                               |
| mobility                   | stay-at-home recommendation                                        | Strong recommendation to stay and work from home                                                                            |                                               |
| other                      |                                                                    | Including suspension of elective surgeries or political events, establishment of information hotlines                       |                                               |
| private institution access | closure of private institutions and businesses with close contact  | Including restaurants, bars, clubs, hair dressers, massage and beauty salons                                                | Swiss Epidemics Act, Art. 40, 2b              |
| private institution access | restriction of access to private institutions: restaurants, bars,… | Including restriction on maximum number of people or minimum distance, business hours, restriction on use of infrastructure | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | ban of access to public open areas and parks                       |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2c              |
| public institution access  | ban of access to short- and long-term care facilites               | Including hospitals, nursing homes, rehabilitation centers and disabled homes                                               | Swiss Epidemics Act, Art. 40, 2b, Art. 19, 2d |
| public institution access  | closure of public institutions: day care                           |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | closure of public institutions: museums                            |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | closure of public institutions: public offices and counters        |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | closure of public institutions: schools                            |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | closure of public institutions: universities                       |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | restriction of access to short- and long-term care facilites       | Including hospitals, nursing homes, rehabilitation centers and disabled homes                                               | Swiss Epidemics Act, Art. 40, 2b, Art. 19, 2d |
| recommendations            |                                                                    | Including information campaigns and recommendations for hand washing, respiratory hygiene and physical distancing           |                                               |

## TODO

### General
- [ ] add measures for all cantons and federal and city level measures.
- [ ] code them according to general categories (Veranstaltungsverbot, ...) according to Art. 40 of the [Epiemiegesetz](https://www.admin.ch/opc/de/classified-compilation/20071012/index.html#a40)
- [ ] prepare an interactive visualization of these measures

### Data collected for
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
2. Find the correspoding sheet on the collaborative Google Sheet [here](https://drive.google.com/drive/folders/1qy3yExwzflZJKIOcWvhbbhisaWr5qmO5). If the sheet does not exist, create it.
3. For cantonal level, find the corresponding home page of the cantonal administration where recommendations and orders are published. These are usually published as PDF's under "media announcements / Medienmitteilungen"
3. Extract the information given in these published orders into the Google sheet. Use the language you are most comfortable with
Extract the following information:
- date_implemented: Date of implementation of the measures. Usually this is the date of the publication. If the publication just announces a future measure, do not register it yet as it is not implemented yet. Format is dd.mm.yyyy
- date_lifted: Date when the control measures are lifted or undone. In most cases, you will not know this, so leave the field empty. For actions with a clear time horizon (i.e. School closure), the date_lifted can be added. However, we will have to check this continuously, since these measures are subject to change. Format is dd.mm.yyyy
-  measure: Free text, short description of measures taken. Look for any recommendation or action/orders issued in relation to stopping the transmission. Examples are given below.
- measure_cat: category of measure. These are coded according to measures described in the Federal Pandemic law and according to the recommendations of WHO. If you are unsure about the category, leave the field empty. Use only the categories provided, do not make new categories. 

