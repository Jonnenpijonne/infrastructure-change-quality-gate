# Muutosluokittelu — Infrastruktuurimuutosten kontrollit

## Yleiskuvaus

Infrastruktuurimuutokset luokitellaan kolmeen luokkaan riskimatriisin perusteella. Jokainen luokka määrittää vaaditut kontrollit, hyväksyntäketjun ja dokumentaation tason.

Luokittelu on tämän projektin **referenssimalli** ja se tukee erityisesti ISO/IEC 27001:2022 Annex A 8.32 -kontrollin mukaista change management -ajattelua. Se ei sellaisenaan muodosta organisaation ISO 27001 -vaatimustenmukaisuutta, vaan tuotantokäytössä luokat ja hyväksyntävaatimukset pitää sovittaa organisaation omaan riskienhallintaan, politiikkoihin ja Statement of Applicabilityyn.

---

## Luokka 1 — Matala riski

### Kuvaus
Rutiinimuutokset, joilla ei ole suoraa tuotantovaikutusta eikä palvelukatkoa.

### Esimerkkejä
- Dokumentaation päivitys
- Pienet konfiguraatiomuutokset (ei tuotanto)
- Logging-tason muutokset
- README ja CI-dokumentaatio

### Vaatimukset
- **Hyväksyjät:** 1 henkilö
- **Rollback-suunnitelma:** Ei pakollinen (suositeltu)
- **Testaussuunnitelma:** Ei pakollinen
- **Aikaikkunarajoitus:** Ei
- **Kommunikaatio:** Ei erityistä
- **Dokumentaatio:** Muutospyyntöpohja (pakolliset kentät)

### Läpimenoaika
Tyypillisesti < 1 työpäivä

---

## Luokka 2 — Keskitason riski

### Kuvaus
Muutokset, joilla on rajattu tuotantovaikutus tai jotka koskevat pääsynhallintaa ja CI/CD-infrastruktuuria.

### Esimerkkejä
- CI/CD-pipeline-muutokset
- Palomuurisääntöjen muutokset
- Pääsynhallintamuutokset (IAM, RBAC)
- Load balancer -konfiguraatio
- Sertifikaattien uusiminen

### Vaatimukset
- **Hyväksyjät:** 2 henkilöä
- **Rollback-suunnitelma:** Pakollinen (yksityiskohtainen)
- **Testaussuunnitelma:** Pakollinen
- **Aikaikkunarajoitus:** Suositeltu (virka-aika)
- **Kommunikaatio:** Tiimin sisäinen ilmoitus
- **Dokumentaatio:** Muutospyyntöpohja + rollback-pohja

### Läpimenoaika
Tyypillisesti 1-3 työpäivää

---

## Luokka 3 — Kriittinen riski

### Kuvaus
Muutokset, joilla on laaja tuotantovaikutus, tietoturvariski tai jotka koskevat kriittistä infrastruktuuria.

### Esimerkkejä
- Verkkoarkkitehtuurin muutokset
- Tietokantamigraatiot (tuotanto)
- Autentikaatio-/autorisointijärjestelmien muutokset
- Tietoturvapäivitykset (kriittiset)
- DNS-infrastruktuurin muutokset
- Salaisuuksien hallinnan muutokset

### Vaatimukset
- **Hyväksyjät:** 3 henkilöä (sisältää turvallisuusvastaavan/CISO:n)
- **Rollback-suunnitelma:** Pakollinen (yksityiskohtainen, testattu)
- **Testaussuunnitelma:** Pakollinen (staging-ympäristössä)
- **Aikaikkunarajoitus:** Pakollinen (sovittu muutosikkuna)
- **Kommunikaatio:** Laaja tiedotus (sidosryhmät, käyttäjät)
- **Dokumentaatio:** Muutospyyntöpohja + rollback-pohja + kommunikaatiosuunnitelma
- **Freeze-periodi:** Muutoksia ei saa tehdä freeze-periodin aikana

### Läpimenoaika
Tyypillisesti 3-5 työpäivää (sisältää staging-testauksen)

---

## Yhteenveto kontrolleista

```
Kontrolli                  Luokka 1    Luokka 2    Luokka 3
─────────────────────────────────────────────────────────────
Hyväksyjät                 1           2           3 + CISO
Rollback-suunnitelma       Suositeltu  Pakollinen  Pakollinen + testattu
Testaussuunnitelma         Ei          Pakollinen  Pakollinen (staging)
Aikaikkunarajoitus         Ei          Suositeltu  Pakollinen
Kommunikaatio              Ei          Tiimi       Laaja
Freeze-check               Ei          Ei          Kyllä
```

## ISO/IEC 27001:2022 -viitteet

Projektin kannalta olennaisimmat referenssikontrollit ovat:

- **A.8.32 — Change management**: muutosten suunnittelu, arviointi, hyväksyntä, testaus ja hallittu toteutus.
- **A.8.15 — Logging**: tapahtuma- ja audit-lokien tuottaminen ja käsittely.
- **A.5.37 — Documented operating procedures**: tarvittavien operatiivisten menettelyjen dokumentointi.

Katso myös [riskimatriisi](./risk-matrix.md).

> Huom: projektin vanhemmissa, historiallisissa evidence-esimerkeissä voi edelleen näkyä ISO/IEC 27001:2013 -version tunnuksia kuten A.12.1.2, A.14.2.2 ja A.12.4.1. Niitä ei tule tulkita 2022-version kontrollinumeroiksi.
