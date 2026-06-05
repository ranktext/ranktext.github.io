# ranktext – PowerShell Landingpage Generator
# Generiert 50 SEO-Landingpages für deutsche Städte

$cities = @(
    @{name="Köln"; slug="koeln"; state="Nordrhein-Westfalen"; businesses="115.000"; population="1,08 Mio."; note="Medienmetropole am Rhein"},
    @{name="Düsseldorf"; slug="duesseldorf"; state="Nordrhein-Westfalen"; businesses="78.000"; population="645.000"; note="Landeshauptstadt und Messezentrum"},
    @{name="Hamburg"; slug="hamburg"; state="Hamburg"; businesses="165.000"; population="1,95 Mio."; note="Deutschlands Tor zur Welt"},
    @{name="München"; slug="muenchen"; state="Bayern"; businesses="210.000"; population="1,58 Mio."; note="Bayerns Wirtschaftsmotor"},
    @{name="Berlin"; slug="berlin"; state="Berlin"; businesses="310.000"; population="3,75 Mio."; note="Startup-Hauptstadt Deutschlands"},
    @{name="Frankfurt am Main"; slug="frankfurt"; state="Hessen"; businesses="142.000"; population="773.000"; note="Finanz- und Messezentrum Europas"},
    @{name="Stuttgart"; slug="stuttgart"; state="Baden-Württemberg"; businesses="89.000"; population="635.000"; note="Herz des deutschen Maschinenbaus"},
    @{name="Dortmund"; slug="dortmund"; state="Nordrhein-Westfalen"; businesses="62.000"; population="603.000"; note="Logistikdrehscheibe Westfalens"},
    @{name="Essen"; slug="essen"; state="Nordrhein-Westfalen"; businesses="58.000"; population="584.000"; note="Wirtschaftsstandort im Ruhrgebiet"},
    @{name="Leipzig"; slug="leipzig"; state="Sachsen"; businesses="54.000"; population="628.000"; note="Boomende Metropole Mitteldeutschlands"},
    @{name="Bremen"; slug="bremen"; state="Bremen"; businesses="48.000"; population="569.000"; note="Handels- und Hafenstadt an der Weser"},
    @{name="Dresden"; slug="dresden"; state="Sachsen"; businesses="52.000"; population="565.000"; note="Elbflorenz und Technologiestandort"},
    @{name="Hannover"; slug="hannover"; state="Niedersachsen"; businesses="67.000"; population="540.000"; note="Messestadt und Verwaltungszentrum"},
    @{name="Nürnberg"; slug="nuernberg"; state="Bayern"; businesses="74.000"; population="524.000"; note="Metropolregion Nürnberg"},
    @{name="Duisburg"; slug="duisburg"; state="Nordrhein-Westfalen"; businesses="44.000"; population="498.000"; note="Binnenhafen und Logistikstandort"},
    @{name="Bochum"; slug="bochum"; state="Nordrhein-Westfalen"; businesses="41.000"; population="365.000"; note="Universitätsstadt im Ruhrgebiet"},
    @{name="Wuppertal"; slug="wuppertal"; state="Nordrhein-Westfalen"; businesses="38.000"; population="355.000"; note="Bergisches Städtedreieck"},
    @{name="Bielefeld"; slug="bielefeld"; state="Nordrhein-Westfalen"; businesses="46.000"; population="341.000"; note="Wirtschaftsstandort Ostwestfalen"},
    @{name="Bonn"; slug="bonn"; state="Nordrhein-Westfalen"; businesses="44.000"; population="338.000"; note="UN-Stadt und Wissenschaftsstandort"},
    @{name="Münster"; slug="muenster"; state="Nordrhein-Westfalen"; businesses="42.000"; population="318.000"; note="Fahrradstadt und Universitätsstadt"},
    @{name="Karlsruhe"; slug="karlsruhe"; state="Baden-Württemberg"; businesses="48.000"; population="313.000"; note="Technologieregion Karlsruhe"},
    @{name="Mannheim"; slug="mannheim"; state="Baden-Württemberg"; businesses="51.000"; population="311.000"; note="Wirtschaftszentrum Metropolregion Rhein-Neckar"},
    @{name="Augsburg"; slug="augsburg"; state="Bayern"; businesses="43.000"; population="300.000"; note="Bayerisch-Schwabens Zentrum"},
    @{name="Wiesbaden"; slug="wiesbaden"; state="Hessen"; businesses="49.000"; population="288.000"; note="Hessische Landeshauptstadt"},
    @{name="Aachen"; slug="aachen"; state="Nordrhein-Westfalen"; businesses="35.000"; population="258.000"; note="Technologiestadt an der Dreiländerecke"},
    @{name="Braunschweig"; slug="braunschweig"; state="Niedersachsen"; businesses="36.000"; population="250.000"; note="Forschungsstandort Niedersachsen"},
    @{name="Kiel"; slug="kiel"; state="Schleswig-Holstein"; businesses="32.000"; population="247.000"; note="Landeshauptstadt an der Förde"},
    @{name="Freiburg im Breisgau"; slug="freiburg"; state="Baden-Württemberg"; businesses="33.000"; population="232.000"; note="Tor zum Schwarzwald"},
    @{name="Erfurt"; slug="erfurt"; state="Thüringen"; businesses="28.000"; population="214.000"; note="Thüringische Landeshauptstadt"},
    @{name="Mainz"; slug="mainz"; state="Rheinland-Pfalz"; businesses="34.000"; population="220.000"; note="Medienstandort und Landeshauptstadt"},
    @{name="Rostock"; slug="rostock"; state="Mecklenburg-Vorpommern"; businesses="26.000"; population="210.000"; note="Hansestadt an der Ostsee"},
    @{name="Kassel"; slug="kassel"; state="Hessen"; businesses="29.000"; population="202.000"; note="documenta-Stadt Nordhessens"},
    @{name="Halle (Saale)"; slug="halle"; state="Sachsen-Anhalt"; businesses="25.000"; population="241.000"; note="Wirtschaftszentrum Sachsen-Anhalts"},
    @{name="Lübeck"; slug="luebeck"; state="Schleswig-Holstein"; businesses="27.000"; population="217.000"; note="Hansestadt an der Trave"},
    @{name="Oberhausen"; slug="oberhausen"; state="Nordrhein-Westfalen"; businesses="24.000"; population="210.000"; note="Centro-Stadt im Ruhrgebiet"},
    @{name="Magdeburg"; slug="magdeburg"; state="Sachsen-Anhalt"; businesses="27.000"; population="238.000"; note="Landeshauptstadt an der Elbe"},
    @{name="Potsdam"; slug="potsdam"; state="Brandenburg"; businesses="31.000"; population="185.000"; note="Schlösserstadt vor den Toren Berlins"},
    @{name="Saarbrücken"; slug="saarbruecken"; state="Saarland"; businesses="28.000"; population="179.000"; note="Landeshauptstadt des Saarlandes"},
    @{name="Hamm"; slug="hamm"; state="Nordrhein-Westfalen"; businesses="22.000"; population="178.000"; note="Logistikstandort Westfalens"},
    @{name="Oldenburg"; slug="oldenburg"; state="Niedersachsen"; businesses="26.000"; population="169.000"; note="Wirtschaftszentrum Nordwestniedersachsens"},
    @{name="Osnabrück"; slug="osnabrueck"; state="Niedersachsen"; businesses="24.000"; population="165.000"; note="Friedensstadt Niedersachsens"},
    @{name="Leverkusen"; slug="leverkusen"; state="Nordrhein-Westfalen"; businesses="21.000"; population="163.000"; note="Chemiestandort am Rhein"},
    @{name="Solingen"; slug="solingen"; state="Nordrhein-Westfalen"; businesses="19.000"; population="160.000"; note="Klingenstadt des Bergischen Landes"},
    @{name="Herne"; slug="herne"; state="Nordrhein-Westfalen"; businesses="18.000"; population="156.000"; note="Stadt im Herzen des Ruhrgebiets"},
    @{name="Neuss"; slug="neuss"; state="Nordrhein-Westfalen"; businesses="22.000"; population="154.000"; note="Tor zum linken Niederrhein"},
    @{name="Paderborn"; slug="paderborn"; state="Nordrhein-Westfalen"; businesses="21.000"; population="152.000"; note="Technologiestandort Ostwestfalens"},
    @{name="Regensburg"; slug="regensburg"; state="Bayern"; businesses="29.000"; population="156.000"; note="Weltkulturerbe und Wirtschaftsstandort"},
    @{name="Ingolstadt"; slug="ingolstadt"; state="Bayern"; businesses="26.000"; population="138.000"; note="Automobilstandort Bayerns"},
    @{name="Mönchengladbach"; slug="moenchengladbach"; state="Nordrhein-Westfalen"; businesses="33.000"; population="261.000"; note="Wirtschaftsstandort am Niederrhein"},
    @{name="Hürth"; slug="huerth"; state="Nordrhein-Westfalen"; businesses="8.500"; population="60.000"; note="Wirtschaftsstandort im Rhein-Erft-Kreis"}
)

