---
title: Uitgangspunten integratie NEN 2767-4 & IMBOR
---

**Status:** VOORSTEL 
{: .notice--warning}

Dit document beschrijft de uitgangspunten voor een werkbare, herleidbare methode om concepten uit NEN 2767-4 op te nemen in IMBOR, en te verankeren in de modelleerpatronen van NEN 2660-2:2022.

**Doelgroep:** de werkgroep die de methodiek vaststelt, en daarna de inhoudelijke werkgroepen die de methode per concept toepassen.

---

## 1. Projectomschrijving

Het project dat door NEN & CROW samen ondernomen wordt bestaat uit twee samenhangende doelen die in nauwe afstemming worden opgepakt:
  1. Integratie van de klassen (objecttypen) uit IMBOR en NEN 2767-4
  2. Een typische decompositie voor conditiemeting in IMBOR, herzien volgens NEN 2660

### Integratie van de klassen (objecttypen) uit IMBOR en NEN 2767-4
De klassen uit beide standaarden worden veel gebruikt in beheer en assetmanagement. Ze overlappen sterk, maar hun definities en benamingen sluiten niet op elkaar aan. De integratie moet leiden tot één eenduidige set klassen die in de hele sector is afgestemd. Waar volledige integratie niet mogelijk is, worden de klassen op elkaar afgestemd. De mapping kan ook laten zien dat klassen uit NEN 2767-4 geen toegevoegde waarde meer hebben. Zulke klassen kunnen vervallen of worden vervangen door andere of nieuwe klassen. Bij het mappen wordt per klasse ook vastgesteld of die functioneel is (wat moet het doen?) of technisch (waaruit bestaat het?). Volgens NEN 2660-2 sluiten deze twee elkaar uit. Ze mogen daarom niet in dezelfde specialisatiehiërarchie terechtkomen.

### Een typische decompositie voor conditiemeting in IMBOR, herzien volgens NEN 2660
De klassen in IMBOR krijgen een typische decompositie die gebaseerd is op NEN 2767-4. Deze decompositie is bedoeld voor conditiemeting binnen assetmanagement.Bij het opnemen in IMBOR wordt de bestaande structuur van NEN 2767-4 bijgewerkt volgens de inzichten van NEN 2660. De driedeling Beheerobject–Element–Bouwdeel uit NEN 2767-1 blijft daarbij behouden als indeling in niveaus. De structuur bevat wel weeffouten in de modellering. Die worden gecorrigeerd:
- Functioneel en technisch door elkaar. In NEN 2767-4 is een element doorgaans functioneel gedefinieerd, op basis van de verlangde functie. Een bouwdeel is doorgaans technisch gedefinieerd, naar samenstelling of constructiewijze. Volgens NEN 2660-2 is de overgang van element naar bouwdeel daarom eigenlijk geen 'hasPart'-relatie. Het is een implementatierelatie (isImplementedBy): het element wordt geïmplementeerd door één of meer bouwdelen.
- Specialisaties gemodelleerd als decompositie. Veel 'decomposities' zijn in werkelijkheid specialisaties. Een voorbeeld is "Kabel hasPart Signaalkabel". Dat is een specialisatierelatie en geen 'onderdeel van'-relatie.

> De hasPart-relatie zelf is in NEN 2660-2 eenduidig. Welke decompositie je maakt, hangt wel af van het **doel** en het **perspectief**. Daarom wordt de typische decompositie in IMBOR uitdrukkelijk vastgelegd als decompositie voor conditiemeting. Sommige partijen kiezen ervoor om middels deze decompositie ook hun areaal in te delen. Zo ondersteunt ze ook het proces van instandhouding.

### Samenhang en werkwijze

De twee onderdelen hangen direct met elkaar samen. De inhoudelijke werkgroepen beoordelen de herziene decompositie en de relatie naar IMBOR. Daarbij kan bijvoorbeeld blijken dat een klasse die nu als element is opgenomen, eigenlijk technisch van aard is en dus op het niveau van bouwdeel thuishoort. Het omgekeerde kan ook.

---

## 2. Doelstelling

Met dit project streven we naar:

*Één eenduidige set klassen in IMBOR, waar mogelijk geïntegreerd met NEN 2767-4 en anders daarop afgestemd; een typische decompositie voor conditiemeting binnen assetmanagement, opgenomen in IMBOR, gebaseerd op NEN 2767-4 en gemodelleerd volgens NEN 2660.*

Op deze manier kunnen we bij de uitwisseling van assetgegevens voor conditiemeting zo veel mogelijk dezelfde klassen en dezelfde structuur gebruiken. 

**Functionele decompositie (buiten scope)**
In de markt is ook behoefte aan andere decomposities dan die voor conditiemeting, bijvoorbeeld voor Systems Engineering (SE), voor het ontwerpen en bouwen van assets en voor beslissingen over amoveren. Daarvoor is een diepere functionele decompositie nodig. Een functionele decompositie die geschikt is voor SE bestaat nog niet. Ze heeft waarschijnlijk meer dan drie lagen en verschilt per asset of organisatie.
Via de elementen bevat IMBOR straks al een beperkte functionele laag voor conditiemeting. De diepere functionele decompositie voor SE nemen we niet op in IMBOR. Die kan wel worden vastgelegd in een aparte ontologie die de klassen en hun definities uit IMBOR overneemt.
In zo'n ontologie worden de kenmerken uit NEN 2767 gekoppeld aan functies. De kernvraag is: welke functie komt in gevaar als een conditie niet voldoet? Roest is bijvoorbeeld pas een probleem als het 'afdragen van krachten' in gevaar komt.
Dit valt buiten de scope van dit project. Het resultaat van dit project, eenduidige klassen en een correct gemodelleerde decompositie, kan later wel dienen als basis voor zo'n vervolgstap.
{: .notice}

