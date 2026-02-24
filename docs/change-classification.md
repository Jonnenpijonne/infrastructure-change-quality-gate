# Muutosluokittelu — Infrastruktuurimuutosten kontrollit

## Yleiskuvaus

Infrastruktuurimuutokset luokitellaan kolmeen luokkaan riskimatriisin perusteella. Jokainen luokka määrittää vaaditut kontrollit, hyväksyntäketjun ja dokumentaation tason.

Luokittelu perustuu ISO 27001 -standardin kontrolliin A.12.1.2 (Change Management).

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

## Viitteet

- [Riskimatriisi](./risk-matrix.md)
- ISO 27001:2022, A.12.1.2 — Change Management
- ISO 27001:2022, A.14.2.2 — System Change Control Procedures
