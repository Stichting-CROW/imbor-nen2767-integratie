# Lokale preview van de GitHub Pages-site via Docker (geen Ruby-installatie nodig).
#
# Vooraf: start Docker Desktop.
# Gebruik:  .\script\preview.ps1   (werkt vanuit elke map)
# Daarna:   open http://localhost:4000/  (ververst automatisch bij opslaan)
# Stoppen:  Ctrl+C
#
# De eerste keer installeert Docker de gems (~1-2 min); daarna zit alles in de
# named volume 'imbor-pages-bundle' en start het vrijwel direct.

# Repo-root = de map boven dit script, zodat de mount altijd klopt.
$repo = Split-Path -Parent $PSScriptRoot

docker run --rm -it `
  -v "${repo}:/srv/jekyll" `
  -v "imbor-pages-bundle:/usr/local/bundle" `
  -w /srv/jekyll `
  -p 4000:4000 -p 35729:35729 `
  ruby:3.3 `
  bash -c "bundle install && bundle exec jekyll serve --host 0.0.0.0 --livereload --force_polling"
