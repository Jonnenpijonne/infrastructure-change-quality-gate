# Muutospyyntö — Infrastructure Change Request

## Perustiedot

- **Muutoksen nimi:** [Lyhyt, kuvaava nimi]
- **Pyytäjä:** [Nimi ja rooli]
- **Päivämäärä:** [YYYY-MM-DD]
- **Riskiluokka:** [1 / 2 / 3]
- **Kohdeympäristö:** [dev / staging / production]

## Kuvaus

### Mitä muutetaan?
[Selkeä kuvaus muutoksen sisällöstä]

### Miksi muutos tehdään?
[Liiketoiminnallinen tai tekninen perustelu]

### Mitä komponentteja muutos koskee?
- [ ] Verkko
- [ ] Tietokanta
- [ ] CI/CD
- [ ] Pääsynhallinta (IAM/RBAC)
- [ ] DNS
- [ ] Sertifikaatit
- [ ] Muu: [tarkenna]

## Vaikutusanalyysi

### Todennäköisyys (ongelman)
- [ ] Matala — Rajattu, yksinkertainen muutos
- [ ] Keskitaso — Useampi komponentti, rajattuja riippuvuuksia
- [ ] Korkea — Monimutkainen, useita järjestelmiä

### Vaikutus (ongelman)
- [ ] Matala — Ei palvelukatkoa, palautus < 5 min
- [ ] Keskitaso — Lyhyt katko mahdollinen (< 30 min)
- [ ] Korkea — Pitkä katko, laaja vaikutus, datahäviön riski

### Riskiluokan perustelu
[Miksi valitsit tämän riskiluokan? Viittaa riskimatriisiin.]

## Palautussuunnitelma (Rollback)

> Pakollinen luokille 2 ja 3. Ks. [rollback-plan-template.md](./rollback-plan-template.md)

- **Palautusstrategia:** [git revert / konfiguraation palautus / snapshot restore / muu]
- **Palautuksen kesto:** [arvio minuuteissa]
- **Palautuksen vastuuhenkilö:** [nimi]
- **Onko palautus testattu?** [Kyllä / Ei] (pakollinen luokalle 3)

## Testaussuunnitelma

> Pakollinen luokille 2 ja 3.

- **Testausympäristö:** [dev / staging]
- **Testattavat skenaariot:**
  1. [Skenaarion kuvaus]
  2. [Skenaarion kuvaus]
- **Hyväksymiskriteerit:** [Mitä testataan onnistumisen varmistamiseksi?]

## Aikaikkunat

- **Ehdotettu toteutusaika:** [YYYY-MM-DD HH:MM - HH:MM (UTC)]
- **Freeze-periodi tarkistettu:** [Kyllä / Ei / Ei sovellettavissa]
- **Kommunikaatio sidosryhmille:** [Kyllä / Ei / Ei sovellettavissa]

## Hyväksyjät

> Luokka 1: 1 hyväksyjä | Luokka 2: 2 hyväksyjää | Luokka 3: 3 hyväksyjää + CISO

1. **Hyväksyjä 1:** [Nimi] — [Rooli] — [ ] Hyväksytty
2. **Hyväksyjä 2:** [Nimi] — [Rooli] — [ ] Hyväksytty
3. **Hyväksyjä 3:** [Nimi] — [Rooli] — [ ] Hyväksytty

## Tarkistuslista

- [ ] Riskiluokka määritetty ja perusteltu
- [ ] Vaikutusanalyysi täytetty
- [ ] Palautussuunnitelma laadittu (luokat 2-3)
- [ ] Testaussuunnitelma laadittu (luokat 2-3)
- [ ] Aikaikkunat tarkistettu (luokka 3)
- [ ] Riittävä määrä hyväksyjiä nimetty
- [ ] Kommunikaatio suunniteltu (luokka 3)
