# imbor-nen2767-integratie

Publiceert het voorstel **"Uitgangspunten integratie NEN 2767-4 & IMBOR"**
(Werkgroep Methodiek) als website: <https://docs.crow.nl/imbor-nen2767-integratie/>

> Status: **VOORSTEL**, publiek leesbaar.

## Commentaar op de inhoud? → open een pull request

Heb je opmerkingen op de inhoud, geef die dan via een **pull request** op
[`index.md`](index.md): laat **inline opmerkingen** achter op de betreffende
regels, of stel direct **wijzigingen** voor. Snelste weg: klik op het
potlood-icoon ✏️ boven `index.md` op GitHub, pas de tekst aan en open de PR.
Dát is de plek voor discussie over de tekst.[^hoe]

## Lokale ontwikkeling

### Wijzigen & publiceren

```powershell
git add index.md
git commit -m "docs: ..."
git push
```

### Lokaal bekijken

Vereist Docker Desktop:

```powershell
.\script\preview.ps1
```

Open <http://localhost:4000/>; ververst automatisch bij opslaan, stoppen met `Ctrl+C`.

[^hoe]: De inhoud staat in [`index.md`](index.md); dát is de bron. GitHub Pages
bouwt de site met Jekyll + het Minimal Mistakes-thema, en elke push naar `main`
triggert een rebuild (~1 min).