---

## 3. Uitgangspunten

**U1: Opnemen, niet per se als klasse.** De concepten uit NEN 2767-4 worden zoveel mogelijk opgenomen in IMBOR. "Opnemen" kent meerdere vormen: twee concepten die **samenvallen** (integreren tot één concept), een **subklasse**, een **verschijningsvorm/domeinwaarde** op een instantieerbare klasse, een **deel-rol** (`heeftDeel`-constraint), of een **materiaal** in de materie-tak. De eis is dat elk in-scope concept een expliciete, herleidbare representatie of mapping krijgt, niet dat elk concept een eigen klasse wordt.

**U2: De assen zijn disjunct (NEN 2660-2).** De asparen `ReeelObject`/`RuimtelijkGebied` (§6.2), functioneel/technisch (§6.4) en gepland/gerealiseerd (§6.5) zijn in de NEN 2660-ontologie vastgelegd als `owl:disjointWith`. Een klasse kan _niet aan beide zijden van een as hangen_. Waar bronconcepten op verschillende aszijden vallen, is daarom een **relatie** nodig, geen subklasse.

**U3: Classificeren op een as is optioneel (NEN 2660-2 §6.6).** Is een dimensie niet relevant of niet eenduidig te bepalen, dan volstaat het generieke concept (`FysiekObject` resp. `Entiteit`) zonder keuze. Forceer geen keuze waar die niets toevoegt, dat levert schijnprecisie op. _Noteer een onbepaalde as als open vraag._

**U4: Betekenis vóór representatie.** Bepaal eerst wát een concept betekent en hoe het zich tot een IMBOR-concept verhoudt; kies pas daarna hoe je het modelleert. Zo voorkom je dat een modelleergemak (bv. "geen eigen attributen") een betekenisoordeel vervangt.

**Terminologie.** We gebruiken *(bron)concept* als neutrale verzamelterm voor een te classificeren eenheid uit NEN 2767-4, zolang nog niet vaststaat hóe die in IMBOR landt (klasse, subklasse, domeinwaarde, deel-rol of materiaal). Waar een `skos:Concept` wordt bedoeld, staat dat expliciet.
{: .notice--info}

---

## 4. Het classificatieproces in overzicht

De regels bouwen op elkaar voort. De redeneervolgorde is **{Stap 0, a, b} → c → d/e**:

| Stap       | Vraag                                        | Resultaat                                                        |
|------------|----------------------------------------------|------------------------------------------------------------------|
| **0** (§5) | Wat voor soort concept is dit?                | objecttype / deel-rol / materiaal / waarde                       |
| **a** (§6) | Ruimtelijk of reëel?                         | aszijde (of onbepaald)                                           |
| **b** (§7) | Functioneel of technisch?                    | aszijde (of onbepaald)                                           |
| **c** (§8) | Welke betekenisrelatie, welke representatie? | samenvallen / subklasse / domeinwaarde / relatie / nieuwe klasse |
| **d** (§9) | Welke naam?                                  | prefLabel, altLabel, notation                                    |
| **e** (§10) | Welke definitie?                             | geharmoniseerde `skos:definition`                                |

**Stap 0 bepaalt óf een concept überhaupt de assen en regel c in gaat.** De assen a en b zijn _onafhankelijke (orthogonale)_ dimensies; samen vormen ze het profiel waarmee regel c beslist of een subklasse is toegestaan.

---

## 5. Stap 0: Wat voor soort concept is dit?

Bepaal eerst welk van vier soorten een NEN 2767-4-concept is. Dit scheidt specialisatie (is-een-specialisatie) van decompositie (deel-van). Dit zijn de twee dimensies die NEN 2767-4 nu door elkaar haalt.

1. **Zelfstandig objecttype**: bestaat op zichzelf en is te classificeren (brug, bord, boom). → door naar a, b, c.
2. **Deel-rol / positie in een geheel**: bestaat vooral *als deel van* iets anders ("laag ván een verharding", "deel ván een landhoofd"); vaak herkenbaar aan een definitie die begint met "deel van …". → modelleer als getypeerde `heeftDeel`-constraint op het geheel, niet als losse is-een-klasse.
3. **Materiaal / materie**: een stof, geen object (asfaltbeton, zand, staal). → hoort in de materie-tak (NEN 2660-2 §6.3: `HomogeenMengsel`, `Bouwstof`).
4. **Waarde van een eigenschap**: onderscheidt zich alleen door de waarde van één kenmerk. → domeinwaarde (regel c, uitkomst 5).

> Veel concepten zijn kandidaat voor meerdere categorieën (een deel-rol ís vaak ook een objecttype). Beslissende vraag: heeft het concept **zelfstandige betekenis buiten het geheel**? Zo ja → objecttype (1) met daarnaast een deel-relatie; zo nee → puur deel-rol (2). Leg de keuze vast.

### Toets: is een bestaande `hasPart` eigenlijk een specialisatie?

