---
title: Uitgangspunten integratie NEN 2767-4 & IMBOR
header:
  overlay_color: "#b1501f"
  overlay_filter: "0.3"
  tagline: "Een werkbare, herleidbare methode om concepten uit NEN 2767-4 te integreren met IMBOR"
---

**Status:** VOORSTEL
{: .notice--warning}

Dit document beschrijft de uitgangspunten voor een werkbare, herleidbare methode om concepten uit NEN 2767-4 te integreren in IMBOR, en te verankeren in de modelleerpatronen van NEN 2660-2:2022.

**Doelgroep:** de werkgroep die de methodiek vaststelt, en daarna de inhoudelijke werkgroepen die de methode per concept toepassen.

---

## 1. Projectomschrijving

Het project dat door NEN & CROW samen ondernomen wordt bestaat uit twee samenhangende doelen die in nauwe afstemming worden opgepakt:
  1. Integratie van de klassen (objecttypen) uit IMBOR en NEN 2767-4
  2. Een typische decompositie (of: Uniforme Technische Decompositie) voor conditiemeting in IMBOR, herzien volgens NEN 2660

### Integratie van de klassen (objecttypen) uit IMBOR en NEN 2767-4
De klassen uit beide standaarden worden veel gebruikt in beheer en assetmanagement. Ze overlappen sterk, maar hun definities en benamingen sluiten niet op elkaar aan. De integratie moet leiden tot één eenduidige set klassen die in de hele sector is afgestemd. Waar volledige integratie niet mogelijk is, worden de klassen op elkaar afgestemd. De mapping kan ook laten zien dat een NEN 2767-4-concept al volledig gedekt wordt door een (beter) IMBOR-concept: dan kan de NEN-term vervallen of opgaan in die IMBOR-klasse. Dat is geen waardeoordeel over het concept, maar een constatering van dubbeling; de betekenis en de conditiemetinginformatie blijven behouden. Bij het mappen wordt per klasse ook vastgesteld of die functioneel is (wat doet het?) of technisch (waaruit bestaat het?).

>Binnen IMBOR worden de klassen voorzien van: mogelijke vaste informatiebehoeften (gegevens die niet vaak wijzigingen) in de context van beheer openbare ruimte'. Dit gebeurt met name in de vorm van attributen en relaties. Binnen de NEN2767-4 worden de klassen vooral gebruikt om conditiemetingen (gegevens met een meer dynamisch karakter) aan te hangen. _Hoewel dit voor de respectievelijke standaarden erg belangrijk is, is het voor dit project minder van belang._ Hier ligt de focus op de _klassen zelf_, niet zozeer de gegevens over de klassen.
{: .notice--warning}

### Een Uniforme Technische Decompositie (UTD) in IMBOR, herzien volgens NEN 2660
De in-scope klassen in IMBOR krijgen een **Uniforme Technische Decompositie (UTD)** die gebaseerd is op NEN 2767-4. Deze decompositie is primair bedoeld voor conditiemeting binnen assetmanagement, maar is breder bruikbaar. "Uniform" betekent dat de decompositie eenduidig en op één manier wordt toegepast; het sluit niet uit dat er naast deze UTD ook andere, anders-georiënteerde decomposities bestaan. De driedeling Beheerobject–Element–Bouwdeel uit NEN 2767-1 blijft daarbij behouden als indeling in niveaus. De brondecompositie bevat weeffouten in de modellering. Die worden gecorrigeerd:
- Specialisaties gemodelleerd als decompositie. Veel 'decomposities' zijn in werkelijkheid specialisaties. Een voorbeeld is "Kabel hasPart Signaalkabel". Dat is een specialisatierelatie (`subClassOf`) en geen 'onderdeel van'-relatie.
- Groeperingen gemodelleerd als decompositie. Een term als "Bebording en bewegwijzering" verwijst niet naar één individueel ding maar naar een verzameling (`hasMember`), geen `hasPart`.
- Soms een functioneel-technische overgang. In veel gevallen is element→bouwdeel gewoon een zuivere `hasPart` tussen twee aanwijsbare objecten. Alleen waar een écht puur functioneel element door technische bouwdelen wordt geïmplementeerd, is het een implementatierelatie (`isImplementedBy`). Dat is de uitzondering, niet de regel.

>De hasPart-relatie zelf is in NEN 2660-2 eenduidig. Welke decompositie je maakt, hangt wel af van het **doel** en het **perspectief**. Daarom wordt de Uniforme Technische Decompositie (UTD) in IMBOR uitdrukkelijk vastgelegd als dé technische decompositie voor conditiemeting en aanverwant gebruik. Sommige partijen kiezen ervoor om middels deze decompositie ook hun areaal in te delen. Zo ondersteunt ze ook het proces van instandhouding.
{: .notice--warning}

### Samenhang en werkwijze

De twee onderdelen hangen direct met elkaar samen. De inhoudelijke werkgroepen beoordelen de herziene decompositie en de relatie naar IMBOR. Daarbij kan bijvoorbeeld blijken dat een klasse die nu als element is opgenomen, eigenlijk technisch van aard is en dus op het niveau van bouwdeel thuishoort. Het omgekeerde kan ook.

---

## 2. Doelstelling

Met dit project streven we naar:

*Één eenduidige set klassen in IMBOR, waar mogelijk geïntegreerd met NEN 2767-4 en anders daarop afgestemd; een Uniforme Technische Decompositie (UTD) voor conditiemeting binnen assetmanagement, opgenomen in IMBOR, gebaseerd op NEN 2767-4 en gemodelleerd volgens NEN 2660.*

Op deze manier kunnen we bij de uitwisseling van assetgegevens voor conditiemeting zo veel mogelijk dezelfde klassen en dezelfde structuur gebruiken.

**Functionele decompositie (buiten scope)**
In de markt is ook behoefte aan andere decomposities dan die voor conditiemeting, bijvoorbeeld voor Systems Engineering (SE), voor het ontwerpen en bouwen van assets en voor beslissingen over amoveren. Daarvoor is een diepere functionele decompositie nodig. Een functionele decompositie die geschikt is voor SE bestaat nog niet. Ze heeft waarschijnlijk meer dan drie lagen en verschilt per asset en/of organisatie.
Via de elementen bevat IMBOR straks al een beperkte functionele laag voor conditiemeting. De diepere functionele decompositie voor SE nemen we niet op in IMBOR. Die kan wel worden vastgelegd in een aparte ontologie die de klassen en hun definities uit IMBOR overneemt.
In zo'n ontologie worden de kenmerken uit NEN 2767 gekoppeld aan functies. De kernvraag is: welke functie komt in gevaar als een conditie niet voldoet? Roest is bijvoorbeeld pas een probleem als het 'afdragen van krachten' in gevaar komt.
Dit valt buiten de scope van dit project. Het resultaat van dit project, eenduidige klassen en een correct gemodelleerde decompositie, kan later wel dienen als basis voor zo'n vervolgstap.

---

## 3. Terminologie en uitgangspunten

### Terminologie
We gebruiken deze termen consistent in dit project:

