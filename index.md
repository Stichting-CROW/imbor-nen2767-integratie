---
title: Uitgangspunten integratie NEN 2767-4 & IMBOR
header:
  overlay_color: "#b1501f"
  overlay_filter: "0.3"
  tagline: "Een werkbare, herleidbare methode om concepten uit NEN 2767-4 te integreren met IMBOR"
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
De klassen in IMBOR krijgen een typische decompositie die gebaseerd is op NEN 2767-4. Deze decompositie is bedoeld voor conditiemeting binnen assetmanagement. Bij het opnemen in IMBOR wordt de bestaande decompositie van NEN 2767-4 bijgewerkt volgens de inzichten van NEN 2660. De driedeling Beheerobject–Element–Bouwdeel uit NEN 2767-1 blijft daarbij behouden als indeling in niveaus. De decompositie bevat wel weeffouten in de modellering. Die worden gecorrigeerd:
- Functioneel en technisch door elkaar. In NEN 2767-4 is een element doorgaans functioneel gedefinieerd, op basis van de verlangde functie. Een bouwdeel is doorgaans technisch gedefinieerd, naar samenstelling of constructiewijze. Volgens NEN 2660-2 is de overgang van element naar bouwdeel daarom eigenlijk geen `nen2660:hasPart`-relatie. Het is een implementatierelatie (`nen2660:isImplementedBy`): het element wordt geïmplementeerd door één of meer bouwdelen.
- Specialisaties gemodelleerd als decompositie. Veel 'decomposities' zijn in werkelijkheid specialisaties. Een voorbeeld is "Kabel hasPart Signaalkabel". Dat is een specialisatierelatie en geen 'onderdeel van'-relatie.

>De hasPart-relatie zelf is in NEN 2660-2 eenduidig. Welke decompositie je maakt, hangt wel af van het **doel** en het **perspectief**. Daarom wordt de typische decompositie in IMBOR uitdrukkelijk vastgelegd als decompositie voor conditiemeting. Sommige partijen kiezen ervoor om middels deze decompositie ook hun areaal in te delen. Zo ondersteunt ze ook het proces van instandhouding.
{: .notice--warning}

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

## 3. Terminologie en uitgangspunten

### Terminologie
We gebruiken een klein aantal termen consistent:

- **(bron)concept**: een te beoordelen eenheid uit NEN 2767-4 (een beheerobject, element of bouwdeel) of IMBOR. Neutraal: het zegt nog niets over de uitkomst.
- **klasse**: een concept kan een klasse worden na classificatie in IMBOR, of een bestaande IMBOR-klasse.
- **relatie**: een verbinding tussen concepten (`hasPart`, `isImplementedBy`, `subClassOf`, `isBegrensdDoor`, …).
- **betekenisrelatie**: de mate van overeenkomst tussen een NEN 2767-4-concept en een IMBOR-concept, uitgedrukt met een SKOS-predicaat (`exactMatch`, `narrowMatch`, `broadMatch`, `closeMatch`, of geen tegenhanger).
- **decompositie**: het geheel van concepten met hun `hasPart`-relaties.
- **NEN-niveau**: beheerobject, element of bouwdeel.
{: .notice--info}

### Uitgangspunten

- **U1: Opnemen waar mogelijk, niet persé als klasse.** De concepten uit NEN 2767-4 worden zoveel mogelijk opgenomen in IMBOR. "Opnemen" kent meerdere vormen: twee concepten die **samenvallen** (integreren tot één), een **subklasse**, een **verschijningsvorm** op een instantieerbare klasse, een **onderdeel** (`hasPart`), of een **materiaal** in de materie-tak. De wens is dat elk in-scope concept een expliciete, herleidbare representatie of mapping krijgt, niet dat elk concept een eigen klasse wordt.
- **U2: De ALIM-dimensies zijn disjunct (NEN 2660-2).** De dimensies ruimtelijk/reëel (§6.2), functioneel/technisch (§6.4) en gepland/gerealiseerd (§6.5) zijn in de NEN 2660-ontologie vastgelegd als disjunct. Een klasse kan _niet aan beide zijden van een dimensie hangen_. Waar bronconcepten op verschillende dimensiezijden vallen, is daarom een **relatie** nodig, geen subklasse.
- **U3: Classificeren op een dimensie is optioneel (NEN 2660-2 §6.6).** Is een dimensie niet relevant of niet eenduidig te bepalen, dan volstaat het generieke concept (`FysiekObject` resp. `Entiteit`) zonder keuze. Forceer geen keuze waar die niets toevoegt, dat levert schijnprecisie op. _Noteer een onbepaalde dimensie als open vraag._
- **U4: Betekenis vóór representatie.** Bepaal eerst wát een concept betekent en hoe het zich tot een IMBOR-klasse verhoudt; kies pas daarna hoe je het modelleert. Zo voorkom je dat een modelleergemak (bv. "geen eigen attributen") een betekenisoordeel vervangt.
- **U5: Taxonomie vóór decompositie.** Bepaal eerst welke klassen er zijn en pas daarna hoe ze samenhangen. Hiermee importeren we de modelleringsfouten uit de NEN 2767-4-decompositie niet mee in IMBOR, en wordt de herziene decompositie een resultaat op basis van bewijs in plaats van een overname.
- **U6: De 'conditiemeting-payload' blijven herleidbaar.** Belang, Materiaalsoort en Gebrek (die noemen we payload) moeten na de herinrichting een geldig ankerpunt hebben. Elke wijziging aan een concept of relatie krijgt daarom een expliciete payload-bestemming (stap 3).