Een van de weeffouten in NEN 2767-4 is dat **specialisaties als decompositie zijn gemodelleerd**. Toets daarom bij elke bestaande `hasPart`-relatie uit de bron of het werkelijk een deel-geheel-relatie is, of eigenlijk een is-een-relatie.

- *Toets:* vul in "X is een **onderdeel van** Y" versus "X is een **soort** Y". Een `Signaalkabel` is een *soort* `Kabel`, geen *onderdeel van* een kabel → dit is een **specialisatie** (`rdfs:subClassOf`), geen `heeftDeel`.
- Gevolg: zo'n relatie wordt gecorrigeerd naar een subklasse-relatie en het concept gaat als objecttype (categorie 1) door naar a, b, c. Het blijft dus *niet* staan als deel-rol.

Dit is de tegenhanger van categorie 2: daar herken je een echt deel dat ten onrechte een eigen is-een-klasse zou krijgen; hier herken je een echte specialisatie die ten onrechte als deel is gemodelleerd.

---

## 6. Regel a: Discreet of ruimtelijk?

### Criterium
Classificeer een objecttype op de as **ruimtelijk vs. reëel** (NEN 2660-2 §6.2):

- **Reëel object** = tastbaar (massa/materiaal, aan te raken). Binnen reëel: `DiscreetObject` (vormvast; het normale geval voor beheerobjecten) vs. `HoeveelheidBulkmaterie` (niet-vormvast).
  - *Toets:* "Kan ik het aanraken en heeft het een vaste vorm?" → ja = `DiscreetObject`.
- **Ruimtelijk gebied** = niet-direct tastbaar, gedefinieerd door begrenzing/inhoud (bv. rijstrook, profiel van vrije ruimte, een ruimte in een gebouw).
  - *Toets:* "Is het een afgebakende ruimte/zone zonder eigen materiaal?" → ja = `RuimtelijkGebied`.

Veel inspecteerbare onderdelen zijn een tastbaar `DiscreetObject`, maar "inspecteerbaar" is géén bewijs van discreetheid (ook bulk of ruimte is inspecteerbaar). Beoordeel op vormvastheid/tastbaarheid, niet op inspecteerbaarheid. Ruimtelijke gebieden komen vooral op aan de netwerk-/wegindelingskant (wegvak, rijstrook).

### a-i: Relatie in plaats van subklasse
Ruimtelijk en reëel zijn `owl:disjointWith` (U2): een ruimtelijk gebied is nooit een subklasse van een discreet object (of andersom). Valt het bronconcept tastbaar maar het IMBOR-concept ruimtelijk (of omgekeerd), leg dan een relatie (exacte NEN 2660-2-predicaten, Engelse term uit bijlage A tussen haakjes):

- **`isBegrensdDoor`** (`isBoundBy`): een `RuimtelijkGebied` wordt begrensd door een reëel object. Dit is de koppeling ruimte↔object. *Niet verwarren* met `heeftBegrenzing` (`hasBoundary`), dat naar een **geometrische** entiteit wijst.
- **`bevat`** (`contains`): een `RuimtelijkGebied` bevat de reële objecten die zich erin bevinden.

Twee kanttekeningen: (1) een as-conflict betekent niet automatisch dat één van deze relaties geldt; eerst betekent het dat subklasse is uitgesloten; welke relatie past vergt eigen analyse. (2) Ook bij een relatie krijgt het bronconcept nog een eigen plaats in de taxonomie aan zijn eigen aszijde.

### a-ii: Fallback bij een onbepaalde as
Laat de brondefinitie beide zijden toe, plaats het concept dan onder het generieke `FysiekObject` zonder as-keuze (U3) en noteer de onbepaalde as als open vraag. Forceer geen keuze.

### Onderbouwing
NEN 2660-2 §6.2, uitgewerkt in NPR 4660:2026 §6 (praktijkvoorbeeld wegverharding): de weg wordt vanuit **twee invalshoeken naast elkaar** gemodelleerd: ruimtelijk (schaalniveaus Wegment → … → Wegvak → Rijstrook als subtype van `RuimtelijkGebied`, via `heeftDeel`; bepaalt op welk niveau onderhoud plaatsvindt) en reëel (`Wegconstructie` als verzameling `DiscreetObject` + `Materie`, tot de `Uitvoeringseenheid`, het punt waar niet-vormvaste `HoeveelheidBulkmaterie` een vormvast `DiscreetObject` wordt). De wegbeheerder kijkt ruimtelijk, de wegenbouwer constructief; de twee worden door `isBegrensdDoor`/raakvlak gekoppeld, niet door subklasse.

### Voorbeeld
**Onderlaag** (NEN 2175) is tastbaar en vormvast → `DiscreetObject`; het IMBOR-concept `Constructielaag` is eveneens discreet → zelfde aszijde, geen as-conflict (de wrijving zit bij regel c). Ter contrast is de IMBOR-klasse `Wegas`/`Rijbaan` ruimtelijk; zou een reëel bronconcept daartegenaan moeten, dan is `isBegrensdDoor` het patroon, geen subklasse.

---

## 7. Regel b: Functioneel of technisch?

### Criterium
Classificeer op de as **functioneel vs. technisch** (NEN 2660-2 §6.4):