- **(bron)concept**: een te beoordelen eenheid uit NEN 2767-4 (een beheerobject, element of bouwdeel) of IMBOR. Neutraal: het zegt nog niets over de uitkomst.
- **klasse**: een concept kan een klasse worden na classificatie in IMBOR, of een bestaande IMBOR-klasse.
- **classificatie / classificeren**: een (bron)concept indelen onder de juiste klasse.
- **instantie**: een concreet exemplaar van een klasse (het werkelijke ding in het veld), tegenover de klasse als algemeen type.
- **taxonomie**: een boomvormige indeling van klassen, van algemeen naar specifiek (klasse → subklasse); de treden van die boom zijn specialisaties.
- **specialisatie**: een "is-een-soort-van"-relatie; een subklasse is een specialisatie van de bovenliggende klasse (`subClassOf`). Alle specialisaties samen vormen de taxonomie.
- **dimensie**: een indelingsas uit NEN 2660-2 waarlangs je een concept kunt plaatsen (ruimtelijk/reëel, functioneel/technisch, gepland/gerealiseerd).
- **relatie**: een verbinding tussen concepten (`hasPart`, `isImplementedBy`, `subClassOf`, `isBegrensdDoor`, …).
- **betekenisrelatie**: de mate van overeenkomst tussen een NEN 2767-4-concept en een IMBOR-concept, uitgedrukt met een SKOS-term (`exactMatch`, `narrowMatch`, `broadMatch`, `closeMatch`, of geen tegenhanger).
- **representatie**: de vorm waarin een concept in IMBOR wordt opgenomen; bijvoorbeeld een eigen klasse, een subklasse, een verschijningsvorm, een onderdeel (`hasPart`), een materiaal, of vervallen. 
- **decompositie** (opdeling in onderdelen): het geheel van concepten met hun `hasPart`-relaties.
- **NEN-niveau**: beheerobject, element of bouwdeel.
- **payload**: de conditiemetinginformatie die NEN 2767-4 aan de decompositie hangt: **belang** (op de relatie element→bouwdeel), **materiaalsoort** (aan het bouwdeel) en **gebrek** (aan de materiaalsoort). 
{: .notice--info}

### Uitgangspunten
Deze uitgangspunten zijn de houvast voor het gehele project.

- **U1: Opnemen waar mogelijk, niet persé als klasse.** De concepten uit NEN 2767-4 worden zoveel mogelijk opgenomen in IMBOR. "Opnemen" kent meerdere vormen: twee concepten die **samenvallen** (integreren tot één), een **subklasse**, een **verschijningsvorm** op een instantieerbare klasse, een **onderdeel** (`hasPart`), of een **materiaal** in de materie-tak. De wens is dat elk in-scope concept een expliciete, herleidbare representatie of mapping krijgt, niet dat elk concept een eigen klasse wordt.
- **U2: De ALIM-dimensies zijn optioneel, maar sluiten elkaar uit zodra je ze toepast (NEN 2660-2 noemt dat *disjunct*).** De dimensies ruimtelijk/reëel (§6.2), functioneel/technisch (§6.4) en gepland/gerealiseerd (§6.5) hoeven niet voor elk concept te worden ingevuld. Maar waar je een dimensie wél toepast, kan een klasse _niet aan beide zijden tegelijk hangen_: "het een of het ander, niet beide" (§6.4). Dat sluit niet uit dat één ding zowel een functie heeft als technisch beschreven is: een technisch object mag functie-inhoud dragen en een functionele rol vervullen, zolang het een **aanwijsbaar, context-onafhankelijk** (het blijft in elke situatie hetzelfde ding) object blijft. Waar bronconcepten op verschillende dimensiezijden vallen, is een **relatie** nodig, geen subklasse. 

>_Afbakening voor de UTD:_ geen ruimtelijke objecten, alleen discrete objecten die als technisch object zijn aan te duiden; de dimensie gepland/gerealiseerd speelt hier niet.
{: .notice--warning}

- **U3: Classificeren op een dimensie is optioneel (NEN 2660-2 §6.6).** Is een dimensie niet relevant of niet eenduidig te bepalen, dan volstaat het generieke concept (`FysiekObject`) zonder keuze. Forceer geen keuze waar die niets toevoegt, dat levert schijnnauwkeurigheid op. _Noteer een onbepaalde dimensie wel als open vraag._
- **U4: Betekenis vóór representatie.** Bepaal eerst wát een concept betekent en hoe het zich tot een IMBOR-klasse verhoudt; kies pas daarna hoe je het modelleert. Zo voorkom je dat een modelleergemak (bv. "geen eigen attributen") een betekenisoordeel vervangt.
- **U5: Taxonomie vóór decompositie.** Bepaal eerst welke klassen er zijn en pas daarna hoe ze samenhangen. Hiermee importeren we de modelleringsfouten uit de NEN 2767-4-decompositie niet mee in IMBOR, en wordt de herziene decompositie een resultaat op basis van bewijs in plaats van een overname.
- **U6: De 'conditiemeting-payload' blijven herleidbaar.** Belang, Materiaalsoort en Gebrek (die noemen we payload) moeten na de herinrichting een geldig ankerpunt hebben. Elke wijziging aan een concept of relatie krijgt daarom een expliciete payload-bestemming (stap 3).
- **U7: De UTD blijft compleet op drie niveaus.** De decompositie Beheerobject–Element–Bouwdeel blijft een complete, consistente driedeling: er mogen geen gaten op enig niveau ontstaan. Elke wijziging aan een concept (verschuiven, samenvoegen, algemener maken, vervallen) is pas afgerond wanneer de betrokken relaties zijn meeverlegd en de conditiemetinginformatie is gecontroleerd en waar nodig aangepast.

---

## 4. Het proces in zes stappen

We werken van eenvoudig naar complex: eerst kijken we alleen naar de losse concepten (welke klassen zijn het?), en pas daarna naar de decompositie eromheen (hoe hangen ze samen?). Zo nemen we de modelleringsfouten uit de oude decompositie niet mee IMBOR in (zie U5).

| Stap | Wie | Wat gebeurt er |
|---|---|---|
| **1. Concepten op IMBOR leggen** | inhoudelijke werkgroep | Kijk per concept: bestaat dit al in IMBOR, en is het ruimtelijk/reëel en functioneel/technisch? |
| **2. Decompositie ernaast leggen** | inhoudelijke werkgroep | Leg de 'oude' NEN-decompositie over de geplaatste concepten en kijk waar het wringt. |
| **3. Decompositie bijwerken** | inhoudelijke werkgroep | Stel per concept en per relatie voor wat ermee moet gebeuren, inclusief de definitie-vergelijking (zie de beslistabellen hieronder). |
| **4. Samenvoegen** | modelleur (werkgroep Methodiek) | Voeg de resultaten van de vier werkgroepen samen, stem ze op elkaar af. |
| **5. Controleren** | modelleur ↔ inhoudelijke werkgroepen | Toets het samengevoegde voorstel én laat de inhoudelijke werkgroepen de voorgestelde relaties en definities valideren (terugkoppelronde). |
| **6. Aanhaken op IMBOR** | IMBOR-modelleurs | Weeg de nieuwe decompositie af tegen een eventueel al bestaande decompositie in IMBOR. |

**Waar we beginnen.** Het startpunt ligt al klaar voor de eerste pilotfase: de 80-20-lijst bevat per werkgroep de geselecteerde beheerobjecten, elementen en bouwdelen, met hun definities en hun onderlinge relaties. Die lijst is het vertrekpunt voor stap 1 en het vergelijkingspunt voor stap 2.

>*De oude NEN 2767-4-decompositie en een eventueel al bestaande decompositie in IMBOR zijn met een ander doel en vanuit een ander perspectief gemaakt.* We zetten ze naast elkaar, niet door elkaar. Hoe ze zich uiteindelijk tot elkaar verhouden, bepalen de IMBOR-modelleurs later (stap 6).
{: .notice--warning}

---

### Stap 1: Concepten op IMBOR leggen

Stap 1 stelt per concept **drie dingen** vast. De uitkomst is een mapping waarin alle NEN-concepten beoordeeld zijn en hun betekenisrelatie naar de IMBOR-concepten kennen.

*Wát een concept wordt (subklasse, verschijningsvorm, onderdeel, een relatie, of vervallen) komt pas in stap 3.*

>**Dit is voorlopig.** Een concept dat hier netjes mapt, kan in stap 3 alsnog een verschijningsvorm blijken of vervallen. Voorbeeld: Onderlaag en Deklaag mappen allebei als `narrowMatch` op `Constructielaag`; pas in stap 3 blijkt dat het laagposities (waarden) zijn.
{: .notice--info}

