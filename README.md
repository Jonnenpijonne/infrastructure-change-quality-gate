
[![Infrastructure Change Quality Gate](https://github.com/Jonnenpijonne/infrastructure-change-quality-gate/actions/workflows/quality-gate-demo.yml/badge.svg)](https://github.com/Jonnenpijonne/infrastructure-change-quality-gate/actions/workflows/quality-gate-demo.yml)

# Infrastructure Change Quality Gate

DevSecOps-laatuporttijärjestelmä infrastruktuurimuutosten hallintaan.

## Tarkoitus

Tämä repositorio toteuttaa formaalin muutostenhallintaprosessin kriittiselle infrastruktuurille. Järjestelmä perustuu ISO 27001 -standardin muutostenhallintakontrolleihin ja tarjoaa automatisoidun laatuportin, joka varmistaa jokaisen infrastruktuurimuutoksen laadun, turvallisuuden ja jäljitettävyyden.

## Arkkitehtuuri

```
Kehittäjä → PR + muutospyyntö → Automaattinen validointi → Katselmointi → Deploy-ehto → Merge
                                      │                        │              │
                                 PORTTI 1               PORTTI 2        PORTTI 3
                              (CI/CD-skripti)        (review-politiikka)  (aikaikkunat)
```

### Kolme laatuporttia

1. **Automaattinen validointi (CI/CD)** — Python-skripti tarkistaa muutospyynnön rakenteen, riskiluokan, palautussuunnitelman ja freeze-ikkunat
2. **Manuaalinen katselmointi** — Riskiluokan mukainen arvioijien määrä (1-3 henkilöä)
3. **Deploy-ehto** — Aikaikkunan tarkistus, staging-validointi, kommunikaatiosuunnitelma kriittisille muutoksille

### Riskiluokat

| Luokka | Taso | Hyväksyjät | Esimerkkejä |
|--------|------|------------|-------------|
| 1 | Matala | 1 | Dokumentaatio, pienet konfiguraatiot |
| 2 | Keskitaso | 2 | Infra-konfiguraatio, CI/CD-muutokset, pääsynhallinta |
| 3 | Kriittinen | 3 + CISO | Verkkoarkkitehtuuri, tietokantamigraatiot, tietoturva |

## ISO 27001 -yhteys

- **A.12.1.2** Change Management — Muutokset dokumentoidaan, luokitellaan ja hyväksytään
- **A.14.2.2** System Change Control — Formaali, auditoitava muutosprosessi
- **A.12.4.1** Event Logging — Automaattinen audit trail CI/CD:n kautta

## Repositoriorakenne

```
├── .github/workflows/         # CI/CD laatuportti
├── docs/                      # Riskiluokitus ja muutosluokittelu
│   ├── risk-matrix.md
│   └── change-classification.md
├── templates/                 # Muutospyyntö- ja rollback-pohjat
│   ├── change-request-template.md
│   └── rollback-plan-template.md
├── validation/                # Automaattinen validointiskripti
│   └── pre-merge-checks/
│       └── validate-change-request.py
└── examples/                  # Valmiiksi täytetyt esimerkit (demo-haarassa)
```

## Käyttöönotto

1. Kopioi `templates/change-request-template.md` PR-kuvaukseen
2. Täytä kaikki pakolliset kentät
3. CI/CD ajaa automaattisen validoinnin
4. Pyydä katselmointi riskiluokan mukaiselta määrältä arvioijia
5. Merge sallitaan vasta kaikkien porttien läpäisyn jälkeen

## Branch-strategia

- `main` — Suojattu tuotantohaara, suorat pushat estetty
- `develop` — Aktiivinen kehityshaara
- `demo/johtoportaalle` — Valmiit esimerkit johdon demonstraatioon

## Lisenssi

Tämä projekti on julkaistu **Best Bossible License (BBL)**-lisenssillä. Katso `LICENSE`-tiedosto lisätietoja varten.

> Aiemmin README sisälsi rivin "Sisäinen käyttö. Kaikki oikeudet pidätetään." – nyt korvattu avoimella lisenssillä.