- **Functionele entiteit** ("blackbox") = wat doet het, welke functie vervult het. Herkenbaar aan naamgeving op `-systeem`, `-voorziening`, `-faciliteit`, `-ing`, en aan een **rolgebonden** typering (tijd-/plaatsafhankelijk: iets *speelt* de rol).
- **Technische entiteit** ("whitebox") = hoe is het gemaakt/opgebouwd/gematerialiseerd. Herkenbaar aan naamgeving op `-werk`, `-constructie`, `-installatie`, en aan een **invariante** typering (tijd-/plaatsonafhankelijk: het *is* het).
  - *Toets:* "Beschrijf ik wat het moet dóén (functie), of waarvan het gemaakt is / hoe het is uitgevoerd (constructie)?"

De huidige NEN 2767-4 mengt functioneel en technisch door elkaar (NEN 2660-2 §6.4 waarschuwt dat bestaande normen dit vaak onterecht in één taxonomie doen). Deze regel is de correctie: classificeer elk concept schoon als functioneel óf technisch.

**Twee betekenissen van "functioneel" die niet verward mogen worden:**
- *Functionele entiteit* (de as b): de blackbox-beschouwing van een objecttype. Dit is wat je per concept classificeert.
- *Functionele rol / schaalniveau*: NEN 2660-2 §6.4 noemt de decompositieniveaus beheerobject/element/bouwdeel/product "typisch functionele rollen" (iets *speelt de rol van* element binnen een geheel). Dit gaat over de laag-indeling, niet over de as-classificatie van een afzonderlijk concept.

### b-i: Relatie in plaats van subklasse
Functioneel en technisch zijn `owl:disjointWith` (U2): een functionele entiteit kan geen subklasse van een technische zijn (of omgekeerd); dat levert een lege klasse op. Valt het bronconcept technisch en het IMBOR-concept functioneel (of omgekeerd), gebruik dan:

- **functioneel object `isGeimplementeerdDoor` (`isImplementedBy`) technisch object**: het technische is "een oplossing voor" het functionele; er kunnen meerdere oplossingen zijn (FUTS / "hamburgermodel"). Richting: de functionele entiteit wordt geïmplementeerd dóór de technische.

Een invariante 1-op-1-rol modelleer je met `isGeimplementeerdDoor` (eventueel cardinaliteit 1), **niet** met een subklasse: zolang de superklassen disjunct zijn, is een subklasse dwars over de as inconsistent.

### Let op bij de NEN-niveaus
Een "bouwdeel" is in NEN 2767-4 per definitie **technisch** omschreven (naar samenstelling/constructiewijze), een "element" juist **functioneel** (naar verlangde functie). De NEN-koppeling "element bestaat uit bouwdeel" steekt dus de functioneel/technisch-as over; in NEN 2660-termen hoort dat een `isGeimplementeerdDoor`-relatie te zijn, geen `heeftDeel`. Juist dáár ontstaat de wrijving die b-i adresseert. Dit is precies de weeffout-correctie uit §1: de driedeling Beheerobject–Element–Bouwdeel blijft behouden, maar de overgang element→bouwdeel wordt als implementatierelatie gemodelleerd.

### Onderbouwing
NEN 2660-2 §6.4 (blackbox/whitebox, `owl:disjointWith`, FUTS, `isGeimplementeerdDoor`/`isImplementedBy`).

### Voorbeeld
**Landhoofd** (NEN 1326): NEN definieert het deels functioneel ("*zorgt voor* het dragen … en het keren van het grondlichaam", werkwoorden = functie), IMBOR deels technisch/topologisch ("ondersteuningsconstructie ter plaatse van de overgang"). Vatten beide zijden het op als technisch `Kunstwerkdeel`, dan is samenvallen mogelijk en worden de functies "dragen" en "keren" als expliciete `voertUit`-relaties vastgelegd (§10, e-i), niet in de klassehiërarchie. Blijkt de NEN-kant eigenlijk een functioneel *element* en de IMBOR-kant een technische klasse, dan is samenvallen verboden (disjunct) en is `isGeimplementeerdDoor` nodig. De aszijde van **beide** bronnen moet dus expliciet worden vastgesteld voordat "samenvallen" geldig is.

---

## 8. Regel c: Betekenisrelatie en representatie

De kernvraag bij het opnemen van een zelfstandig objecttype (stap 0, categorie 1). Beslis in **twee lagen** (U4): eerst de betekenisrelatie, dan de representatie.

### Laag 1: Betekenisrelatie
Bepaal de relatie tot het dichtstbijzijnde IMBOR-concept op basis van **instance-inclusie** (welke dingen vallen eronder), niet op basis van attributen. Leg vast met een SKOS/SSSOM-mappingpredicaat:

| Relatie | Predicaat | Betekenis |
|---|---|---|
| Identiek | `skos:exactMatch` | elke A is een B én omgekeerd |
| NEN smaller | `skos:narrowMatch` | elke NEN-A is een IMBOR-B, niet omgekeerd |
| NEN breder | `skos:broadMatch` | elke IMBOR-B is een NEN-A, niet omgekeerd |
| Partieel overlappend | `skos:closeMatch` / `relatedMatch` | overlap, geen van beide bevat de ander |
| Geen tegenhanger | n.v.t. | concept ontbreekt aan de IMBOR-kant |

### Laag 2: Representatiekeuze
Kies op basis van laag 1 én de assen (a, b):