#### Vaststelling 1: Ruimtelijk of reëel?

- **Reëel** = tastbaar (massa/materiaal). Binnen reëel: `DiscreetObject` (vormvast; het normale geval) of `HoeveelheidBulkmaterie` (niet-vormvast). *Toets:* "kan ik het aanraken en heeft het een vaste vorm?"
- **Ruimtelijk** = niet-direct tastbaar, bepaald door begrenzing of inhoud (rijstrook, profiel van vrije ruimte). *Toets:* "is het een afgebakende ruimte of zone zonder eigen materiaal?"

"Inspecteerbaar" is géén bewijs van reëel/discreet (ook bulk of ruimte is inspecteerbaar). Beoordeel op vormvastheid en tastbaarheid. Ruimtelijke concepten zitten vooral aan de netwerk- en wegindelingskant (wegvak, rijstrook). Voor meer informatie wordt naar NEN 2660-2 §6.2 verwezen.

*Bij twijfel:* laat de dimensie open, plaats het concept onder het generieke `FysiekObject` en noteer het als open vraag (U3).

#### Vaststelling 2: Functioneel of technisch?
- **Functioneel** = wat het moet dóén, welke functie het vervult ("blackbox"). Herkenbaar aan namen op `-systeem`, `-voorziening`, `-ing`.
- **Technisch** = waarvan het gemaakt is of hoe het is uitgevoerd ("whitebox"). Herkenbaar aan namen op `-werk`, `-constructie`, `-installatie`. *Toets:* "beschrijf ik wat het moet dóén, of waarvan het gemaakt is?"

**Functioneel en technisch sluiten elkaar hier niet uit.** Een technisch object is vaak juist gemaakt om een functie te vervullen en mag functie-inhoud in naam of definitie dragen; een `Verkeersbord` is een bruikbaar technisch object ook al zit "verkeer" in de naam. De echte toets is: **kun je het aanwijzen als fysiek ding, en blijft het hetzelfde ding in een andere context?** Precies hetzelfde armatuur is een verkeerslicht op de weg en een scheepvaartsein aan een brug. Dat is géén nieuw technisch object maar dezelfde klasse in een andere rol. Waar dat niet zo is (het object is alleen als functie of systeem te beschrijven, niet aanwijsbaar), is het geen geschikt technisch object voor de UTD.
{: .notice--info}

Verwar de *functionele dimensie* (hier, per concept) niet met de *rol* van een niveau (een beheerobject, element of bouwdeel speelt een rol binnen een geheel).
{: .notice--info}

*Bij twijfel:* laat de dimensie open (net zoals vaststelling 1).

#### Vaststelling 3: Bestaat het al in IMBOR?
Zoek het dichtstbijzijnde IMBOR-concept en bepaal de betekenisrelatie. Kijk daarbij naar **welke objecten eronder vallen**, niet naar welke attributen het concept heeft:

| Relatie | SKOS-term | Betekenis |
|---|---|---|
| Identiek | `skos:exactMatch` | elke A is een B én omgekeerd |
| NEN smaller | `skos:narrowMatch` | elke NEN-A is een IMBOR-B, niet omgekeerd |
| NEN breder | `skos:broadMatch` | elke IMBOR-B is een NEN-A, niet omgekeerd |
| Partieel overlappend | `skos:closeMatch` / `relatedMatch` | overlap, geen van beide bevat de ander |
| Geen tegenhanger | n.v.t. | concept ontbreekt aan de IMBOR-kant |

Bij **geen tegenhanger**: noteer de beoogde **ouderklasse** in de IMBOR-taxonomie.

>Bij het beoordelen van de vaststellingen kan ook de 'huidige populatie' (lees: instanties bij asseteigenaren) ook een goede leidraad zijn. Dit wil zeggen: denk bij het beoordelen ook aan de instanties die je nu beheert of vaak tegen komt. Zou je die ook allemaal over één kam kunnen scheren.
{: .notice--info}

>**Wat stap 1 niet doet**: Geen representatiekeuze (subklasse, verschijningsvorm, vervallen), geen relaties, en niets met `hasPart`. Die beslissingen hebben de decompositie-context uit stap 2 en 3 nodig.
{: .notice--warning}

### Stap 2: Decompositie vergelijken

Leg de oude NEN-decompositie over de gemapte concepten (resultaat stap 1) en stel vast **waar het wringt**. Dit is nog signaleren; de beslissingen volgen in stap 3.

**Volgorde: eerst de concepten, dan pas de relaties.** Beoordeel in deze stap eerst *alle* concepten afzonderlijk, en ga daarna pas naar de relaties ertussen. De reden is dat een relatie altijd twee concepten verbindt: je kunt pas vaststellen of die relatie klopt of juist wringt wanneer beide uiteinden een uitkomst hebben. Van elk van de twee concepten moet dus al vaststaan op welk niveau het hoort, wat zijn dimensie is (ruimtelijk vs. reëel, functioneel vs. technisch) en hoe het op IMBOR mapt. Begin je andersom (bij de relaties) dan beoordeel je verbindingen waarvan de uiteinden nog kunnen verschuiven, en dat levert geen betrouwbaar beeld op.

>**Hergebruik als signaal.** Een concept dat onder veel andere concepten hangt, is vrijwel zeker een echte zelfstandige klasse; een concept dat maar op één plek voorkomt, is een kandidaat om te vervallen of een verschijningsvorm te worden.
{: .notice--info}

Let bij het vergelijken op vier typische wrijvingen:

1. **Niveau klopt niet met de dimensie.** Een concept staat op het niveau 'element' maar is technisch, of op 'bouwdeel' maar is functioneel. Kandidaat om van niveau te verschuiven in stap 3.
2. **Dimensieconflict tussen de twee bronnen.** Het NEN-concept en het dichtstbijzijnde IMBOR-concept vallen op verschillende zijden van een dimensie (ruimtelijk vs. reëel of functioneel vs. technisch). Dan is een subklasse uitgesloten en is een relatie nodig in stap 3.
3. **Specialisatie verkleed als decompositie.** Een weeffout in NEN 2767-4 is dat specialisaties als `hasPart` zijn gemodelleerd. *Toets:* vul in "X is een **onderdeel van** Y" versus "X is een **soort** Y". Een `Signaalkabel` is een *soort* `Kabel`, geen *onderdeel van* een kabel → dus eigenlijk een specialisatie, geen `hasPart`.
4. **Groepering verkleed als concept.** Een 'concept' blijkt een verzameling (`hasMember`), geen individueel aanwijsbaar object. Voorbeeld: "Bebording en bewegwijzering" verwijst niet naar één ding maar naar een groep dingen die de verschijningsvorm bebording/bewegwijzering hebben. *Toets:* verwijst de term naar één aanwijsbaar ding, of naar een groep dingen met een gedeelde verschijningsvorm? Dit komt vooral op elementniveau voor (de groep) met op bouwdeelniveau de individuen; de decompositierelatie is dan verkeerd gebruikt. 

**Resultaat:** een bevindingenlijst: per concept en per relatie de geconstateerde wrijving (of "geen wrijving").

---

### Stap 3: Decompositie herzien

Kies op basis van de bevindingen (stap 2) per concept en per relatie precies één uitkomst.

#### Beslistabel concepten

Loop per concept deze lijst af en kies de **eerste** rij die past. Elke keuze is een voorstel.

