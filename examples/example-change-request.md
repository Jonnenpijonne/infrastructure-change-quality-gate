# Muutospyyntö — Infrastructure Change Request

## Perustiedot

- **Muutoksen nimi:** CI/CD-pipelinen siirto GitHub Actions v4:ään
- **Pyytäjä:** Matti Meikäläinen, Senior DevOps Engineer
- **Päivämäärä:** 2026-02-24
- **Riskiluokka:** 2
- **Kohdeympäristö:** production

## Kuvaus

### Mitä muutetaan?
CI/CD-pipeline päivitetään käyttämään GitHub Actions v4 -versioita (actions/checkout@v4, actions/setup-python@v5). Samalla lisätään uusi validointivaihe, joka tarkistaa muutospyynnöt automaattisesti ennen merge-vaihetta.

### Miksi muutos tehdään?
Nykyiset GitHub Actions -versiot (v2/v3) ovat tulossa end-of-life -vaiheeseen. Päivitys varmistaa jatkuvan tuen ja tietoturvapäivitykset. Lisäksi uusi validointivaihe parantaa muutostenhallinnan automaatiota.

### Mitä komponentteja muutos koskee?
- [ ] Verkko
- [ ] Tietokanta
- [x] CI/CD
- [ ] Pääsynhallinta (IAM/RBAC)
- [ ] DNS
- [ ] Sertifikaatit
- [ ] Muu

## Vaikutusanalyysi

### Todennäköisyys (ongelman)
- [ ] Matala — Rajattu, yksinkertainen muutos
- [x] Keskitaso — Useampi komponentti, rajattuja riippuvuuksia
- [ ] Korkea — Monimutkainen, useita järjestelmiä

### Vaikutus (ongelman)
- [ ] Matala — Ei palvelukatkoa, palautus < 5 min
- [x] Keskitaso — Lyhyt katko mahdollinen (< 30 min)
- [ ] Korkea — Pitkä katko, laaja vaikutus, datahäviön riski

### Riskiluokan perustelu
Muutos koskee CI/CD-infrastruktuuria, joka vaikuttaa kaikkien tiimien kehitystyöhön. Vaikka kyseessä on versiopäivitys, pipeline-katkos estäisi uusien muutosten julkaisun. Riskimatriisin mukaan keskitason todennäköisyys + keskitason vaikutus = Luokka 2.

## Palautussuunnitelma (Rollback)

- **Palautusstrategia:** git revert
- **Palautuksen kesto:** 10 minuuttia
- **Palautuksen vastuuhenkilö:** Matti Meikäläinen
- **Onko palautus testattu?** Kyllä

## Testaussuunnitelma

- **Testausympäristö:** staging
- **Testattavat skenaariot:**
  1. Pipeline-ajo staging-ympäristössä päivitetyillä Actions-versioilla
  2. Validointiskriptin ajo esimerkkimuutospyynnölle
  3. Rollback-testaus: palautus edelliseen pipeline-versioon
- **Hyväksymiskriteerit:** Kaikki pipeline-vaiheet suoriutuvat onnistuneesti, validointiskripti tuottaa oikeat tulokset, rollback toimii alle 10 minuutissa.

## Aikaikkunat

- **Ehdotettu toteutusaika:** 2026-03-03 09:00 - 11:00 (UTC)
- **Freeze-periodi tarkistettu:** Ei sovellettavissa
- **Kommunikaatio sidosryhmille:** Kyllä

## Hyväksyjät

1. **Hyväksyjä 1:** Liisa Virtanen — Tech Lead — [x] Hyväksytty
2. **Hyväksyjä 2:** Pekka Korhonen — Platform Engineer — [x] Hyväksytty
3. **Hyväksyjä 3:** [Nimi] — [Rooli] — [ ] Hyväksytty

## Tarkistuslista

- [x] Riskiluokka määritetty ja perusteltu
- [x] Vaikutusanalyysi täytetty
- [x] Palautussuunnitelma laadittu (luokat 2-3)
- [x] Testaussuunnitelma laadittu (luokat 2-3)
- [ ] Aikaikkunat tarkistettu (luokka 3)
- [x] Riittävä määrä hyväksyjiä nimetty
- [ ] Kommunikaatio suunniteltu (luokka 3)