1. **`exactMatch` → samenvallen** (één concept). Integreer tot één IMBOR-concept; harmoniseer naam/definitie (§9, §10). *Toets:* zou een beheerder beide als exact hetzelfde object registreren?
2. **`narrowMatch` + eigen onderscheid → subklasse** onder het IMBOR-concept.
3. **`broadMatch` → IMBOR-concept(pen) worden subklasse van het bronconcept**, of er is een nieuwe abstracte superklasse nodig. (Niet: bronconcept onder IMBOR persen.)
4. **Partieel/overlappend → geen is-een-relatie**; leg een associatieve relatie of herverdeel/splits de concepten. Forceer geen subklasse.
5. **Onderscheid is enkel een attribuutwaarde → verschijningsvorm/domeinwaarde** (met behoud van instance-identiteit, zie onder).
6. **Geen tegenhanger → nieuwe klasse** (onder welke ouder, en wie beslist → §11).
7. **As-conflict (a/b) → relatie** `isBegrensdDoor` resp. `isGeimplementeerdDoor` (a-i, b-i).
8. **Geen toegevoegde waarde → vervalt.** Voegt het bronconcept niets toe aan IMBOR (het valt samen met een bestaand concept zonder eigen betekenis, attributen, relaties of constraints, of het is in de praktijk overbodig), dan krijgt het **geen eigen representatie** in IMBOR. Leg de NEN-code dan als `skos:notation`/`skos:exactMatch` vast bij het IMBOR-concept waarin het opgaat (traceerbaarheid), en markeer het bronconcept als vervallen met de reden. Dit is het geval dat de inleiding noemt: een NEN 2767-4-klasse die kan vervallen of worden vervangen.

**Verbreed subklasse-criterium.** Een subklasse is gerechtvaardigd als het bronconcept eigen **attributen, relaties óf SHACL-constraints** toevoegt. Dat laatste is cruciaal voor NEN 2767: concepten onderscheiden zich daar vaak door **beperkingen** (welke materialen zijn toegestaan → welke gebreken van toepassing → welke delen toegestaan), niet door nieuwe attributen. "Geen eigen attributen" is dus géén voldoende reden om tot domeinwaarde te degraderen.

**Instance-identiteit bij domeinwaarde.** Een concept als domeinwaarde modelleren mag alleen als de individuele identiteit behouden blijft waar die nodig is. Een NEN-bouwdeel is per definitie het niveau waaraan gebreken, conditiescore en onderhoudshistorie hangen; dat vereist een **adresseerbare instantie**. De juiste constructie is: een instantie van een instantieerbare klasse (bv. `Constructielaag`) mét een classificerende domeinwaarde (bv. `constructielaagsoort = onderlaag`); dit is §6.11-patroon 1 (type-instantie), niet "geen klasse". Een kale attribuutwaarde op het geheel, zónder eigen instantie, kan geen conditiescore dragen en is dan ongeschikt.

### Onderbouwing
NEN 2660-2 §6.11 (Typen) geeft drie onderling converteerbare patronen om type/waarde te modelleren: (1) relatie naar een type-instantie, (2) subklasse met een beperking, (3) "punning". Het is een **pragmatische richtlijn**, geen harde regel: subklassen zijn hanteerbaar bij vaste opsommingswaarden maar leiden tot subklasse-explosie als het onderscheid eigenlijk een waarde is; dan is een enumeratietype/domeinwaarde passender (`nen2660:EnumerationType`). De instance-inclusie-toets voor subklassen volgt uit de OWL-semantiek (subklasse = deelverzameling van instanties); attribuut-overerving is het *gevolg* van een correcte hiërarchie, niet het criterium.

### Voorbeeld
**Onderlaag** (NEN 2175): betekenisrelatie met `Constructielaag` = `narrowMatch` (een onderlaag ís een constructielaag), maar het onderscheidt zich alleen door **laagpositie**: een waarde. → **domeinwaarde** `constructielaagsoort = onderlaag` op een **instantie van `Constructielaag`**, die het adresseerbare inspectie-/conditiescore-subject blijft. Ter contrast **Verkeersbord** (NEN 1586): betekenisrelatie met `imbor:Verkeersbord` = `exactMatch`; het heeft eigen attributen (bordcode, reflectieklasse, bordafmeting) → een echte klasse → **samenvallen**.

---

## 9. Regel d: Eenduidige namen

### Criterium
Volg de naamgevingsconventies van NEN 2660-2 §8.4, aangevuld met IMBOR-praktijk:

- **Betekenisvrije identificatie, betekenisvol label.** IMBOR identificeert concepten met een **UUID** (`imbor:` + UUID), niet met de naam. De naam is een label (`skos:prefLabel`), niet de sleutel. Homoniemen (zelfde naam, andere betekenis) kunnen náást elkaar bestaan; een naam mag veranderen zonder dat de identiteit wijzigt. *Let op:* een stabiele UUID maakt hernoemen veilig, maar **semantische wijzigingen niet**; verschuift de betekenis, dan hoort er een nieuw concept te komen, geen stil hergebruik van de UUID.
- **Eén uniek voorkeurslabel per concept** (`skos:prefLabel`). De NEN-term wordt alleen `skos:altLabel` **als die hetzelfde concept aanduidt** (bij `exactMatch`); bij een smaller/breder/overlappend concept is de NEN-term geen synoniem. Voeg nooit dezelfde taal-literal toe als zowel `prefLabel` als `altLabel` (die zijn in SKOS disjunct).
- **NEN-code als `skos:notation` met scheme-datatype**, bv. `"1326"^^nen2767:Code`, zodat NEN-codes niet te verwarren zijn met codes uit andere schema's. Bewaar scheme- en versiecontext, zeker als meerdere bronconcepten samenvallen.
  - *Waar landt de notation:* IMBOR scheidt de **Vocabulaire** (SKOS-concepten) van de **Kern** (klassen/shapes). Leg vast of `altLabel`/`notation` op het `skos:Concept`, op de klasse, of op beide komen. Identificeert een NEN-code eigenlijk een **koppeltabel-rij** (ouder+kind-paar) i.p.v. een zelfstandig concept, dan hoort de code niet als notation op een klasse; toets dit per code (stap 0).