| Wat kom je tegen (bevinding) | Wat stel je voor |
|---|---|
| Een duidelijk, aanwijsbaar ding, op het juiste niveau, dat op een IMBOR-concept lijkt | **Houden zoals het is**; noteer op welk IMBOR-concept het mapt |
| Precies hetzelfde als iets dat al (beter) in IMBOR staat | **Samenvoegen** met dat IMBOR-concept; de NEN-naam wordt synoniem. |
| Eigenlijk een *soort van* iets anders (bv. "Signaalkabel" is een soort "Kabel"), geen onderdeel van | **Markeren als `subClassOf`**. Als er dan een 'gat' valt, benoem welk concreet ding ervoor in de plaats komt. |
| Eigenlijk een *groepje* dingen (bv. "Bebording en bewegwijzering") | **Opsplitsen** in de losse dingen (element-groep → losse elementen; bouwdeel-groep → losse bouwdelen) |
| Geen eigen ding, alleen een *uitvoering* van iets (bv. "Trottoirband" bij "Band") | **Algemener maken** tot een bestaande klasse; het onderscheidende kenmerk wordt een attribuut(waarde) (dit heet: verschijningsvorm). *Mits* het onderliggende ding een echt, aanwijsbaar technisch object blijft |
| Niet aanwijsbaar als fysiek ding (meer een functie, systeem of ruimte) | **Overleg met de modelleur:** meestal moet er een echt aanwijsbaar object voor komen, of het hoort niet in deze UTD thuis |
| Een stof/materiaal, geen ding | **Bij de materialen** zetten (materie-tak) |
| Voegt echt niets toe naast IMBOR | **Voorstellen om te laten vervallen**. Maar alleen als het al (beter) ergens staat |

**Drie regels bij elke keuze**

- **Nooit zomaar weggooien of verplaatsen.** Kijk wat het doet met de relaties en of er geen gat valt. Een concept is pas "af" als de relaties en de payload zijn meeverlegd.
- **Kijk eerst in IMBOR.** Grote kans dat het antwoord er al is.
- **"Wat is het" vóór "wat doet het".** We ordenen op wát iets is (een aanwijsbaar ding); de functie mag in de beschrijving staan maar is niet de ordeningsgrond.

>De modelleur gebruikt bij het samenvoegen en controleren (stap 4/5) een uitgebreidere variant van deze lijst, met per bevinding de gevolgen en de verplichte herstelcontrole (alle relaties meeverleggen, geen gat op enig niveau, alle voorkomens beoordelen). Voor de inhoudelijke werkgroepen is bovenstaande werkbare vorm voldoende.
{: .notice--info}