# Output-Verzeichnis
$outputDir = ".\landingpages"
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

$today = Get-Date -Format "yyyy-MM-dd"
$generated = 0

foreach ($city in $cities) {
    $name = $city.name
    $slug = $city.slug
    $state = $city.state
    $businesses = $city.businesses
    $population = $city.population
    $note = $city.note
    $filename = "content-agentur-$slug.html"
    
    $html = @"
<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Content Agentur $name | SEO &amp; GEO Texte für KMUs – ranktext</title>
  <meta name="description" content="ranktext liefert SEO-optimierte Blogartikel und GEO-Content für KMUs in $name. Ab 399 €/Monat. Monatlich kündbar. Vollautomatisch geliefert.">
  <meta name="robots" content="index, follow">
  <link rel="canonical" href="https://www.ranktext.de/landingpages/content-agentur-$slug.html">
  <meta property="og:title" content="Content Agentur $name | SEO &amp; GEO Texte – ranktext">
  <meta property="og:description" content="$businesses Unternehmen in $name brauchen Content. Wir liefern ihn – vollautomatisch, ab 399 €/Monat, monatlich kündbar.">
  <meta property="og:type" content="website">
  <link rel="stylesheet" href="../css/style.css">
  <script type="application/ld+json">
  {"@context":"https://schema.org","@type":"LocalBusiness","name":"ranktext","description":"SEO &amp; GEO Content Agentur für KMUs","url":"https://www.ranktext.de","email":"hallo@ranktext.de","areaServed":{"@type":"City","name":"$name"},"priceRange":"€€","offers":{"@type":"Offer","name":"Content-Retainer","price":"399","priceCurrency":"EUR"}}
  </script>
</head>
<body>
<div id="cookie-banner" class="hidden" role="dialog" aria-label="Cookie-Einstellungen">
  <p class="cookie-text"><strong>Wir verwenden Cookies</strong> – <a href="../datenschutz.html">Datenschutzerklärung</a></p>
  <div class="cookie-actions">
    <button class="btn-cookie-reject" id="cookie-reject">Ablehnen</button>
    <button class="btn-cookie-accept" id="cookie-accept">Akzeptieren</button>
  </div>
</div>
<nav id="navbar" role="navigation" aria-label="Hauptnavigation">
  <div class="nav-inner">
    <a href="/" class="nav-logo">ranktext</a>
    <ul class="nav-links" id="nav-links" role="list">
      <li><a href="/#leistungen">Leistungen</a></li>
      <li><a href="/#preise">Preise</a></li>
      <li><a href="../blog/index.html">Blog</a></li>
    </ul>
    <a href="https://tally.so/r/ODkbAk" class="btn btn-primary btn-sm nav-cta" target="_blank" rel="noopener noreferrer">Jetzt starten</a>
    <button class="nav-toggle" id="nav-toggle" aria-label="Menü" aria-expanded="false" aria-controls="nav-links"><span></span><span></span><span></span></button>
  </div>
</nav>
<main>

<section class="lp-hero">
  <div class="container">
    <div class="lp-hero-inner">
      <div class="section-badge">Content Agentur $name</div>
      <h1>SEO-Content für KMUs in $name — vollautomatisch geliefert</h1>
      <p class="lp-hero-sub">$businesses Unternehmen in $name kämpfen um Google-Sichtbarkeit. Die, die regelmäßig guten Content veröffentlichen, gewinnen. ranktext liefert dir monatlich fertige Blogartikel und GEO-Content — ohne einen einzigen Handgriff deinerseits.</p>
      <div class="lp-hero-cta">
        <a href="https://tally.so/r/ODkbAk" class="btn btn-primary btn-lg" target="_blank" rel="noopener noreferrer">Paket anfragen – ab 399 €/Monat <svg width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"/></svg></a>
        <span class="lp-hero-note">Monatlich kündbar · Kein Jahresvertrag · DSGVO-konform</span>
      </div>
    </div>
  </div>
</section>

<section class="lp-local">
  <div class="container">
    <div class="lp-local-grid">
      <div class="lp-local-text">
        <h2>Warum KMUs in $name jetzt in Content investieren</h2>
        <p>$name ist $note. Mit $population Einwohnern und über $businesses aktiven Unternehmen ist der lokale Wettbewerb enorm — besonders online. Wer bei Google für relevante Begriffe nicht auf Seite 1 erscheint, wird nicht gefunden.</p>
        <p>Das Problem: Die meisten Inhaber in $name wissen, dass sie Content brauchen — haben aber weder Zeit noch Budget dafür. Eine festangestellte Content-Managerin kostet 3.500 € pro Monat. Ein ranktext-Paket kostet ab 399 € und liefert monatlich fertige, veröffentlichungsfertige Artikel.</p>
        <p><strong>Vollautomatisch.</strong> Du bekommst jeden Monat SEO- und GEO-optimierte Blogartikel — branchenspezifisch, ohne einen einzigen Handgriff deinerseits.</p>
      </div>
      <div class="lp-local-stats">
        <div class="stat-card"><div class="stat-number">$businesses</div><div class="stat-label">Unternehmen in $name</div></div>
        <div class="stat-card"><div class="stat-number">94%</div><div class="stat-label">Kaufentscheidungen starten online</div></div>
        <div class="stat-card"><div class="stat-number">3–6</div><div class="stat-label">Monate bis zum ersten Ranking</div></div>
        <div class="stat-card"><div class="stat-number">0 h</div><div class="stat-label">Aufwand für dich pro Monat</div></div>
      </div>
    </div>
  </div>
</section>

<section class="lp-services">
  <div class="container">
    <div class="section-header">
      <div class="section-badge">Was du bekommst</div>
      <h2>Content-Pakete für KMUs in $name</h2>
      <p class="section-sub">Monatlich geliefert. Veröffentlichungsfertig. Auf deine Branche zugeschnitten.</p>
    </div>
    <div class="services-grid">
      <div class="service-card reveal">
        <div class="service-icon">📝</div>
        <h3>SEO Blog-Artikel</h3>
        <p>5–12 Blogartikel pro Monat mit Keyword-Recherche, H1–H3-Struktur, Meta-Beschreibung und Verlinkungsvorschlägen. Mindestens 800 Wörter, branchenspezifisch geschrieben.</p>
      </div>
      <div class="service-card reveal reveal-delay-1">
        <div class="service-icon">🤖</div>
        <h3>GEO-Optimierung</h3>
        <p>Jeder Artikel ist für KI-Suchmaschinen wie ChatGPT, Perplexity und Google AI Overviews optimiert — damit du in KI-Antworten zitiert wirst.</p>
      </div>
      <div class="service-card reveal reveal-delay-2">
        <div class="service-icon">📊</div>
        <h3>Monatliches Reporting</h3>
        <p>Ab Standard: monatlicher Report mit Sichtbarkeits-Entwicklung, Top-Rankings deiner Artikel und Empfehlungen für den Folgemonat.</p>
      </div>
    </div>
  </div>
</section>

<section class="lp-pricing" id="preise">
  <div class="container">
    <div class="section-header">
      <div class="section-badge">Preise</div>
      <h2>Transparente Pakete für $name</h2>
      <p class="section-sub">Monatlich kündbar. Kein Jahresvertrag. Keine Einrichtungsgebühr.</p>
    </div>
    <div class="pricing-grid">
      <div class="pricing-card reveal">
        <div class="pricing-name">Starter</div>
        <div class="pricing-price">399 <span>€/Monat</span></div>
        <ul class="pricing-features">
          <li><span class="check" aria-hidden="true">✓</span> 5 SEO-Blogartikel</li>
          <li><span class="check" aria-hidden="true">✓</span> GEO-Optimierung</li>
          <li><span class="check" aria-hidden="true">✓</span> Keyword-Recherche</li>
          <li><span class="check" aria-hidden="true">✓</span> Meta-Beschreibungen</li>
          <li><span class="check" aria-hidden="true">✓</span> Word-Datei Lieferung</li>
        </ul>
        <a href="https://tally.so/r/ODkbAk" class="btn btn-outline btn-full" target="_blank" rel="noopener noreferrer">Starter anfragen</a>
      </div>
      <div class="pricing-card pricing-popular reveal reveal-delay-1">
        <div class="popular-badge">Beliebtestes Paket</div>
        <div class="pricing-name">Standard</div>
        <div class="pricing-price">499 <span>€/Monat</span></div>
        <ul class="pricing-features">
          <li><span class="check" aria-hidden="true">✓</span> 8 SEO-Blogartikel</li>
          <li><span class="check" aria-hidden="true">✓</span> GEO-Optimierung</li>
          <li><span class="check" aria-hidden="true">✓</span> Keyword-Recherche</li>
          <li><span class="check" aria-hidden="true">✓</span> Meta-Beschreibungen</li>
          <li><span class="check" aria-hidden="true">✓</span> Monatliches Reporting</li>
          <li><span class="check" aria-hidden="true">✓</span> Prioritäts-Support</li>
        </ul>
        <a href="https://tally.so/r/ODkbAk" class="btn btn-primary btn-full" target="_blank" rel="noopener noreferrer">Standard anfragen</a>
      </div>
      <div class="pricing-card reveal reveal-delay-2">
        <div class="pricing-name">Premium</div>
        <div class="pricing-price">699 <span>€/Monat</span></div>
        <ul class="pricing-features">
          <li><span class="check" aria-hidden="true">✓</span> 12 SEO-Blogartikel</li>
          <li><span class="check" aria-hidden="true">✓</span> GEO-Optimierung</li>
          <li><span class="check" aria-hidden="true">✓</span> Erweiterte Keyword-Strategie</li>
          <li><span class="check" aria-hidden="true">✓</span> Meta-Beschreibungen</li>
          <li><span class="check" aria-hidden="true">✓</span> Reporting + monatlicher Call</li>
          <li><span class="check" aria-hidden="true">✓</span> Persönlicher Ansprechpartner</li>
        </ul>
        <a href="https://tally.so/r/ODkbAk" class="btn btn-outline btn-full" target="_blank" rel="noopener noreferrer">Premium anfragen</a>
      </div>
    </div>
  </div>
</section>

<section class="cta-section lp-cta">
  <div class="container">
    <div class="cta-inner">
      <div class="section-badge" style="display:inline-flex;margin-bottom:20px;">Für KMUs in $name</div>
      <h2>Starte heute — deine Mitbewerber warten nicht</h2>
      <p style="color:var(--text-secondary);max-width:520px;margin:0 auto 32px;line-height:1.7;">Jeder Monat ohne Content ist ein Monat, in dem Mitbewerber in $name aufholen. Der beste Zeitpunkt zu starten war vor 6 Monaten. Der zweitbeste ist jetzt.</p>
      <a href="https://tally.so/r/ODkbAk" class="btn btn-primary btn-lg" target="_blank" rel="noopener noreferrer">Jetzt Paket anfragen – kostenlos &amp; unverbindlich <svg width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"/></svg></a>
      <p style="color:var(--text-muted);font-size:0.8rem;margin-top:16px;">Monatlich kündbar · Antwort innerhalb 24h · DSGVO-konform</p>
    </div>
  </div>
</section>

</main>
<footer id="footer" role="contentinfo">
  <div class="container">
    <div class="footer-bottom">
      <p>© 2026 ranktext · Sebastian Galwas · Ernst-Reuter-Str. 33–37, 50354 Hürth</p>
      <nav class="footer-legal-links"><a href="../datenschutz.html">Datenschutz</a><a href="../impressum.html">Impressum</a><a href="/">Startseite</a></nav>
    </div>
  </div>
</footer>
<script src="../js/main.js"></script>
</body>
</html>
"@
    
    $filepath = Join-Path $outputDir $filename
    [System.IO.File]::WriteAllText($filepath, $html, [System.Text.UTF8Encoding]::new($false))
    $generated++
    Write-Host "✅ $filename"
}