---

## 4. Het proces in vijf stappen

We werken van eenvoudig naar complex: eerst kijken we alleen naar de losse concepten (welke klassen zijn het?), en pas daarna naar de decompositie eromheen (hoe hangen ze samen?). Zo nemen we de modelleringsfouten uit de oude decompositie niet mee IMBOR in (zie U5).

| Stap | Wie | Wat gebeurt er |
|---|---|---|
| **1. Concepten op IMBOR leggen** | inhoudelijke werkgroep | Kijk per concept: bestaat dit al in IMBOR, en is het ruimtelijk/reëel en functioneel/technisch? |
| **2. Decompositie ernaast leggen** | inhoudelijke werkgroep | Leg de 'oude' NEN-decompositie over de geplaatste concepten en kijk waar het wringt. |
| **3. Decompositie bijwerken** | inhoudelijke werkgroep | Stel per concept en per relatie voor wat ermee moet gebeuren (zie de beslistabellen hieronder). |
| **4. Samenvoegen en controleren** | modelleur (werkgroep Methodiek) | Voeg de resultaten van de vier werkgroepen samen, stem ze op elkaar af en controleer ze. |
| **5. Aanhaken op IMBOR** | IMBOR-modelleurs | Weeg de nieuwe decompositie af tegen een eventueel al bestaande decompositie in IMBOR. |

**Waar we beginnen.** Het startpunt ligt al klaar voor de eerste pilotfase: de 80-20-lijst bevat per werkgroep de geselecteerde beheerobjecten, elementen en bouwdelen, met hun definities en hun onderlinge relaties. Die lijst is het vertrekpunt voor stap 1 en het vergelijkingspunt voor stap 2.

>*De oude NEN 2767-4-decompositie en een eventueel al bestaande decompositie in IMBOR zijn met een ander doel en vanuit een ander perspectief gemaakt.* We zetten ze naast elkaar, niet door elkaar. Hoe ze zich uiteindelijk tot elkaar verhouden, bepalen de IMBOR-modelleurs later (stap 5).
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

Verwar de *functionele dimensie* (hier, per concept) niet met de *functionele rol* van een niveau (een beheerobject, element of bouwdeel speelt een rol binnen een geheel). NEN 2660-2 §6.4 waarschuwt dat normen functioneel en technisch vaak onterecht in één hiërarchie mengen; dat corrigeren we.

*Bij twijfel:* laat de dimensie open (net zoals vaststelling 1).

#### Vaststelling 3: Bestaat het al in IMBOR?
Zoek het dichtstbijzijnde IMBOR-concept en bepaal de betekenisrelatie. Kijk daarbij naar **welke objecten eronder vallen**, niet naar welke attributen het concept heeft:

| Relatie | Predicaat | Betekenis |
|---|---|---|
| Identiek | `skos:exactMatch` | elke A is een B én omgekeerd |
| NEN smaller | `skos:narrowMatch` | elke NEN-A is een IMBOR-B, niet omgekeerd |
| NEN breder | `skos:broadMatch` | elke IMBOR-B is een NEN-A, niet omgekeerd |
| Partieel overlappend | `skos:closeMatch` / `relatedMatch` | overlap, geen van beide bevat de ander |
| Geen tegenhanger | n.v.t. | concept ontbreekt aan de IMBOR-kant |

Bij **geen tegenhanger**: noteer de beoogde **ouderklasse** in de IMBOR-taxonomie.

>**Wat stap 1 niet doet**: Geen representatiekeuze (subklasse, verschijningsvorm, vervallen), geen relaties, en niets met `hasPart`. Die beslissingen hebben de decompositie-context uit stap 2 en 3 nodig.
{: .notice--warning}

### Stap 2: Decompositie vergelijken

Leg de oude NEN-decompositie over de gemapte concepten (resultaat stap 1) en stel vast **waar het wringt**. Dit is nog diagnose; de beslissingen volgen in stap 3.