- **Schrijfwijze (§8.4):** klasse-/objecttypenamen in CamelCase met hoofdletter; attribuut- en relatienamen met kleine letter (camelCase).
- **Enkelvoud**, behalve bij groepsaanduidingen.
- **Naamgeving als signaal, niet als bewijs.** De `-ing`/`-constructie`-heuristiek (regel b) helpt classificeren maar mag die classificatie nooit overrulen. Een naam die "constructie" zegt terwijl het functioneel is gemodelleerd (of omgekeerd) is een signaal om de classificatie te heroverwegen.
- **Geen twee concepten met hetzelfde voorkeurslabel.** Bij een echte naamsbotsing (homoniem, bv. "Dek") disambigueren in het label (context tussen haakjes) of met een `skos:scopeNote`, niet in de UUID.

### Onderbouwing
NEN 2660-2 §8.4 (betekenisvolle namen vs. betekenisvrije codes; CamelCase/camelCase; enkelvoud) en §8.5 (annotatiebinding). SKOS: `prefLabel`/`altLabel` zijn disjunct; `notation` gebruikt bij voorkeur een scheme-specifiek datatype.

### Voorbeeld
**Fauna-uittreedplaats** (IMBOR, met koppelteken) vs. **Fauna uittreedplaats** (NEN-element 131, zonder): bij `exactMatch` één `skos:prefLabel` (IMBOR-schrijfwijze), de NEN-schrijfwijze als `skos:altLabel`, NEN-code als `"131"^^nen2767:Code`. **Leuning** (NEN 2192 ≈ IMBOR, woordelijk identiek) toont dat de naam gelijk kan zijn terwijl de machineleesbare koppeling (UUID + notation) nog gelegd moet worden.

---

## 10. Regel e: Eenduidige definities

### Criterium
- **Eén interne definitie per concept per taal** (`skos:definition`; projectafspraak conform NEN 2660-profiel). Bij samenvallen wordt één geharmoniseerde definitie vastgesteld; de andere herformulering wordt bewaard als bron (zie onder).
- **Definieer naar genus-en-differentia:** benoem de ouderklasse plus wat dit concept ervan onderscheidt. De differentia is precies de reden dat het een subklasse is (regel c).
- **Definitie en classificatie zijn consistent.** De definitie mag niet functioneel geformuleerd zijn als het concept technisch is gemodelleerd (of omgekeerd); ze weerspiegelt de keuzes uit a en b. Dit is nu juist een bron van NEN↔IMBOR-wrijving (Landhoofd, Fauna-uittreedplaats).
- **Geen conditiemeting-/gebrekentaal in de objectdefinitie.** NEN-definities zijn soms geschreven vanuit het inspectiedoel ("constructie waaraan gebreken …"). Houd die inspectiecontext buiten de objectdefinitie.
- **Herkomst traceerbaar.** Bewaar de oorspronkelijke NEN/NPR-definitietekst niet via `rdfs:isDefinedBy` (dat wijst naar een definiërende *resource*, niet naar een tekst), maar als `skos:scopeNote` of als apart **bronconcept** (eigen `skos:definition`) dat via `skos:exactMatch` aan het geharmoniseerde concept hangt.
- **Licentie-aandachtspunt (checken).** Het letterlijk overnemen van NEN/NPR-definitieteksten in de open IMBOR-publicatie kan botsen met het **auteursrecht van NEN**. Vóór het kopiëren juridisch (laten) toetsen; eventueel parafraseren of alleen verwijzen.

### Onderbouwing
NEN 2660-2 §8.5 (annotatiebinding: `skos:definition` textueel, `rdfs:isDefinedBy`, `skos:scopeNote`/`rdfs:comment`). "Eén definitie per taal" is een project-/profielkeuze, geen algemene SKOS-eis (SKOS beperkt alleen `prefLabel` tot één per taal).

### e-i: Functionele beschrijvingen expliciet maken in definities?
Dit is een **expliciete keuze die wij voorleggen** (geen vaststaand voorstel).

**Voorstel (onze voorkeur): ja, als relatie, niet (alleen) als proza.** Leg de functie(s) vast met de `voertUit`-relatie (`executes`, bereik = `Activiteit`/`Functie`, conform NEN 2660-2 §6.4; IMBOR gebruikt dit al met `sml:Function`) en laat de tekstdefinitie daarnaar verwijzen. Voordeel: de functie wordt machineleesbaar en toetsbaar, en je koppelt functioneel↔technisch netjes met `isGeimplementeerdDoor` (b-i) zonder de functie in de klassehiërarchie te verstoppen. *Let op het bereik:* `executes` wijst naar een activiteit/functie, niet naar een willekeurige resource; onderscheid een beoogde functie, een vereiste capaciteit en een feitelijk uitgevoerde activiteit. Onder OWL-punning volgt uit `Klasse voertUit Functie` niet automatisch dat elk individu die activiteit uitvoert; leg dat waar nodig als constraint vast.