# Sitemap generieren
$sitemapItems = $cities | ForEach-Object {
    "  <url>`n    <loc>https://www.ranktext.de/landingpages/content-agentur-$($_.slug).html</loc>`n    <changefreq>monthly</changefreq>`n    <priority>0.8</priority>`n    <lastmod>$today</lastmod>`n  </url>"
}

$sitemap = @"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://www.ranktext.de/</loc>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
    <lastmod>$today</lastmod>
  </url>
  <url>
    <loc>https://www.ranktext.de/blog/index.html</loc>
    <changefreq>weekly</changefreq>
    <priority>0.9</priority>
    <lastmod>$today</lastmod>
  </url>
  <url>
    <loc>https://www.ranktext.de/blog/seo-content-kmu-google-ranking.html</loc>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://www.ranktext.de/blog/geo-optimierung-kmu-ki-antworten.html</loc>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://www.ranktext.de/blog/content-marketing-kleine-unternehmen.html</loc>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://www.ranktext.de/blog/seo-texte-kaufen-qualitaet.html</loc>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
$($sitemapItems -join "`n")
</urlset>
"@

[System.IO.File]::WriteAllText(".\sitemap.xml", $sitemap, [System.Text.UTF8Encoding]::new($false))
Write-Host "`n📄 sitemap.xml generiert"
Write-Host "`n🎉 Fertig! $generated Landingpages generiert!"