**Volgorde: eerst de concepten, dan pas de relaties.** Beoordeel in deze stap eerst *alle* concepten afzonderlijk, en ga daarna pas naar de relaties ertussen. De reden is dat een relatie altijd twee concepten verbindt: je kunt pas vaststellen of die relatie klopt of juist wringt wanneer beide uiteinden een uitkomst hebben. Van elk van de twee concepten moet dus al vaststaan op welk niveau het hoort, wat zijn dimensie is (ruimtelijk vs. reëel, functioneel vs. technisch) en hoe het op IMBOR mapt. Begin je andersom (bij de relaties) dan beoordeel je verbindingen waarvan de uiteinden nog kunnen verschuiven, en dat levert geen betrouwbare diagnose op.

>**Hergebruik als signaal.** Een concept dat onder veel andere concepten hangt, is vrijwel zeker een echte zelfstandige klasse; een concept dat maar op één plek voorkomt, is een kandidaat om te vervallen of een verschijningsvorm te worden.
{: .notice--info}

Let bij het vergelijken op drie typische wrijvingen:

1. **Niveau klopt niet met de dimensie.** Een concept staat op het niveau 'element' maar is technisch, of op 'bouwdeel' maar is functioneel. Kandidaat om van niveau te verschuiven in stap 3.
2. **Dimensieconflict tussen de twee bronnen.** Het NEN-concept en het dichtstbijzijnde IMBOR-concept vallen op verschillende zijden van een dimensie (ruimtelijk vs. reëel of functioneel vs. technisch). Dan is een subklasse uitgesloten en is een relatie nodig in stap 3.
3. **Specialisatie verkleed als decompositie.** Een weeffout in NEN 2767-4 is dat specialisaties als `hasPart` zijn gemodelleerd. *Toets:* vul in "X is een **onderdeel van** Y" versus "X is een **soort** Y". Een `Signaalkabel` is een *soort* `Kabel`, geen *onderdeel van* een kabel → dus eigenlijk een specialisatie, geen `hasPart`.

**Resultaat:** een diagnoselijst: per concept en per relatie de geconstateerde wrijving (of "geen wrijving").

---

### Stap 3: Decompositie herzien

Kies op basis van de diagnose (stap 2) per concept en per relatie precies één uitkomst.

#### Beslistabel concepten

Per concept is er één uitkomst uit onderstaande tabel van toepassing.

| Uitkomst | Wanneer |
|---|---|
| Blijft klasse op huidig niveau | match, dimensiezijde klopt met het niveau |
| Verschuift van niveau (tussen beheerobject / element / bouwdeel) | de dimensiekeuze of de mapping spreekt het huidige niveau tegen |
| Valt samen (met IMBOR- of andere NEN-klasse) | `exactMatch`, geen eigen onderscheid |
| Wordt verschijningsvorm (classificerend attribuut) | onderscheidt zich alleen als variant, niet door eigen attributen, relaties of beperkingen |
| Wordt materiaal (materie-tak) | is een stof, geen object |
| Splitst in meerdere klassen | één NEN-term dekt twee betekenissen |
| Vervalt | geen toegevoegde waarde naast IMBOR |

**Eigen klasse of verschijningsvorm?** Maak een concept niet te snel een verschijningsvorm omdat het "geen eigen attributen" heeft. Een concept verdient een eigen klasse zodra het zich onderscheidt door eigen **attributen, relaties óf beperkingen**. Dat laatste is in NEN 2767 vaak het geval: er zijn andere materialen toegestaan, en dus andere gebreken van toepassing, ook al heeft het concept geen extra attributen.


#### Beslistabel relaties

Per bestaande `hasPart`-relatie is er één uitkomst uit de onderstaande tabel van toepassing.

| Uitkomst | Wanneer |
|---|---|
| Blijft `hasPart` | echte deel-van, beide uiteinden zelfde dimensiezijde |
| Wordt `subClassOf` | was eigenlijk een specialisatie (is-een), geen deel-van |
| Wordt `isImplementedBy` | functioneel→technisch-overgang (o.a. element→bouwdeel) |
| Wordt `isBegrensdDoor` / `bevat` | overgang ruimtelijk vs. reëel |
| Verlegd | een uiteinde is samengevallen of verschoven |
| Vervalt | een uiteinde vervalt, of de relatie is betekenisloos |

**Waarom een relatie en geen subklasse (bij een dimensieconflict).** Vallen de twee uiteinden op verschillende zijden van een dimensie, dan is een subklasse niet mogelijk (U2: de dimensies zijn disjunct, dat zou een lege klasse opleveren). Dan geldt:
- **ruimtelijk vs. reëel** → `isBegrensdDoor` (`isBoundBy`; een ruimtelijk gebied wordt begrensd door een reëel object) of `bevat` (`contains`).