**Alternatief: functies alleen in de tekstdefinitie.** Eenvoudiger, maar de functie blijft "opgesloten" in proza; niet queryable, en de functioneel↔technisch-koppeling moet elders worden gelegd.

**Afweging:** de meeste NEN 2767-4-wrijving (Landhoofd "dragen" + "keren"; element = functie) komt doordat functies impliciet in definities zitten. Ze expliciet als relatie modelleren lost dat structureel op en is in lijn met NEN 2660-2, maar kost meer modelleerwerk per concept.

---

## 11. Werkwijze voor de inhoudelijke groepen

Om de vier groepen consistent te laten beslissen zonder een rigide beslisboom op te leggen:

- **Beslis-record per concept (verplicht).** Leg per bronconcept vast: stap 0-categorie, as a, as b (incl. "onbepaald"), betekenisrelatie (SKOS-predicaat), gekozen representatie, onderbouwing, open vragen, reviewer. Dit maakt elke keuze herleidbaar en vergelijkbaar, en maakt "onopgelost: nadere beslissing nodig" een **geldige uitkomst** in plaats van een gemiste stap.
- **Kalibratieronde vooraf.** Laat alle vier de groepen eerst dezelfde **10–15 gedeelde/cross-cutting concepten** classificeren (bv. Leuning, Fundering, Verharding, Berm) en verzoen de verschillen centraal. Zo komen interpretatieverschillen vroeg boven en wordt de methode op de lastige gevallen getest (echte as-conflicten, `broadMatch`, herhaalde deel-rollen) die de vier voorbeelden in §12 nog niet dekken.
- **Eigenaarschap van cross-cutting concepten.** Concepten die onder meerdere werkgroepen vallen (Leuning: Kunstwerken én Wegmeubilair) krijgen één eigenaar-werkgroep; de andere leveren input.
- **Neutrale mapping eerst, materialisatie later.** Groepen leveren in eerste instantie **mappingrecords** (betekenisrelatie + voorgestelde representatie), niet direct taxonomie-wijzigingen. De materialisatie volgt pas na de bredere inrichtingsbesluiten. Zo blijven de groepen licht belast én worden geen keuzes vastgelegd die van die besluiten afhangen.
- **Aanleverformaat en validatie.** Leg de beslis-records vast in een vast, machineleesbaar formaat, bij voorkeur een **SSSOM-mappingtabel** (Simple Standard for Sharing Ontological Mappings): per rij het bronconcept (NEN-code), het doelconcept (IMBOR-UUID), het mappingpredicaat (`skos:exactMatch`/`narrowMatch`/`broadMatch`/`closeMatch`), plus onderbouwing en auteur. Toets de uiteindelijke materialisatie met **SHACL** tegen de NEN 2660-patronen (o.a. de disjunctheid uit U2 en de verplichte deel→geheel-registratie via `sh:inversePath`). Zo is de uitkomst herleidbaar, uitwisselbaar en automatisch controleerbaar.

---

## 12. Voorbeelduitwerkingen

Vier concepten, één per werkgroep, elk door Stap 0 → a → b → c → d → e. De uitkomsten zijn **voorwaardelijk**: ze gelden mits de aszijde van *beide* bronnen is vastgesteld.

### 12.1 Landhoofd (Kunstwerken): NEN 1326 ↔ `imbor:Landhoofd`

| Stap | Uitkomst |
|---|---|
| **0. soort** | Zelfstandig **objecttype** (herkenbaar kunstwerkdeel), met daarnaast een deel-rol in een overbrugging. → door naar a/b/c. |
| **a. discreet/ruimtelijk** | Beide **reëel/discreet** (tastbare constructie). Geen as-conflict. |
| **b. functioneel/technisch** | Te bevestigen dat **beide** zijden technisch zijn (`Kunstwerkdeel`). NEN formuleert functies ("dragen", "keren") in de definitie; het object zelf is technisch. **Risico:** is de NEN-kant eigenlijk een functioneel *element*, dan is samenvallen verboden en is `isGeimplementeerdDoor` nodig. |
| **c. betekenis + representatie** | Laag 1: vermoedelijk `exactMatch`. Laag 2: **samenvallen**: IMBOR kent `Landhoofd` ⊂ `Kunstwerkdeel`; NEN 1326 integreren. (Geldig mits b aan beide zijden technisch.) |
| **d. naam** | `skos:prefLabel` "Landhoofd"; NEN-code `"1326"^^nen2767:Code` als `skos:notation`. |
| **e. definitie** | Eén geharmoniseerde definitie; functies "dragen hoofddraagconstructie" en "keren grondlichaam" als `voertUit`-relaties (e-i); NEN-brontekst als `scopeNote`/bronconcept. |

**Toets:** schone uitkomst *mits* de as-bevestiging. Mismatch "alleen formulering" → opgelost door e + d.

### 12.2 Verkeersbord (Wegmeubilair): NEN 1586 ↔ `imbor:Verkeersbord`

