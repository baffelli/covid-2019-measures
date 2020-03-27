# Collecting and encoding the measures taken against the spread of COVID2019
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

The repository is open to contribution, contact Simone Baffelli (https://twitter.com/bafe) or Fabienne Krauer (). 

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
To fill the *measure_cat*  and *measure_sub_cat* columns, we propose the following categorization, which was adapted from the categorization from  Simom Heß and Patrick Schmidt found [here](https://docs.google.com/spreadsheets/d/1tYfD3vvSEaW3Cq9-UZoDtlKIfaMMVJq8XnV9XJUdK3s/edit#gid=540626239):

| example | category | law article |
| ------- | -------- | ------------ |
| Kontake von infiszierten Personen werden auffindig gemacht und benachrichtigt |	contact tracing |	Swiss Epidemics Act	Art. 15 |
|Personen mit Kontakt zu Erkrankten oder Verdachsfälle müssen in Quarantäne zu Hause oder woanders |	quarantine and self-quarantine |	Swiss Epidemics Act	Art. 35a|
|Erkrankte Personen müssen zu Hause bleiben oder im Spital isoliert werden	| isolation and self-isolation|	Swiss Epidemics Act	Art. 35b|
|Veranstaltungen mit mehr als 1000 Personen werden untersagt oder sind bewilligungspflichtig |	restriction of events	| Swiss Epidemics Act	Art. 40, 2a|
|Jegliche Veranstaltungen werden untersagt|	ban of events|	Swiss Epidemics Act	Art. 40, 2a|
|Schulschliessung	|school closure	|Swiss Epidemics Act	Art. 40, 2b|
|Verkürzte Öffnungszeiten von Ämtern, maximal Kapazitäten in Läden werden festelegt|	restriction of selected private and public institutions|	Swiss Epidemics Act	Art. 40, 2b|
|Betriebe wie Bars, Restaurants, Kino, Museen werden geschlossen, Ämter werden geschlossen|	closure of selected private and public institutions|	Swiss Epidemics Act	Art. 40, 2b|
|Betreten der Seepromenade ist untersagt, wird gesperrt|	ban of access to private or public buildings or areas|	Swiss Epidemics Act	Art. 40, 2c|
|Empfehlung zum häufigen Händewaschen, in Ellbogen husten|	recommendations: hygiene|	WHO	|
|Bevölkerung wird aufgefordert Abstand zu halten, Massenansammlungen jeder Art zu meiden (beim Einkaufen, ÖV usw.)|	recommendations: physical distancing|	WHO	|
|Besuche im Altersheim, Pflegeheim, Behindertenheim, Spital werden verkürzt|	restriction of access to health and long-term care facilites|	Swiss Epidemics Act	Art. 40, 2b, Art. 19, 2d|
|Besuche im Altersheim, Pflegeheim, Behindertenheim, Spital sind untersagt|	ban of access to health and long-term care facilites|	Swiss Epidemics Act	Art. 40, 2b, Art. 19, 2d|
|Einreise aus dem Ausland nur für Personen mit Arbeitsstelle in der Schweiz|	restriction of international mobility|	Swiss Epidemics Act	Art. 41|
|Einreise aus dem Ausland komplett untersagt mit Ausnahme von Schweizer Bürgern|	ban of international mobility|	Swiss Epidemics Act	Art. 41|
|Verstorbene müssen speziell behandelt werden (transport, vorbereitung)|	management of dead bodies|	Swiss Epidemics Act	Art. 46|
|Erkrankte oder Verdachtsfälle werden getestet, Einrichtung von Testzentren|	testing	|Swiss Epidemics Act	Art. 36|
|Operationen und Eingriffe, welche keine Notfälle sind, werden verschoben|suspension of elective surgery|	?|	
|Wahlen, Abstimmungen, Parlament oder Ratsmeetings werden verschoben|	suspension of political events	|?	|
		
* *ban of group gatherings*: Private gatherings of groups of a certain size are forbidden. Use the size as *measure_sub_cat* as follows:
  * 0-5
  * 5-10
  * 10-50
  * 50-100
  * 100-1000
  * > 1000
* *restriction of international mobility*: international travel is significantly restricted. Use the following sub categories in *measure_sub_cat*:
  * *recommended*: travel from or to certain regions is discouraged but _not_ forbidden.
  * *partial*: only some border crossings are closed, entries are restricted only for people from countries considered at risk
  * *total*: all border crossing are closed. No entry into country
* *restriction of internal mobility*. Use the following sub categories in *measure_sub_cat*:
  * *partial*: people cannot enter or leave areas considered at risk unless for important reasons
  * *total*: all residents must stay inside of their municipality or region unless for urgent reasons (medical, family etc)
  
* *reduction of public transport*: public transport service are reduced. Here again use the following sub categories:
  * *partial*
  * total
* *event ban*: Public events of a certain size are cancelled by the government. (Excludes: Volontary suspension of sport leagues, etc)	Use the following sub categories in *measure_sub_cat*:
  * 0-5
  * 5-10
  * 10-50
  * 50-100
  * 100-1000
  * > 1000
* *cluster tracking and containment*: Government interventions to track and isolate contacts of known patients.	Use following sub categories in *measure_sub_cat*:
  * *contact tracing*: active contact tracing performed by authorities
  * *mandatory isolation*: postive cases are isolated in ad-hoch structures
  * *voluntary isolation*: positve cases or person who came in contact with them are advised to self-isolate
* *curfew*: with the following sub-categories in  *measure_sub_cat*:		
  * *Mild*: Banning public private live		
  * *Lockdown*: Closure of All Non-Essential Public Life, Only movement for shopping, medical and work reasons
  * *Strict*: Any movement outside is banned	
* *business closure*: all-non necessry business activities are closed. Use following *measure_sub_cat*:
	* *partial*
	* *total*
* *restaurant/bar closure*: Bars, Restaurants, Clubs, Hotels are closed. Use the following sub categories in in *measure_sub_cat* if necessary:
  * partial: restaurants and bar can stay open with reduced nuber of customers
  * total: all restaurants and bars must close (with exceptions for hospital canteens and similar institutions)
* *daycare closure*: Daycare is suspended (for children of "normal people", daycare for health workers etc. may still be offered). Leave the *measure_sub_cat* field	 blank		
* *school closure*: Schools are suspended. Leave the *measure_sub_cat*	 blank		
* *university closure*: 	In-person univeristy classes are suspended. Leave the *measure_sub_cat*	 blank.
* *social distancing*:	The government explicitly encourages social distancing. Leave the *measure_sub_cat*	 blank.					
* Public Talk of Central Govt Figure:	A central government figure (president, queen, etc) publically addresses the nation. Leave the *measure_sub_cat*	 blank		
* *hygiene measures*: specific hygiene measures are ordered. Examples: increased hand washing, alchool dispensers in public places, mandatory mask in public locations.



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
2. Find the correspoding sheet on the collaborative Google Sheet [here](https://drive.google.com/drive/folders/1qy3yExwzflZJKIOcWvhbbhisaWr5qmO5). If the sheet does not exist, create it.
3. For cantonal level, find the corresponding home page of the cantonal administration where recommendations and orders are published. These are usually published as PDF's under "media announcements / Medienmitteilungen"
3. Extract the information given in these published orders into the Google sheet. Use the language you are most comfortable with
Extract the following information:
- date_implemented: Date of implementation of the measures. Usually this is the date of the publication. If the publication just announces a future measure, do not register it yet as it is not implemented yet. Format is dd.mm.yyyy
- date_lifted: Date when the control measures are lifted or undone. In most cases, you will not know this, so leave the field empty. For actions with a clear time horizon (i.e. School closure), the date_lifted can be added. However, we will have to check this continuously, since these measures are subject to change. Format is dd.mm.yyyy
-  measure: Free text, short description of measures taken. Look for any recommendation or action/orders issued in relation to stopping the transmission. Examples are given below.
- measure_cat: category of measure. These are coded according to measures described in the Federal Pandemic law and according to the recommendations of WHO. If you are unsure about the category, leave the field empty. Use only the categories provided, do not make new categories. 