>Niet verwarren met `heeftBegrenzing`/`hasBoundary`, dat naar geometrie wijst.
{: .notice--warning}

- **functioneel vs. technisch** → `isGeimplementeerdDoor` (`isImplementedBy`): de functionele kant wordt geïmplementeerd door de technische (FUTS / "hamburgermodel").

>Dit is ook de correctie op de element→bouwdeel-relatie uit §1.
{: .notice--warning}

Een dimensieconflict betekent niet automatisch dat zo'n relatie geldt; het sluit alleen de subklasse uit. Welke relatie past, vergt eigen afweging.

#### Verschijningsvorm i.p.v. klasse
IMBOR gebruikt een [classificerend attribuut](https://docs.crow.nl/imbor/techdoc/#classificerende-attributen) voor detailleringen van een objecttype die geen eigen informatiebehoefte hebben. In plaats van voor elke variant een aparte klasse te maken, worden de varianten waarden in één lijst bij de klasse. Het algemene classificerende attribuut heet `verschijningsvorm`; daarnaast bestaan objectspecifieke varianten (bijvoorbeeld `constructielaagsoort` op `Constructielaag`). Zo heeft de klasse `Band` een `verschijningsvorm` met waarden als *Trottoirband*, *Opsluitband* en *Parkeerband*.

Een NEN 2767-concept kan zo'n waarde worden in plaats van een eigen klasse. Let op: de klasse zelf (bijvoorbeeld `Band`) blijft bestaan en blijft het object dat je vastlegt en inspecteert. Het classificerende attribuut zegt alleen *welke variant* het is; gebreken, conditiescore en onderhoudshistorie blijven aan het object hangen.

#### Naam en definitie vastleggen
Zodra de representatie vaststaat, leg je voor het concept de naam en definitie vast. Hoeveel werk dat is, hangt af van de gekozen uitkomst: bij **samenvallen** harmoniseer je label en definitie van beide bronnen tot één; bij een concept dat een **klasse blijft, een subklasse wordt of van niveau verschuift** controleer je of naam en definitie aan de regels voldoen; bij een **verschijningsvorm** gaat het om de naam en definitie van de waarde, niet van een klasse; bij **vervallen** is er niets vast te leggen.

##### Eenduidige namen (NEN 2660-2 §8.4)
- **Eén uniek voorkeurslabel per concept:** De NEN-term wordt een synoniem als die hetzelfde concept aanduidt (bij `exactMatch`); bij een smaller/breder/overlappend concept is de NEN-term geen synoniem.
- **Schrijfwijze:** klasse-/objecttypenamen in CamelCase met hoofdletter; attribuut- en relatienamen in camelCase. **Enkelvoud**, behalve bij groepsaanduidingen.
- **Naamgeving als signaal, niet als bewijs.** De `-ing`/`-constructie`-heuristiek helpt classificeren maar mag die nooit overrulen; een naam die "constructie" zegt terwijl het functioneel is gemodelleerd (of omgekeerd) is een signaal om te heroverwegen.
- **Geen twee concepten met hetzelfde voorkeurslabel.** Bij een homoniem disambigueren in het label (context tussen haakjes).

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
3. **Bij vervallen van een concept: payload expliciet heralloceren.** Valt een bouwdeel weg, dan gaat de payload bewust mee naar het concept waarin het opgaat, óf wordt bewust afgevoerd. Dit is een **verplicht veld in het beslis-record**: "waar gaat belang/materiaal/gebrek heen?".
4. **Koppelpunt-register.** Per gewijzigd concept of gewijzigde relatie leg je vast waar de payload landt. Dat register is het bewijs dat de conditiemeting na herinrichting volledig herleidbaar is.

---

### Stap 4: Samenvoegen en controleren

De vier inhoudelijke werkgroepen leveren **beslis-records**, geen kant-en-klare modelwijzigingen. In stap 4 brengt de modelleur, namens de werkgroep Methodiek, die vier opleveringen samen tot één voorstel en controleert dat op consistentie.

- **Samenvoegen.** Leg de beslis-records van de vier werkgroepen naast elkaar en consolideer ze tot één samenhangende set klassen, relaties en mappings.
- **Afstemmen.** Verzoen concepten die onder meerdere werkgroepen vallen (bijvoorbeeld Leuning, onder Kunstwerken én Wegmeubilair): één voorkeurslabel en één geharmoniseerde definitie. Los dubbelingen en tegenstrijdige dimensiekeuzes centraal op.
- **Controleren.** Toets de samengevoegde decompositie machinematig tegen de NEN 2660-patronen met bijvoorbeeld SHACL: disjuncte dimensies (U2), een geldig relatietype per verbinding (`hasPart` / `isImplementedBy` / `subClassOf` / `isBegrensdDoor`) en definities naar genus-en-differentia. En controleer dat elk payload-element (belang, materiaalsoort, gebrek) een geldig ankerpunt houdt.

>**Resultaat:** één geconsolideerde, gevalideerde decompositie met mappings, nog als voorstel vanuit de werkgroep Methodiek, klaar om in stap 5 op IMBOR aan te haken.
{: .notice--info}

---

### Stap 5: Aanhaken op IMBOR

In de laatste stap nemen de **IMBOR-modelleurs** het geconsolideerde voorstel uit stap 4 over en bepalen hoe het zich verhoudt tot wat er al in IMBOR staat.

- **Afwegen tegen de bestaande structuur.** Weeg de nieuwe decompositie (voor conditiemeting) af tegen een eventueel al bestaande decompositie in IMBOR. Beide zijn met een ander doel en vanuit een ander perspectief gemaakt; pas hier beslissen de IMBOR-modelleurs hun definitieve verhouding naast elkaar, geïntegreerd of vervangend.
- **Opnemen in IMBOR.** Verwerk de uitkomst in IMBOR volgens het reguliere IMBOR-beheer- en releaseproces.

>Dit is het moment waarop de keuze valt die tot nu toe bewust openstond: de oude NEN 2767-4-decompositie en de bestaande IMBOR-decompositie zijn tot nu toe *naast* elkaar gezet, niet *door* elkaar. Hier bepalen de IMBOR-modelleurs hun uiteindelijke verhouding.
{: .notice--warning}

---

## 5. 'Invulformulier' inhoudelijke werkgroepen

***NADER UIT TE WERKEN...***

- Beslis-record per concept. Leg per concept het eindresultaat van de stappen vast: dimensie ruimtelijk/reëel, dimensie functioneel/technisch (incl. "onbepaald"), betekenisrelatie (stap 1); gekozen representatie en payload-bestemming (stap 3); plus onderbouwing, open vragen en reviewer. Dit maakt elke keuze herleidbaar en vergelijkbaar, en maakt "onopgelost: nadere beslissing nodig" een geldige uitkomst. Leg het vast in een vaste tabel; die kan later machineleesbaar worden geëxporteerd (bijvoorbeeld als SSSOM-mapping).
- De werkgroepen leveren beslis-records, geen kant-en-klare modelwijzigingen. Het samenvoegen van de vier opleveringen, de consolidatie en de SHACL-controle tegen de NEN 2660-patronen zijn werk van de modelleur namens de werkgroep Methodiek (stap 4).
- ...

### Beslisflow in beeld

Het diagram hieronder vat de drie stappen samen tot één beslisflow: de drie vaststellingen van stap 1, de diagnose van stap 2, en in stap 3 de twee parallelle beslissingen (uitkomst per concept én uitkomst per `hasPart`-relatie), met daarna het vastleggen van naam, definitie en payload.

{::nomarkdown}
<pre class="mermaid">
{% include_relative assets/diagrammen/beslisflow.mmd %}
</pre>
{:/}

---

## 6. Voorbeelduitwerkingen

Vier concepten, één per werkgroep. Elke rij volgt de volgorde van het proces: eerst de twee dimensies en de betekenisrelatie (stap 1), dan de representatie, naam en definitie (stap 3). De uitkomsten zijn **voorwaardelijk**: ze gelden mits de dimensiezijde van *beide* bronnen is vastgesteld.

### 6.1 Landhoofd

Het voorbeeld betreft 'Landhoofd (Kunstwerken)' en `imbor:Landhoofd`. NEN-bouwdeel 1326 "Landhoofd" hangt onder element 202 "Steunpunt" (belang Hoog), dat op zijn beurt hangt onder twaalf beheerobjecten (Brug vast, Viaduct, Aquaduct, Ecoduct, Overkluizing, Onderdoorgang, Keersluis, …). IMBOR kent de klasse `Landhoofd` (bovenliggend: `Kunstwerkdeel`) en koppelt die als `hasPart` aan precies dezelfde kunstwerken (`Vaste brug`, `Beweegbare brug`, `Viaduct`, `Aquaduct`, `Ecoduct`, `Overkluizing`, `Flyover`).

| Stap | Uitkomst |
|---|---|
| **1. ruimtelijk/reëel** | **Reëel.** Tastbare constructie, vormvast (`DiscreetObject`). Beide zijden gelijk; geen dimensieconflict. |
| **1. functioneel/technisch** | **Technisch.** De NPR-definitie bevat functiewerkwoorden ("zorgt voor het dragen … het keren"), maar die beschrijven wat het object *doet*; het object zélf is een constructie (`Kunstwerkdeel`). Ook IMBOR modelleert het technisch (`Kunstwerkdeel`). Geen dimensieconflict. |
| **1. bestaat in IMBOR** | `skos:exactMatch`. Beide bronnen bedoelen hetzelfde objecttype: IMBOR kent `Landhoofd` als subklasse van `Kunstwerkdeel`. |
| **2. confrontatie** | **Geen wrijving op conceptniveau**: technisch object, netjes op zijn niveau. Wel een opvallend verschil in de structuur: NEN koppelt Landhoofd aan één functioneel *element* ("Steunpunt"), IMBOR direct als onderdeel aan de kunstwerken zelf. Daarmee is de NEN-keten beheerobject → *element* → *bouwdeel* hier eigenlijk beheerobject → technisch onderdeel, en is de functie-tussenlaag "Steunpunt" een kandidaat om als functionele rol (`isImplementedBy`) te worden gemodelleerd. |
| **3. concept** | **Samenvallen** (uitkomst 1). `skos:exactMatch`; NEN 1326 integreren in `imbor:Landhoofd`. |
| **3. relatie** | De NEN-koppeling Landhoofd→Steunpunt wordt geen `hasPart` (Steunpunt is functioneel, Landhoofd technisch; zie §1) maar `isGeimplementeerdDoor`. IMBOR's directe `hasPart` van de kunstwerken kan blijven staan. |
| **3. naam** | `skos:prefLabel` "Landhoofd" |
| **3. definitie** | Harmoniseren tot één: de topologische positie van IMBOR ("overgang aardebaan naar kunstwerk") plus de functie van NEN ("dragen hoofddraagconstructie, keren grondlichaam"). Bijvoorbeeld: *"Ondersteuningsconstructie ter plaatse van de overgang van de aardebaan naar een kunstwerk, die de hoofddraagconstructie draagt en het aansluitende grondlichaam keert."* |
| **payload** | Belang Hoog verhuist mee naar de nieuwe `isGeimplementeerdDoor`-relatie. Materialen (Hout, Beton, Steen) en de bijbehorende gebreken blijven aan het technische concept `Landhoofd` hangen. |

**Conclusie:** de classificatie (stap 1) is schoon en leidt tot een zekere `exactMatch`; het echte werk zit in stap 2, waar het functie-element "Steunpunt" als rol wordt gemodelleerd. Dit is precies de weeffout-correctie uit §1.

### 6.2 Verkeersbord

Het voorbeeld betreft 'Verkeersbord (Wegmeubilair)' en `imbor:Verkeersbord`. NEN-bouwdeel 1586 "Verkeersbord" hangt onder element 111 "Bebording en bewegwijzering (statisch)" (belang Laag), dat onder een grote groep beheerobjecten hangt (weg, viaduct, verzorgingsplaats, rivier, kanaal, en vele meer). IMBOR kent de klasse `Verkeersbord` (bovenliggend: `Bord`, daaronder o.a. `Bewegwijzeringsbord`, `Informatiebord`, `Straatnaambord`).

| Stap | Uitkomst |
|---|---|
| **1. ruimtelijk/reëel** | **Reëel.** Tastbaar bord, vormvast (`DiscreetObject`). Beide zijden gelijk; geen dimensieconflict. |
| **1. functioneel/technisch** | **Technisch.** Het object is een constructie (`Bord`, bovenliggend: `Constructie`). Het *element* 111 ("Bebording en bewegwijzering", `-ing`) is daarentegen functioneel, maar het bouwdeel Verkeersbord zelf is technisch. IMBOR modelleert het ook technisch. Geen dimensieconflict. |
| **1. bestaat in IMBOR** | `skos:exactMatch`. IMBOR kent `Verkeersbord` al, met eigen attributen (bordcode, reflectieklasse, bordafmeting) → dus een echte klasse, geen verschijningsvorm. |
| **2. confrontatie** | **Geen wrijving op conceptniveau.** Beide kennen precies dezelfde bordsoorten (NEN-bouwdelen 1073/1586/1822/1903 en de IMBOR-subklassen van `Bord` kennen dezelfde soorten), dus de granulariteit is gelijk. Het enige verschil is de structuur: NEN koppelt ze plat als bouwdelen onder element 111, IMBOR als taxonomie onder `Bord`. |
| **3. concept** | **Samenvallen** (uitkomst 1). NEN 1586 integreren met `imbor:Verkeersbord`; de zusterbouwdelen (1073, 1822, 1903, 1242) samenvallen met de overeenkomstige IMBOR-subklassen. |
| **3. relatie** | De NEN-koppeling bouwdeel→element-111 wordt geen `hasPart` (element 111 is functioneel, het bord technisch) maar `isGeimplementeerdDoor`. |
| **3. naam** | `skos:prefLabel` "Verkeersbord" (IMBOR-schrijfwijze). |
| **3. definitie** | NEN NPR: "Bord waarop een wegverkeersteken is aangebracht en waarvan de uitvoering wettelijk is voorgeschreven" ≈ IMBOR: "wettelijk vastgesteld teken ter regeling, waarschuwing, geleiding of informering van het verkeer". Beide objectmatig en wettelijk verankerd → lichte harmonisatie tot één definitie. |
| **payload** | Belang Laag verhuist mee naar de `isGeimplementeerdDoor`-relatie. Materialen (Hout, Kunststof, Staal) en gebreken (o.a. vervuiling, corrosie bevestiging) blijven aan het technische concept hangen. |

**Conclusie:** een schone `exactMatch` met gelijke granulariteit; de taxonomie aan IMBOR-zijde (subklassen onder `Bord`) dekt de NEN-bouwdeelsoorten al, dus het werk beperkt zich tot het leggen van de koppeling en het harmoniseren van de definitie. De functionele tussenlaag "Bebording en bewegwijzering" is (net als bij Landhoofd) een kandidaat voor een FUTS-rol.

### 6.3 Fauna-uittreedplaats

Het voorbeeld betreft 'Fauna-uittreedplaats (Groen)' en `imbor:Fauna-uittreedplaats`. NEN-element 131 "Fauna uittreedplaats" hangt onder zes waterbeheerobjecten (Aquaduct, Kanaal, Meer, Rivier, en de twee "Water en watergang"-categorieën) en is opgebouwd uit tien bouwdelen (o.a. Damwand boven-/onderwatertalud, Filterconstructie, Grondlichaam, Loopplank, Rooster, Zinkstuk, Toplaag). IMBOR kent de klasse `Fauna-uittreedplaats` (bovenliggend: `Faunavoorziening`) met twee verschijningsvormen (groot wild, watervogels).

| Stap | Uitkomst |
|---|---|
| **1. ruimtelijk/reëel** | **Onbepaald.** De NPR-definitie ("constructie langs een steile of verticale oever") is reëel; de IMBOR-definitie ("talud, trap, of ander schuin vlak") neigt ook naar reëel maar heeft een sterke ruimtelijke/locatie-component. → **fallback (U3):** voorlopig onder generiek `FysiekObject` plaatsen en als open vraag noteren; geen keuze forceren. |
| **1. functioneel/technisch** | **Functioneel** aan beide kanten. IMBOR modelleert het expliciet als `Faunavoorziening` (een voorziening die een functie vervult); ook de NEN-definitie is functiegericht (fauna laten uittreden). Geen dimensieconflict. |
| **1. bestaat in IMBOR** | `skos:closeMatch` (nog geen `exactMatch`). De definities overlappen maar sluiten elkaar deels uit: NEN "steile of verticale oever" vs. IMBOR "schuin vlak". Pas ná definitie-harmonisatie kan dit `exactMatch` worden. |
| **2. confrontatie** | **Definitieconflict.** Dit is het scherpste voorbeeld van definities die elkaar vrijwel uitsluiten: een "schuin vlak" (IMBOR) is geen "constructie langs een steile oever" (NEN), terwijl het wel hetzelfde beheerde object is. Verder is de structuur verschillend: NEN decomposeert het element in tien bouwdelen; IMBOR kent alleen twee verschijningsvormen (groot wild / watervogels). |
| **3. concept** | **Voorlopig samenvallen** (uitkomst 1, voorwaardelijk). Pas definitief `exactMatch` ná harmonisatie van de definitie. De twee IMBOR-verschijningsvormen blijven waarden, geen subklassen. |
| **3. relatie** | De tien NEN-bouwdelen kunnen als onderdeel (`hasPart`) aan de geharmoniseerde klasse hangen; dat is een toevoeging aan IMBOR (daar ontbreekt de decompositie nog). |
| **3. naam** | `skos:prefLabel` "Fauna-uittreedplaats" (IMBOR-schrijfwijze); NEN "Fauna uittreedplaats" (zonder koppelteken) als `skos:altLabel`. |
| **3. definitie** | **Kernprobleem.** Eén geharmoniseerde, functiegerichte definitie opstellen die beide uitvoeringsvormen dekt, bijvoorbeeld: *"Voorziening (constructie, talud of trap) langs of in een oever van een watergang, waarmee (te water geraakte) dieren aan land kunnen komen."* |
| **payload** | Belang (o.a. Hoog voor de meeste bouwdelen) blijft op de bouwdeel-relaties; materialen en gebreken blijven aan de tien bouwdelen hangen. |

**Conclusie:** hier is géén schone match zonder werk: de definities moeten eerst geharmoniseerd worden (steil/verticaal vs. schuin vlak) voordat `exactMatch` houdbaar is. Dat is inhoudelijk werk voor de groep Groen, en precies wat de methode bloot moet leggen.

### 6.4 Onderlaag

Het voorbeeld betreft 'Onderlaag (Verharding)' en de IMBOR-klasse `Constructielaag`. NEN-bouwdeel 2175 "Onderlaag" hangt onder zeven elementen "Verharding wegtype 1 t/m 7" (belang Hoog), die onder het beheerobject "Weg" hangen. IMBOR kent géén klasse "Onderlaag", wel de klasse `Constructielaag` met het classificerende attribuut `constructielaagsoort`.

| Stap | Uitkomst |
|---|---|
| **1. ruimtelijk/reëel** | **Reëel.** Een vormvaste constructielaag (`DiscreetObject`; vgl. NPR 4660 §6). Beide zijden gelijk; geen dimensieconflict. |
| **1. functioneel/technisch** | **Technisch.** Een constructielaag, naar samenstelling gemodelleerd. IMBOR modelleert `Constructielaag` ook technisch. Geen dimensieconflict. |
| **1. bestaat in IMBOR** | `skos:narrowMatch`. Een onderlaag ís een constructielaag, maar onderscheidt zich van `Constructielaag` alleen door de **laagpositie**: een eigenschapswaarde, geen eigen attributen. |
| **2. confrontatie** | **Geen as-wrijving, maar wel een representatievraag.** De laag is technisch en past bij `Constructielaag`, maar NEN maakt er een benoemd bouwdeel van (met eigen conditiescore), terwijl IMBOR geen aparte klasse heeft. Dit is het schoolvoorbeeld van: niet elk NEN-bouwdeel is een klasse. |
| **3. concept** | **Wordt verschijningsvorm** (uitkomst 4): "onderlaag" wordt een waarde van het classificerende attribuut `constructielaagsoort` bij de klasse `Constructielaag`, geen eigen klasse. De klasse `Constructielaag` blijft het object dat je vastlegt en inspecteert (de conditiescore kan er dus aan hangen). |
| **3. relatie** | De NEN-koppeling bouwdeel→element-verharding blijft een `hasPart` van de verharding (de `Constructielaag` blijft deel van de wegconstructie). |
| **3. naam** | Geen nieuwe klasse-naam. De waarde opnemen in de `constructielaagsoort`-lijst van `Constructielaag` (die nu waarden bevat als *Asfaltverharding (onderlaag)*, materiaal + laagpositie gecombineerd). |
| **3. definitie** | Definitie van de **waarde** (geen klasse). Openstaand (inhoudelijk): de `constructielaagsoort`-lijst combineert nu verhardingstype + laagpositie en moet mogelijk heringedeeld worden zodat "onderlaag" materiaal-onafhankelijk kan. |
| **payload** | Belang Hoog blijft op de relatie naar de verharding. Materialen (Zand, Asfaltbeton, Cementbeton) en gebreken blijven aan de `Constructielaag`-instantie hangen; die blijft dus het adresseerbare inspectie-object. |

**Conclusie:** het scherpste bewijs dat niet elk NEN-bouwdeel een klasse wordt: "onderlaag" is een laagpositie (waarde), niet een apart objecttype. Cruciaal is dat de klasse `Constructielaag` het inspecteerbare object blijft, zodat de conditiemeting er aan kan blijven hangen. Het herindelen van de `constructielaagsoort`-lijst is inhoudelijk werk, geen classificatievraag.

### 6.5 Wat de voorbeelden aantonen
- De methode leidt tot **herleidbare, maar voorwaardelijke** uitkomsten: 2 vrij zekere samenvallers (Landhoofd, Verkeersbord, mits bevestiging van de dimensiezijde), 1 voorwaardelijke samenvaller met open punten (Fauna), 1 verschijningsvorm (Onderlaag).
- De dimensies blokkeren nergens onterecht een subklasse; waar de dimensie ruimtelijk/reëel onbepaald is (Fauna) grijpt de fallback naar het generieke concept, geen geforceerd oordeel.
- De methode scheidt **classificatiewerk** (stap 1) van **inhoudelijk harmonisatiewerk** (definitie-harmonisatie, domeinlijst-herindeling).
- De vier voorbeelden testen nog geen echt dimensieconflict (`isBegrensdDoor`/`isGeimplementeerdDoor`), geen `broadMatch`/partiële overlap, en geen herhaalde deel-rol. Zulke lastige gevallen zijn juist een proefpunt voor een eventuele kalibratieronde over de werkgroepen heen (nog openstaand).
