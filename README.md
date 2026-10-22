# imbor-nen2767-integratie

Publiceert het voorstel **"Uitgangspunten voor het integreren van NEN 2767-4 in IMBOR"**
(Werkgroep Methodiek) als leesbare website via GitHub Pages.

**Live:** <https://docs.crow.nl/imbor-nen2767-integratie/>

> Status van het document: **voorstel, nog niet vastgesteld.** De pagina is publiek leesbaar.

## Hoe het werkt

- De inhoud staat in [`index.md`](index.md) (Markdown). Dát is de bron van de site.
- GitHub Pages bouwt de site automatisch met **Jekyll** + het **Minimal Mistakes**-thema
  (sunrise-skin, zoekfunctie, plakkende inhoudsopgave).
- Elke push naar `main` triggert een rebuild; na ~1 minuut is de live pagina bij.

## Wijzigen en publiceren

```powershell
# bewerk index.md, en dan:
git add index.md
git commit -m "docs: ..."
git push
```

De pagina herbouwt vanzelf. Controleer eventueel de buildstatus onder
*Settings → Pages* of via de Actions/pages-build op GitHub.

## Lokaal previewen

Geen Ruby nodig — de preview draait in Docker.

1. Start **Docker Desktop**.
2. Draai het meegeleverde script:
   ```powershell
   .\script\preview.ps1
   ```
3. Open <http://localhost:4000/>

De site **ververst automatisch** bij opslaan van `index.md`, `_config.yml` of
`assets/css/main.scss`. Stoppen met **Ctrl+C**. De eerste run duurt ~1-2 min
(gems installeren); daarna start het vrijwel direct dankzij een Docker-volume.

**Alternatief (native, zonder Docker):** installeer
[Ruby + DevKit](https://rubyinstaller.org/) en draai:
```powershell
gem install bundler
bundle install
bundle exec jekyll serve --livereload
```

## Structuur

| Pad | Rol |
|---|---|
| `index.md` | De inhoud van de site (het methodiekvoorstel) |
| `_config.yml` | Jekyll-/themaconfiguratie: thema, skin, zoekfunctie, inhoudsopgave |
| `_includes/head/custom.html` | Favicon-koppelingen in de `<head>` |
| `assets/css/main.scss` | Eigen stijl: skin-import + bredere tekstkolom (max. 1600px) |
| `assets/images/` | Favicons en apple-touch-icon |
| `Gemfile` | Bootst de GitHub Pages-buildomgeving na voor lokale preview |
| `script/preview.ps1` | Start de lokale preview in Docker |

## Thema aanpassen

- **Andere skin:** wijzig `minimal_mistakes_skin` in `_config.yml`
  (`default`, `dark`, `contrast`, `plum`, `sunrise`, `dirt`, `neon`, `mint`, `air`, `aqua`).
- **Breedte tekstkolom:** pas `$x-large` aan in `assets/css/main.scss`.
- Documentatie van het thema: <https://mmistakes.github.io/minimal-mistakes/>