| Stap | Uitkomst |
|---|---|
| **0. soort** | Zelfstandig **objecttype** (heeft eigen attributen). → door naar a/b/c. |
| **a. discreet/ruimtelijk** | Beide **reëel/discreet** (fysiek bord). Geen as-conflict. |
| **b. functioneel/technisch** | **Technisch** (`Bord` ⊂ Constructie). NEN-element 111 "Bebording en bewegwijzering" is eerder functioneel (`-ing`), maar het bouwdeel Verkeersbord is technisch. |
| **c. betekenis + representatie** | Laag 1: `exactMatch`. Laag 2: **samenvallen**: IMBOR kent `Verkeersbord` al (eigen attributen bordcode/reflectieklasse → echte klasse). NEN 1586 integreren; zusterbouwdelen (1073, 1822, 1903) idem. |
| **d. naam** | prefLabel "Verkeersbord"; NEN-code `"1586"^^nen2767:Code` als notation (op het SKOS-concept). |
| **e. definitie** | Harmoniseren; IMBOR-definitie ("wettelijk vastgesteld verkeersteken") is objectmatig, consistent met de classificatie. |

**Toets:** werkt. Mismatch "granulariteit gelijk, koppeling ontbreekt" → opgelost door samenvallen + notation. (De functionele laag "Bebording en bewegwijzering" is een apart niveau-vraagstuk.)

### 12.3 Fauna-uittreedplaats (Groen): NEN 131 ↔ `imbor:Fauna-uittreedplaats`

| Stap | Uitkomst |
|---|---|
| **0. soort** | Zelfstandig **objecttype** (een voorziening). → door naar a/b/c. |
| **a. discreet/ruimtelijk** | **Onbepaald.** NEN "constructie langs steile/verticale oever" = reëel/discreet; IMBOR "talud, trap of schuin vlak" is ambigu. → **fallback (a-ii):** voorlopig onder generiek `FysiekObject`, open vraag noteren; geen keuze forceren. |
| **b. functioneel/technisch** | **Functioneel** aan beide kanten (`Faunavoorziening`). Naamgeving/definitie functiegericht, consistent. |
| **c. betekenis + representatie** | Laag 1: `closeMatch` (nog niet `exactMatch`, zie e). Laag 2: **voorlopig samenvallen**, pas definitief ná definitie-harmonisatie én de a-beslissing. De twee IMBOR-domeinwaarden (groot wild / watervogels) blijven verschijningsvorm. |
| **d. naam** | prefLabel "Fauna-uittreedplaats"; NEN "Fauna uittreedplaats" als `altLabel` (geldig want zelfde concept); code 131 als notation. |
| **e. definitie** | **Kernprobleem.** Definities sluiten elkaar deels uit (steil/verticaal vs. schuin vlak). Eerst harmoniseren tot één functiegerichte definitie die beide uitvoeringsvormen dekt; functie als `voertUit`-relatie. Pas daarna is `exactMatch`/samenvallen hard. |

**Toets:** laat zien dat de uitkomst **voorwaardelijk** is: twee open punten (as a onbepaald → fallback; definitie-harmonisatie → inhoudelijk werk) moeten eerst dicht. Precies wat de regels moeten blootleggen.

### 12.4 Onderlaag (Verharding): NEN 2175 ↔ `Constructielaag` + domeinwaarde

| Stap | Uitkomst |
|---|---|
| **0. soort** | Grensgeval: **deel-rol/positie** in een verharding, maar met zelfstandig inspectie-/conditiescore-belang → classificeerbaar via een instantieerbare laagklasse (niet als kale waarde). |
| **a. discreet/ruimtelijk** | Beide **reëel/discreet** (vormvaste laag; vgl. NPR 4660 §6). Geen as-conflict. |
| **b. functioneel/technisch** | **Technisch** (constructielaag naar samenstelling). Consistent met `Constructielaag`. |
| **c. betekenis + representatie** | Laag 1: `narrowMatch`. Laag 2: **domeinwaarde** `constructielaagsoort = onderlaag` op een **instantie van `Constructielaag`**: die instantie blijft het adresseerbare inspectie-/conditiescore-subject (§6.11-patroon 1, géén kale attribuutwaarde). Geen eigen subklasse → vermijdt subklasse-explosie. |
| **d. naam** | Geen nieuwe klasse-naam; de waarde in enumeratielijst `constructielaagsoort`; NEN-code `"2175"^^nen2767:Code` als notation op die domeinwaarde. |
| **e. definitie** | Definitie van de **domeinwaarde**. |

**Toets:** scherpste bewijs dat niet elk NEN-bouwdeel een klasse wordt, **mits** de laag een adresseerbare instantie houdt. Openstaand (inhoudelijk): de IMBOR-domeinlijst combineert nu verhardingstype + laagpositie en moet mogelijk heringedeeld worden zodat "onderlaag" materiaal-onafhankelijk kan.

### 12.5 Wat de voorbeelden aantonen
- De regels leiden tot **herleidbare, maar voorwaardelijke** uitkomsten: 2 vrij zekere samenvallers (Landhoofd, Verkeersbord, mits as-bevestiging), 1 voorwaardelijke samenvaller met open punten (Fauna), 1 domeinwaarde-met-instantie (Onderlaag).
- De assen blokkeren nergens onterecht een subklasse; waar a onbepaald is (Fauna) grijpt de fallback naar het generieke concept (a-ii), geen geforceerd oordeel.
- De regels scheiden **classificatiewerk** (deze methode) van **inhoudelijk harmonisatiewerk** (definitie-harmonisatie, domeinlijst-herindeling).
- De vier voorbeelden testen nog geen echt as-conflict (`isBegrensdDoor`/`isGeimplementeerdDoor`), geen `broadMatch`/partiële overlap, en geen herhaalde deel-rol; vandaar de kalibratieset (§11).
