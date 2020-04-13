# Collecting and encoding the measures taken against the spread of COVID2019 in Switzerland

## Introduction
Since February 25, 2020 Switzerland is affected by COVID-19. Modelling predictions show that this pandemic will not stop on its own and that stringent migitation strategies are needed. Switzerland has implemented a series of measures both at cantonal and federal level. The aim of this project is to collect and categorize these control measures implemented and provide an updated data set, which can be used for modelling or visualization purposes. Please cite the [DOI](https://doi.org/10.5281/zenodo.3749747) if you use this dataset. 

This project is a collaborative effort by volunteers (see contributors below). The repository is open to contribution, contact Simone Baffelli (https://twitter.com/bafe) or Fabienne Krauer (https://twitter.com/FabiKrauer).  

## Methods

### Data collection
We collect the date/duration and level of the most important measures taken in response to COVID-19 from official cantonal and federal press releases for each Kanton of Switzerland. The most current version is available for download in this repository. 

We consider the following measures:

| measure         | levels                                                                                                                                                                                                  | comment                                                                                                                                                           |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| carefacilities  | 0=no restriction, 1=restricted access, 2=access prohibited                                                                                                                                              | includes hospitals, nursing and disabled homes                                                                                                                    |
| casemanagement  | 0=no, 1=yes                                                                                                                                                                                             | includes testing, isolation, quarantine and triage                                                                                                                |
| daycare         | 0=no restriction, 1=restricted access or closed                                                                                                                                                         | includes Krippe and Hort                                                                                                                                          |
| events          | 0=no restriction, 1=events > 1000 persons banned, 2=events > 500 persons banned, 3=events > 100 persons banned, 4=events > 50 persons banned, 5=events > 10 persons banned, 6=events > 5 persons banned | includes events and mass gatherings of any kind                                                                                                                   |
| stayathome        | 0=no, 1=yes                                                                                                                                                                                             | Switzerland does not have an official "lockdown" policy in the sense of a shelter-in-place order. This category means a "strong recommendation to stay at home".  |
| mobilityint     | 0=no restriction, 1=restriction of cross-border mobility, 2=closing of borders                                                                                                                          |                                                                                                                                                                   |
| publicoffices   | 0=no restriction, 1=closed                                                                                                                                                                              | includes public offices with counters such as tax office or vehicle registration office                                                                           |
| publicplaces    | 0=no restriction, 1=closed                                                                                                                                                                              | includes museums, sports facilities, parks                                                                                                                        |
| publictransport | 0=no restriction, 1=reduced                                                                                                                                                                             |                                                                                                                                                                   |
| recommendations | 0=no, 1=yes                                                                                                                                                                                             | includes information campaigns and general recommendations such as respiratory hygiene and physical distancing                                                    |
| retailgastro    | 0=no restriction, 1=restricted access, 2=closure                                                                                                                                                        | includes all non-essential retail, gastronomy and entertainment places as well as businesses with direct contact (hair dressers, massage,…)                       |
| schools         | 0=no restriction, 1=closed                                                                                                                                                                              | includes primary and secondary school as well as Kindergarten                                                                                                     |
| universities    | 0=no restriction, 1=closed                                                                                                                                                                              |                                                                                                                                                                   |

The data are collected in a Google spreadsheet and updated periodically. The files are available for download in this github with the date indicating the last update. 


## Data usage
You are free to use these data under the CC-BY-NC creative commons license. Please cite this project whenever you use the data. 


## Contributors
- [Simone Baffelli](https://github.com/baffelli)
- [Fabienne Krauer](https://github.com/fkrauer)
- [Nicolo Lardelli](https://www.researchgate.net/profile/Nicolo_Lardelli)
- [Johannes Bracher](https://github.com/jbracher)
- [Maria Bekker-Nielsen Dunbar](https://github.com/mariabnd)
- [Muriel Buri](https://github.com/mrllynn)


## ARCHIVED: Raw initial data collection
Initially, we collected all information about all measures undertaken until 2020-04-06 verbatim in Google spreadsheets and categorized each item according to the categories below. From these raw data, we define the most important measures and aggregated the data set as described above to make it more useful for research. The original raw dataset is still available, but will not be updated.  

| varname          | description                                                                                                                                                                                              | select                                                                                                                                |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| country          |  ISO code of the country where the measure applies                                                                                                                                                       |                                                                                                                                       |
| unit             | administrative unit. Whenever possible, use the ISO_3166-2 code. For cities, use full name in German, French or Italian. For measures taken by private enterprises or organisations, use their full name |                                                                                                                                       |
| date_implemented | date when the measure is implemented                                                                                                                                                                     |                                                                                                                                       |
| date_lifted      | date when the measure is lifted                                                                                                                                                                          |                                                                                                                                       |
| measure          |  textual description of the measure                                                                                                                                                                      |                                                                                                                                       |
| level            | level of the administrative unit                                                                                                                                                                         | cantonal, national, municipality, private                                                                                             |
| measure_cat      | category of measure                                                                                                                                                                                      | case management, economic, mass gatherings, mobility, other, private institutions access, public institutions access, recommendations |
| measure_sub_cat  | subcategory of measure                                                                                                                                                                                   | see below                                                                                                                             |
| source           | URL of the source                                                                                                                                                                                        |                                                                                                                                       |
| entered_by       | initials of who entered the data and set the categories                                                                                                                                                  |                                                                                                                                       |
| reviewed_by      | initials of who reviewed the categories                                                                                                                                                                  |                                                                                                                                       |
The measurements have the following subcategories:

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
| other                      |                                                                    | Including suspension of elective surgeries or political events or reallocation of resources                      |                                               |
| retail_gastro_recreation | ban of access to retail, gastronomy and recreation and businesses with close contact  | Including restaurants, bars, clubs, hair dressers, massage and beauty salons                                                | Swiss Epidemics Act, Art. 40, 2b              |
| retail_gastro_recreation | restriction of access to retail, gastronomy and recreation | Including restriction on maximum number of people or minimum distance, business hours, restriction on use of infrastructure | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | ban of access to public open areas and parks                       |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2c              |
| public institution access  | ban of access to short- and long-term care facilites               | Including hospitals, nursing homes, rehabilitation centers and disabled homes                                               | Swiss Epidemics Act, Art. 40, 2b, Art. 19, 2d |
| public institution access  | closure of day care                           | Includes Kita                                                                                                                            | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | closure of public places (museums, sports facilities, ..)                            |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | closure of public offices and counters        |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | closure of schools                            | Schools including Kindergarten                                                                                                                            | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | closure of universities                       |                                                                                                                             | Swiss Epidemics Act, Art. 40, 2b              |
| public institution access  | restriction of access to short- and long-term care facilites       | Including hospitals, nursing homes, rehabilitation centers and disabled homes                                               | Swiss Epidemics Act, Art. 40, 2b, Art. 19, 2d |
| recommendation_information            |                                                                    | Including information campaigns and recommendations for hand washing, respiratory hygiene and physical distancing, establishment of hotlines           |                         


## Related projects 
- collection of data on the number of confirmed cases and on the number of performed tests, patients with severe disease progression and number of recovered patients.  This is part of another [challenge](https://db.schoolofdata.ch/project/73) of this hackathon. This data can be considered the *dependent variable* and can be used directly (with the usual caveats regarding specificity, sensitivity, sampling bias etc.) to measure the effect of the measures.
- collection of data on [mobility](https://db.schoolofdata.ch/project/66), [air quality](https://db.schoolofdata.ch/project/63), mobile phone location data (eg https://github.com/statistikZH/monitoring_covid19/blob/master/Mobility_GooglePopularTimeGraph.md) and data on [consumer behavior](https://db.schoolofdata.ch/project/62). This information doesn't directly correlate with case data, however it can be used to infer the adhesion of the general population to the imposed measures regardless of their disease status.