##### Verschijningsvorm i.p.v. klasse
IMBOR gebruikt een [classificerend attribuut](https://docs.crow.nl/imbor/techdoc/#classificerende-attributen) voor detailleringen van een objecttype die geen eigen informatiebehoefte hebben. In plaats van voor elke variant een aparte klasse te maken, worden de varianten waarden in één lijst bij de klasse. Het algemene classificerende attribuut heet `verschijningsvorm`; daarnaast bestaan objectspecifieke varianten (bijvoorbeeld `constructielaagsoort` op `Constructielaag`). Zo heeft de klasse `Band` een `verschijningsvorm` met waarden als *Trottoirband*, *Opsluitband* en *Parkeerband*.

Een NEN 2767-concept kan zo'n waarde worden in plaats van een eigen klasse. Let op: de klasse zelf (bijvoorbeeld `Band`) blijft bestaan en blijft het object dat je vastlegt en inspecteert. Het classificerende attribuut zegt alleen *welke variant* het is; gebreken, conditiescore en onderhoudshistorie blijven aan het object hangen.

**Eigen klasse of verschijningsvorm?** Maak een concept niet te snel een verschijningsvorm omdat het "geen eigen attributen" heeft. Een concept verdient een eigen klasse zodra het zich onderscheidt door eigen **attributen, relaties óf beperkingen**. Dat laatste is in NEN 2767 vaak het geval: er zijn andere materialen toegestaan, en dus andere gebreken van toepassing, ook al heeft het concept geen extra attributen.


#### Beslistabel relaties

Per bestaande `hasPart`-relatie is er één uitkomst uit de onderstaande tabel van toepassing. **Has-part is de regel**: meestal is element→bouwdeel een zuivere `hasPart`-relatie tussen twee aanwijsbare technische objecten. De andere uitkomsten zijn correcties die je alleen toepast waar de relatie aantoonbaar iets anders is.

| Uitkomst | Wanneer | Let op |
|---|---|---|
| Blijft `hasPart` | echte deel-van; beide uiteinden zijn aanwijsbare technische objecten op aangrenzende niveaus | de normale, meest voorkomende uitkomst voor element→bouwdeel |
| Wordt `subClassOf` | was eigenlijk een specialisatie (is-een), geen deel-van | lever een concreet vervangend element als het omlabelen een gat slaat |
| Wordt `has member` | was een groepering/verzameling, geen deel-van | groep terugbrengen tot de afzonderlijke leden |
| Wordt `isImplementedBy` (`isGeimplementeerdDoor`) | **uitzondering:** het element is écht puur functioneel en wordt door technische bouwdelen geïmplementeerd | niet standaard op elke element→bouwdeel-overgang toepassen |
| Wordt `isBegrensdDoor` / `bevat` | overgang ruimtelijk vs. reëel | vergt een inhoudelijk reëel object aan de andere kant, niet alleen een hernoeming; hoort buiten de kern-decompositie (evt. later) |
| Verlegd | een uiteinde is samengevallen of verschoven | relatie opnieuw aanknopen zonder gat; beoordeel alle voorkomens |
| Vervalt | een uiteinde vervalt, of de relatie is betekenisloos | payload bewust herverdelen of afvoeren |

>`isBegrensdDoor`/`bevat` niet verwarren met `heeftBegrenzing`/`hasBoundary`, dat naar geometrie wijst.
{: .notice--warning}

**Functioneel en technisch sluiten elkaar niet uit.** Een object kan beide aspecten hebben (functie-inhoud dragen én technisch aanwijsbaar zijn), dus niet elke element→bouwdeel-overgang is een implementatierelatie: `isImplementedBy` geldt alleen waar het element écht puur functioneel is. Een vermoeden dat een relatie "iets anders" is, sluit de has-part niet automatisch uit. Welke relatie past, vergt eigen afweging.

#### Naam en definitie vastleggen
Zodra de representatie vaststaat, leg je voor het concept de naam en definitie vast. Hoeveel werk dat is, hangt af van de gekozen uitkomst: bij **samenvallen** harmoniseer je label en definitie van beide bronnen tot één; bij een concept dat een **klasse blijft, een subklasse wordt of van niveau verschuift** controleer je of naam en definitie aan de regels voldoen; bij een **verschijningsvorm** gaat het om de naam en definitie van de waarde, niet van een klasse; bij **vervallen** is er niets vast te leggen.

##### Eenduidige namen (NEN 2660-2 §8.4)
- **Eén uniek voorkeurslabel per concept:** De NEN-term wordt een synoniem als die hetzelfde concept aanduidt (bij `exactMatch`); bij een smaller/breder/overlappend concept is de NEN-term geen synoniem.
- **Schrijfwijze:** klasse-/objecttypenamen in CamelCase met hoofdletter; attribuut- en relatienamen in camelCase. **Enkelvoud**, behalve bij groepsaanduidingen.
- **Naamgeving als signaal, niet als bewijs.** De `-ing`/`-constructie`-vuistregel helpt classificeren maar mag die nooit overrulen; een naam die "constructie" zegt terwijl het functioneel is gemodelleerd (of omgekeerd) is een signaal om te heroverwegen.
- **Geen twee concepten met hetzelfde voorkeurslabel.** Als twee begrippen dezelfde naam hebben, maak dan het onderscheid in het label (context tussen haakjes).

##### Eenduidige definities (NEN 2660-2 §8.5)
- **Eén interne definitie per concept per taal**: Bij samenvallen wordt één geharmoniseerde definitie vastgesteld; de andere herformulering wordt bewaard als bron.
- **Definieer naar genus-en-differentia:** benoem de ouderklasse plus wat dit concept ervan onderscheidt.
- **Definitie en classificatie zijn consistent.** De definitie mag niet functioneel geformuleerd zijn als het concept technisch is gemodelleerd (of omgekeerd); ze weerspiegelt de dimensiekeuzes uit stap 1.
- **Geen conditiemeting-/gebrekentaal in de objectdefinitie.** Houd de inspectiecontext buiten de objectdefinitie.

#### Implicaties voor conditiemeting

De conditiemeting-payload blijft herleidbaar. Met "payload" bedoelen we de drie dingen die NEN 2767-4 aan de decompositie hangt: **belang** (H/M/L), **materiaalsoort** en **gebrek**. Belang zit op de **relatie** element→bouwdeel, materiaalsoort hangt aan het **concept** bouwdeel, en gebrek aan de materiaalsoort. De conditiescore wordt gemeten op bouwdeelniveau.

>De aansluiting op conditiemeting methodiek wordt in dit traject **bewaard, niet heringericht**. De conditiemeting blijft van NEN 2767; we zorgen alleen dat elk payload-element een geldig ankerpunt houdt als een concept of relatie verandert.
{: .notice--info}

1. **Materiaal + gebrek 'reizen' mee met het technische concept.** Waar het bouwdeel-concept ook landt (blijft klasse, wordt subklasse, verschuift van niveau, of wordt verschijningsvorm van een bestaande klasse), materiaal en gebrek blijven eraan hangen. Dit is waarom de regel uit stap 3 (de klasse zelf blijft bestaan en inspecteerbaar) hard is: zolang het object een eigen identiteit houdt, heeft de payload altijd een drager.
2. **Belang reist mee met de relatie.** Belang is inherent contextueel (een bouwdeel kan met verschillend belang onder verschillende elementen voorkomen). Verandert de relatie element→bouwdeel van type (bv. naar `isImplementedBy`), dan verhuist het belang mee naar die nieuwe relatie.
3. **Bij vervallen van een concept: payload expliciet opnieuw toewijzen.** Valt een bouwdeel weg, dan gaat de payload bewust mee naar het concept waarin het opgaat, óf wordt bewust afgevoerd. Dit is een **verplicht veld in het beslis-record**: "waar gaat belang/materiaal/gebrek heen?".
4. **Koppelpunt-register.** Per gewijzigd concept of gewijzigde relatie leg je vast waar de payload landt. Dat register is het bewijs dat de conditiemeting na herinrichting volledig herleidbaar is.

---

### Stap 4: Samenvoegen

De vier inhoudelijke werkgroepen leveren **beslis-records**, geen kant-en-klare modelwijzigingen. In stap 4 brengt de modelleur, namens de werkgroep Methodiek, die vier opleveringen samen tot één voorstel.

- **Samenvoegen.** Leg de beslis-records van de vier werkgroepen naast elkaar en voeg ze samen tot één samenhangende set klassen, relaties en mappings.
- **Afstemmen.** Verzoen concepten die onder meerdere werkgroepen vallen (bijvoorbeeld Leuning, onder Kunstwerken én Wegmeubilair): één voorkeurslabel en één geharmoniseerde definitie. Los dubbelingen en tegenstrijdige dimensiekeuzes centraal op.

>**Resultaat:** één samenhangend voorstel vanuit de werkgroep Methodiek, klaar voor de controle in stap 5.
{: .notice--info}

---

### Stap 5: Controleren

Het samengevoegde voorstel wordt getoetst voordat het definitief wordt. Dat gebeurt op twee manieren, die samen de kwaliteit borgen:

- **Machinematig (modelleur).** Toets de samengevoegde decompositie tegen de NEN 2660-patronen: elkaar uitsluitende dimensies waar ze zijn toegepast (U2), een geldig relatietype per verbinding (`hasPart` / `isImplementedBy` / `subClassOf` / `isBegrensdDoor`) en definities naar genus-en-differentia. En controleer dat elk payload-element (belang, materiaalsoort, gebrek) een geldig ankerpunt houdt en dat de decompositie compleet is op drie niveaus (U7).
- **Inhoudelijk (inhoudelijke werkgroepen).** De werkgroep Methodiek legt het voorstel terug aan de inhoudelijke werkgroepen: kloppen de voorgestelde relaties en de geharmoniseerde definities? 

>**Resultaat:** één samengevoegde én gevalideerde decompositie met mappings, klaar om in stap 6 op IMBOR aan te haken.
{: .notice--info}

---

### Stap 6: Aanhaken op IMBOR

In de laatste stap nemen de **IMBOR-modelleurs** het gevalideerde voorstel uit stap 5 over en bepalen hoe het zich verhoudt tot wat er al in IMBOR staat.

- **Afwegen tegen de bestaande structuur.** Weeg de UTD af tegen een eventueel al bestaande decompositie in IMBOR. Beide zijn met een ander doel en vanuit een ander perspectief gemaakt; pas hier beslissen de IMBOR-modelleurs hun definitieve verhouding naast elkaar, geïntegreerd of vervangend.
- **Opnemen in IMBOR.** Verwerk de uitkomst in IMBOR volgens het reguliere IMBOR-beheer- en releaseproces.

>Dit is het moment waarop de keuze valt die tot nu toe bewust openstond: de oude NEN 2767-4-decompositie en de bestaande IMBOR-decompositie zijn tot nu toe *naast* elkaar gezet, niet *door* elkaar. Hier bepalen de IMBOR-modelleurs hun uiteindelijke verhouding.
{: .notice--warning}

---

## 5. 'Invulformulier' inhoudelijke werkgroepen

***NADER UIT TE WERKEN...***

- Beslis-record per concept **en per voorkomen**. Leg per concept het eindresultaat van de stappen vast, maar nooit los van zijn context. Toon minimaal: het concept en zijn identificatie, de definitie, het NEN-niveau (beheerobject/element/bouwdeel), het bijbehorende element of beheerobject, het relatietype, en bij een wijzigingsvoorstel de voorgestelde nieuwe situatie. Beoordeel een concept dat onder meerdere gehelen hangt per voorkomen. Presenteer dit als een vaste tabel (zoals hieronder), zodat een reviewer in één oogopslag ziet wat het is én wat een wijziging raakt; die kan later machineleesbaar worden geëxporteerd (bijvoorbeeld als SSSOM-mapping).

  *Voorbeeld (bouwdeel):*

  | Concept | Element | Definitie |
  |---|---|---|
  | Aanstraalverlichting | Bebording en bewegwijzering (statisch) | Armatuur met lichtbron voor het zichtbaar maken van objecten en/of installaties |
  | Aanstraalverlichting | Dynamische bewegwijzering en informatiesystemen | idem |
  | Aanstraalverlichting | Objectverlichting | idem |

- De werkgroepen leveren beslis-records, geen kant-en-klare modelwijzigingen. Het samenvoegen (stap 4) en de controle en terugkoppeling (stap 5) zijn werk van de modelleur namens de werkgroep Methodiek, in samenwerking met de inhoudelijke werkgroepen.
- ...

### Beslisflow in beeld

Het diagram hieronder toont de wizard die je per concept doorloopt: scherm 1 (wat is het), scherm 2 (waar wringt het), scherm 3 (wat doen we ermee) en scherm 4 (de drie regels die altijd gelden). De uitvoer is een beslis-record.

{::nomarkdown}
<pre class="mermaid">
{% include_relative assets/diagrammen/beslisflow.mmd %}
</pre>
{:/}

---

## 6. Voorbeelduitwerkingen

Vier concepten uit de vier werkgroepen, plus een vijfde, illustratief voorbeeld (Signaalkabel) dat de specialisatie-weeffout toont. Elke rij volgt de volgorde van het proces: eerst de twee dimensies en de betekenisrelatie (stap 1), dan de vergelijking (stap 2), en ten slotte de representatie, naam en definitie (stap 3). De uitkomsten zijn **voorwaardelijk**: ze gelden mits de dimensiezijde van *beide* bronnen is vastgesteld.

### 6.1 Landhoofd

Het voorbeeld betreft 'Landhoofd (Kunstwerken)' en `imbor:Landhoofd`. NEN-bouwdeel 1326 "Landhoofd" hangt onder element 202 "Steunpunt" (belang Hoog), dat op zijn beurt hangt onder twaalf beheerobjecten. IMBOR kent de klasse `Landhoofd` (bovenliggend: `Kunstwerkdeel`) en koppelt die als `hasPart` aan een aantal kunstwerken (`Vaste brug`, `Beweegbare brug`, `Viaduct`, `Aquaduct`, `Ecoduct`, `Overkluizing`, `Flyover`).

| Stap | Uitkomst |
|---|---|
| **1. ruimtelijk/reëel** | **Reëel.** Tastbare constructie, vormvast (`DiscreetObject`). In IMBOR en NEN 2767 gelijk; geen dimensieconflict. |
| **1. functioneel/technisch** | **Technisch.** De NPR-definitie bevat functiewerkwoorden ("zorgt voor het dragen … het keren"), maar die beschrijven wat het object *doet*; het object zélf is een constructie (`Kunstwerkdeel`). Ook IMBOR modelleert het technisch (`Kunstwerkdeel`). Geen dimensieconflict. |
| **1. bestaat in IMBOR** | `skos:exactMatch`. Beide bronnen bedoelen hetzelfde objecttype: IMBOR kent `Landhoofd` als subklasse van `Kunstwerkdeel`. |
| **2. vergelijking** | **Geen wrijving op conceptniveau**: technisch object, netjes op zijn niveau. Wel een opvallend verschil in de structuur: NEN koppelt Landhoofd aan één *element* ("Steunpunt"), IMBOR direct als onderdeel aan de kunstwerken zelf. Dat "Steunpunt" functioneel klinkt, maakt de koppeling Landhoofd→Steunpunt nog geen implementatierelatie; zolang beide aanwijsbare objecten zijn, is het gewoon een `hasPart`. |
| **3. concept** | **Samenvallen** (beslistabel concepten: *Samenvoegen*). `skos:exactMatch`; NEN 1326 integreren in `imbor:Landhoofd`. |
| **3. relatie** | De NEN-koppeling Landhoofd→Steunpunt blijft een `hasPart` (beide zijn aanwijsbare objecten). Alleen als "Steunpunt" als *puur functioneel* element zou worden opgevat (geen aanwijsbaar ding), komt herontwerp in beeld. Bijvoorbeeld opsplitsen in de aanwijsbare **Eindsteunpunt** en **Tussensteunpunt**, elk met hun eigen bouwdelen. Dat is hier niet nodig. IMBOR's directe `hasPart` van de kunstwerken kan blijven staan. |
| **3. naam** | `skos:prefLabel` "Landhoofd" |
| **3. definitie** | Harmoniseren tot één: de topologische positie van IMBOR ("overgang aardebaan naar kunstwerk") plus de functie van NEN ("dragen hoofddraagconstructie, keren grondlichaam"). Bijvoorbeeld: *"Ondersteuningsconstructie ter plaatse van de overgang van de aardebaan naar een kunstwerk, die de hoofddraagconstructie draagt en het aansluitende grondlichaam keert."* |
| **payload** | Belang Hoog blijft op de `hasPart`-relatie Landhoofd→Steunpunt. Materialen (Hout, Beton, Steen) en de bijbehorende gebreken blijven aan het technische concept `Landhoofd` hangen. |

**Conclusie:** een schone `exactMatch`; de koppeling Landhoofd→Steunpunt is een zuivere `hasPart` (geen weeffout). Alleen als "Steunpunt" als puur functioneel element wordt opgevat, is herontwerp (bv. Eindsteunpunt/Tussensteunpunt) aan de orde.

### 6.2 Verkeersbord

Het voorbeeld betreft 'Verkeersbord (Wegmeubilair)' en `imbor:Verkeersbord`. NEN-bouwdeel 1586 "Verkeersbord" hangt onder element 111 "Bebording en bewegwijzering (statisch)" (belang Laag), dat onder een grote groep beheerobjecten hangt (weg, viaduct, verzorgingsplaats, rivier, kanaal, en vele meer). IMBOR kent de klasse `Verkeersbord` (bovenliggend: `Bord`, daaronder o.a. `Bewegwijzeringsbord`, `Informatiebord`, `Straatnaambord`).

| Stap | Uitkomst |
|---|---|
| **1. ruimtelijk/reëel** | **Reëel.** Tastbaar bord, vormvast (`DiscreetObject`). Beide zijden gelijk; geen dimensieconflict. |
| **1. functioneel/technisch** | **Technisch.** Het object is een constructie (`Bord`, bovenliggend: `Constructie`). Het *element* 111 ("Bebording en bewegwijzering", `-ing`) is daarentegen functioneel, maar het bouwdeel Verkeersbord zelf is technisch. IMBOR modelleert het ook technisch. Geen dimensieconflict. |
| **1. bestaat in IMBOR** | `skos:exactMatch`. IMBOR kent `Verkeersbord` al, met eigen attributen (bordcode, reflectieklasse, bordafmeting) → dus een echte klasse, geen verschijningsvorm. |
| **2. vergelijking** | **Geen wrijving op conceptniveau.** Beide kennen precies dezelfde bordsoorten (NEN-bouwdelen 1073/1586/1822/1903/1242 en de IMBOR-subklassen van `Bord` kennen dezelfde soorten), dus het detailniveau is gelijk. Het enige verschil is de structuur: NEN koppelt ze plat als bouwdelen onder element 111, IMBOR als taxonomie onder `Bord`. |
| **3. concept** | **Samenvallen** (beslistabel concepten: *Samenvoegen*). NEN 1586 integreren met `imbor:Verkeersbord`; de zusterbouwdelen (1073, 1822, 1903, 1242) samenvallen met de overeenkomstige IMBOR-subklassen. |
| **3. relatie** | Hier speelt de vierde wrijving: element 111 "Bebording en bewegwijzering (statisch)" is geen aanwijsbaar ding maar een **groepering** (`hasMember`) van borden en bewegwijzering. De koppeling bouwdeel→element-111 is daarom geen `hasPart`; het element valt uiteen in de afzonderlijke, aanwijsbare dingen. Daarmee vervalt ook de reden om hier `isGeimplementeerdDoor` te gebruiken. Na opsplitsing hangt elk bord als `hasPart` onder het geheel waar het feitelijk deel van is (het beheerobject, of een echt aanwijsbaar tussenliggend element indien dat er is), niet langer onder de verdwenen groepering 111. |
| **3. naam** | `skos:prefLabel` "Verkeersbord" (IMBOR-schrijfwijze). |
| **3. definitie** | NEN NPR: "Bord waarop een wegverkeersteken is aangebracht en waarvan de uitvoering wettelijk is voorgeschreven" ≈ IMBOR: "wettelijk vastgesteld teken ter regeling, waarschuwing, geleiding of informering van het verkeer". Beide objectmatig en wettelijk verankerd → lichte harmonisatie tot één definitie. |
| **payload** | Belang Laag zat op de relatie element-111→bouwdeel; omdat die groepering als ankerpunt vervalt, wordt belang per afzonderlijk bord **bewust opnieuw verankerd** op de nieuwe deel-relatie (bord→beheerobject of →aanwijsbaar element) en vastgelegd in het koppelpunt-register (payload-regel 3). Materialen (Hout, Kunststof, Staal) en gebreken (o.a. vervuiling, corrosie bevestiging) blijven aan het technische concept `Verkeersbord` hangen. |

**Conclusie:** een schone `exactMatch` met gelijk detailniveau; de taxonomie aan IMBOR-zijde (subklassen onder `Bord`) dekt de NEN-bouwdeelsoorten al. Het echte punt is het element 111: dat is geen aanwijsbaar ding maar een groepering, en valt uiteen in de losse borden en bewegwijzering (vierde wrijving).

### 6.3 Fauna-uittreedplaats

Het voorbeeld betreft 'Fauna-uittreedplaats (Groen)' en `imbor:Fauna-uittreedplaats`. NEN-element 131 "Fauna uittreedplaats" hangt onder zes waterbeheerobjecten (Aquaduct, Kanaal, Meer, Rivier, en de twee "Water en watergang"-categorieën) en is opgebouwd uit tien bouwdelen (o.a. Damwand boven-/onderwatertalud, Filterconstructie, Grondlichaam, Loopplank, Rooster, Zinkstuk, Toplaag). IMBOR kent de klasse `Fauna-uittreedplaats` (bovenliggend: `Faunavoorziening`) met twee verschijningsvormen (groot wild, watervogels).

| Stap | Uitkomst |
|---|---|
| **1. ruimtelijk/reëel** | **Onbepaald.** De NPR-definitie ("constructie langs een steile of verticale oever") is reëel; de IMBOR-definitie ("talud, trap, of ander schuin vlak") neigt ook naar reëel maar heeft een sterke ruimtelijke/locatie-component. → **fallback (U3):** voorlopig onder generiek `FysiekObject` plaatsen en als open vraag noteren; geen keuze forceren. |
| **1. functioneel/technisch** | **Functioneel** (voorlopig; te bevestigen door werkgroep Groen). Niet omwille van de `-voorziening`-naam of de functiegerichte definitie — dat is slechts een signaal (Vaststelling 2) — maar omdat dezelfde functie (fauna laten uittreden) in **meerdere technische vormen** wordt gerealiseerd: "talud, trap, of ander schuin vlak". Dat is de signatuur van een functionele eenheid, niet van één context-onafhankelijk technisch object (vergelijk Verkeersbord: juist één technisch ding met een functie in de naam). NEN 2660-2 §6.4 noemt deze keuze nadrukkelijk interpretatie-afhankelijk; daarom niet forceren. |
| **1. bestaat in IMBOR** | `skos:closeMatch` (nog geen `exactMatch`). De definities overlappen maar sluiten elkaar deels uit: NEN "steile of verticale oever" vs. IMBOR "schuin vlak". Pas ná definitie-harmonisatie kan dit `exactMatch` worden. Dit is een *voorlopige* `closeMatch` door een definitie-mismatch op **hetzelfde** object, niet de eindtoestand "partieel overlappend" (geen van beide concept bevat de ander) uit de tabel in stap 1. |
| **2. vergelijking** | **Definitieconflict.** Dit is het scherpste voorbeeld van definities die elkaar vrijwel uitsluiten: een "schuin vlak" (IMBOR) is geen "constructie langs een steile oever" (NEN), terwijl het wel hetzelfde beheerde object is. Verder is de structuur verschillend: NEN decomposeert het element in tien bouwdelen; IMBOR kent alleen twee verschijningsvormen (groot wild / watervogels). |
| **3. concept** | **Voorlopig samenvallen** (beslistabel concepten: *Samenvoegen*; voorwaardelijk). Pas definitief `exactMatch` ná harmonisatie van de definitie. De twee IMBOR-verschijningsvormen blijven waarden, geen subklassen. |
| **3. relatie** | Volgt uit de dimensiekeuze. Is Fauna-uittreedplaats **functioneel** (zie boven), dan worden de tien technische bouwdelen `isGeimplementeerdDoor`, geen `hasPart`; wordt het toch technisch opgevat, dan is het een zuivere `hasPart`. Hoe dan ook is de decompositie een toevoeging aan IMBOR (daar ontbreekt ze nog). |
| **3. naam** | `skos:prefLabel` "Fauna-uittreedplaats" (IMBOR-schrijfwijze); NEN "Fauna uittreedplaats" (zonder koppelteken) als `skos:altLabel`. |
| **3. definitie** | **Kernprobleem.** Eén geharmoniseerde, functiegerichte definitie opstellen die beide uitvoeringsvormen dekt, bijvoorbeeld: *"Voorziening (constructie, talud of trap) langs of in een oever van een watergang, waarmee (te water geraakte) dieren aan land kunnen komen."* |
| **payload** | Belang (o.a. Hoog voor de meeste bouwdelen) hangt op de element→bouwdeel-relatie — welk type die ook krijgt (`hasPart` of `isGeimplementeerdDoor`); materialen en gebreken blijven aan de tien bouwdelen hangen. |

**Conclusie:** hier is géén schone match zonder werk: de definities moeten eerst geharmoniseerd worden (steil/verticaal vs. schuin vlak) voordat `exactMatch` houdbaar is. Dat is inhoudelijk werk voor de groep Groen, en precies wat de methode bloot moet leggen. Tegelijk is dit — mits Groen "functioneel" bevestigt — de eerste echte `isGeimplementeerdDoor`-casus: één functionele eenheid, tien technische bouwdelen.

### 6.4 Onderlaag

Het voorbeeld betreft 'Onderlaag (Verharding)' en de IMBOR-klasse `Constructielaag`. NEN-bouwdeel 2175 "Onderlaag" hangt onder zeven elementen "Verharding wegtype 1 t/m 7" (belang Hoog), die onder het beheerobject "Weg" hangen. IMBOR kent géén klasse "Onderlaag", wel de klasse `Constructielaag` met het classificerende attribuut `constructielaagsoort`.

| Stap | Uitkomst |
|---|---|
| **1. ruimtelijk/reëel** | **Reëel.** Een vormvaste constructielaag (`DiscreetObject`; vgl. NPR 4660 §6). Beide zijden gelijk; geen dimensieconflict. |
| **1. functioneel/technisch** | **Technisch.** Een constructielaag, naar samenstelling gemodelleerd. IMBOR modelleert `Constructielaag` ook technisch. Geen dimensieconflict. |
| **1. bestaat in IMBOR** | `skos:narrowMatch`. Een onderlaag ís een constructielaag, maar onderscheidt zich van `Constructielaag` alleen door de **laagpositie**: een eigenschapswaarde, geen eigen attributen. |
| **2. vergelijking** | **Geen dimensie-wrijving, maar wel een representatievraag.** De laag is technisch en past bij `Constructielaag`, maar NEN maakt er een benoemd bouwdeel van (met eigen conditiescore), terwijl IMBOR geen aparte klasse heeft. Dit is het schoolvoorbeeld van: niet elk NEN-bouwdeel is een klasse. |
| **3. concept** | **Wordt verschijningsvorm** (beslistabel concepten: *Algemener maken tot een bestaande klasse*): "onderlaag" wordt een waarde van het classificerende attribuut `constructielaagsoort` bij de klasse `Constructielaag`, geen eigen klasse. De klasse `Constructielaag` blijft het object dat je vastlegt en inspecteert (de conditiescore kan er dus aan hangen). |
| **3. relatie** | De koppeling bouwdeel→element-verharding blijft qua *type* een `hasPart`, maar het uiteinde wordt **verlegd**: niet "Onderlaag" maar `Constructielaag` is voortaan het deel van de wegconstructie (het bouwdeel-uiteinde valt samen met `Constructielaag`). |
| **3. naam** | Geen nieuwe klasse-naam. De waarde opnemen in de `constructielaagsoort`-lijst van `Constructielaag` (die nu waarden bevat als *Asfaltverharding (onderlaag)*, materiaal + laagpositie gecombineerd). |
| **3. definitie** | Definitie van de **waarde** (geen klasse). Openstaand (inhoudelijk): de `constructielaagsoort`-lijst combineert nu verhardingstype + laagpositie en moet mogelijk heringedeeld worden zodat "onderlaag" materiaal-onafhankelijk kan. |
| **payload** | Belang Hoog blijft op de relatie naar de verharding. Materialen (Zand, Asfaltbeton, Cementbeton) en gebreken blijven aan de `Constructielaag`-instantie hangen; die blijft dus het adresseerbare inspectie-object. |

**Conclusie:** het scherpste bewijs dat niet elk NEN-bouwdeel een klasse wordt: "onderlaag" is een laagpositie (waarde), niet een apart objecttype. Cruciaal is dat de klasse `Constructielaag` het inspecteerbare object blijft, zodat de conditiemeting er aan kan blijven hangen. Het herindelen van de `constructielaagsoort`-lijst is inhoudelijk werk, geen classificatievraag.

### 6.5 Signaalkabel (illustratief)

Dit vijfde voorbeeld hoort niet bij één van de vier pilotwerkgroepen; het is toegevoegd om de **specialisatie-weeffout** (derde wrijving → `subClassOf`) te tonen, die in 6.1–6.4 niet aan bod kwam. NEN-element 113 "Kabel" heeft zes "bouwdelen" (alle belang Hoog): 1063 "Kabel, Algemeen", 1185 "Energiekabel", 1222 "Glasvezelkabel", 1493 "Signaalkabel", 1668 "Installatiekabel" en 2073 "Beschermlaag". De eerste vier (naast de generieke 1063) zijn echter *soorten kabel*, geen *onderdelen van* een kabel; "Beschermlaag" (2073) is geen kabelsoort en blijft buiten deze correctie. IMBOR heeft precies de juiste structuur al: `Kabel` (▸ `Leiding` ▸ `Constructie`) met subklassen, waaronder `Datakabel` (*"Kabel voor de voortgeleiding van een signaal"*) en `Voedingskabel` (*"Kabel voor geleiding van energie"*). IMBOR modelleert de kabelsoorten dus al als **specialisaties**, niet als onderdelen. Dit is het schoolvoorbeeld van "kijk eerst in IMBOR, grote kans dat het antwoord er al is".

| Stap | Uitkomst |
|---|---|
| **1. ruimtelijk/reëel** | **Reëel.** Een kabel is tastbaar en als één object aanwijsbaar (`DiscreetObject`). |
| **1. functioneel/technisch** | **Technisch.** Een kabel is een technisch object (waaruit het bestaat). Dat de soorten zich onderscheiden naar functie (signaal, energie, glasvezel) maakt ze niet functioneel: elk is een aanwijsbaar technisch object met een eigen materiaal- en gebrekprofiel. |
| **1. bestaat in IMBOR** | `skos:closeMatch` met `imbor:Datakabel` (*"Kabel voor de voortgeleiding van een signaal"*), een subklasse van `Kabel`. Zelfde concept, label en definitie nog te harmoniseren (Signaalkabel ↔ Datakabel); daarna mogelijk `exactMatch`. (Parallel: NEN Energiekabel ↔ `imbor:Voedingskabel`.) |
| **2. vergelijking** | **Specialisatie verkleed als decompositie (derde wrijving).** *Toets:* "Signaalkabel is een **onderdeel van** Kabel" (nee) vs. "Signaalkabel is een **soort** Kabel" (ja). De NEN-relatie Kabel `hasPart` Signaalkabel is dus eigenlijk een `subClassOf`; IMBOR bevestigt dat (`Datakabel subClassOf Kabel`). Hetzelfde geldt voor Energiekabel/Glasvezelkabel/Installatiekabel. |
| **3. concept** | **Markeren als `subClassOf`** van `Kabel` (beslistabel concepten: *soort van iets anders*), en **samenvallen** met de bestaande `imbor:Datakabel`. De kabelsoorten verdienen een eigen (sub)klasse, geen verschijningsvorm, omdat ze zich onderscheiden door **andere toegestane materialen en dus andere gebreken**; dat is precies waarom IMBOR ze al als aparte subklassen kent. |
| **3. relatie** | De NEN-relatie Kabel `hasPart` Signaalkabel **wordt `subClassOf`**, conform de structuur die IMBOR al heeft. Gat-controle: `Kabel` blijft als technisch object bestaan, met zijn echte onderdelen (zoals `Beschermlaag`) als `hasPart`, zodat er geen gat op bouwdeelniveau valt. |
| **3. naam** | `skos:prefLabel` volgt IMBOR ("Datakabel"); NEN "Signaalkabel" wordt `skos:altLabel` (synoniem), mits de definitie-harmonisatie bevestigt dat het hetzelfde concept is. |
| **3. definitie** | Harmoniseren: NEN "Signaalkabel" met IMBOR `Datakabel` (*"Kabel voor de voortgeleiding van een signaal"*). Nagaan of "signaal" breder is dan "data"; zo niet, dan `exactMatch`. Geen conditiemeting-/gebrekentaal in de objectdefinitie. |
| **payload** | Materiaalsoorten en bijbehorende gebreken reizen mee met de subklasse (`Datakabel`). Belang Hoog zat op de (onjuiste) deel-relatie; bij het omzetten naar `subClassOf` wordt belang bewust opnieuw verankerd op de echte deel-relatie van `Kabel` in zijn geheel, en vastgelegd in het koppelpunt-register. |

**Conclusie:** een zuivere specialisatie-correctie. Vier "bouwdelen" onder element "Kabel" zijn soorten kabel en worden `subClassOf`, geen `hasPart`. Het concept blijft een volwaardige (sub)klasse, juist omdat de materialen en gebreken per kabelsoort verschillen (contrast met Onderlaag, dat een waarde werd). En doordat IMBOR deze structuur al correct heeft (`Datakabel`/`Voedingskabel` als subklassen van `Kabel`), is dit meteen de illustratie van de regel "kijk eerst in IMBOR": de weeffout-correctie sluit aan op wat er al staat, in plaats van iets nieuws te verzinnen.

### 6.6 Wat de voorbeelden aantonen
- De methode leidt tot **herleidbare, maar voorwaardelijke** uitkomsten: 2 vrij zekere samenvallers (Landhoofd, Verkeersbord, mits bevestiging van de dimensiezijde), 1 voorwaardelijke samenvaller met open punten (Fauna), 1 verschijningsvorm (Onderlaag), en 1 specialisatie-correctie (Signaalkabel → `subClassOf`, conform de structuur die IMBOR al heeft).
- **Niet elke element→bouwdeel-overgang is een weeffout.** Bij Landhoofd is de `hasPart` gewoon correct (beide aanwijsbaar); bij Verkeersbord zit de wrijving niet in functioneel/technisch maar in een groepering die als element is opgevoerd. De methode dwingt om per relatie te kijken wát er werkelijk aan de hand is.
- De dimensies blokkeren nergens onterecht een subklasse; waar de dimensie ruimtelijk/reëel onbepaald is (Fauna) grijpt de fallback naar het generieke concept, geen geforceerd oordeel.
- De methode scheidt **classificatiewerk** (stap 1) van **inhoudelijk harmonisatiewerk** (definitie-harmonisatie, domeinlijst-herindeling).
- Met Signaalkabel erbij is de specialisatie-weeffout (`subClassOf`) nu wél gedekt, en meteen een illustratie dat IMBOR de juiste structuur vaak al heeft ("kijk eerst in IMBOR"). Nog niet onvoorwaardelijk getest: een puur-functioneel element dat `isGeimplementeerdDoor` vereist (Fauna is hiervan een *voorwaardelijke* casus, zie 6.3, mits werkgroep Groen "functioneel" bevestigt), een concept zónder IMBOR-tegenhanger (noteer de beoogde ouderklasse), `broadMatch`, een blijvende partiële overlap (`closeMatch`/`relatedMatch` als eindstatus: de `closeMatch` bij Fauna is voorlopig en gaat naar `exactMatch`), en een herhaalde deel-rol. Zulke lastige gevallen zijn juist een proefpunt voor een eventuele kalibratieronde over de werkgroepen heen (nog openstaand).
