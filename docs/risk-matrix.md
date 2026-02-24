# Riskimatriisi — Infrastruktuurimuutosten todennäköisyys ja vaikutus

## Yleiskuvaus

Tämä matriisi kuvaa infrastruktuurimuutosten riskiluokittelun perusteet. Jokainen muutos arvioidaan kahdella akselilla: **todennäköisyys** (kuinka todennäköisesti muutos aiheuttaa ongelman) ja **vaikutus** (kuinka laaja-alainen mahdollinen ongelma on).

## Todennäköisyys/vaikutus -matriisi

```
                    VAIKUTUS
                    Matala       Keskitaso     Korkea
                 ┌───────────┬───────────┬───────────┐
  Korkea         │ Luokka 2  │ Luokka 3  │ Luokka 3  │
                 ├───────────┼───────────┼───────────┤
T Keskitaso      │ Luokka 1  │ Luokka 2  │ Luokka 3  │
O               ├───────────┼───────────┼───────────┤
D Matala         │ Luokka 1  │ Luokka 1  │ Luokka 2  │
E               └───────────┴───────────┴───────────┘
N
N
Ä
K
Ö
I
S
Y
Y
S
```

## Todennäköisyyden arviointi

### Matala todennäköisyys
- Muutos on hyvin rajattu ja yksinkertainen
- Vastaava muutos on tehty aiemmin onnistuneesti
- Ei ulkoisia riippuvuuksia
- Esimerkki: README-päivitys, yksittäisen ympäristömuuttujan muutos

### Keskitason todennäköisyys
- Muutos koskee useampaa komponenttia
- Testaus on mahdollista mutta vaatii erityisjärjestelyjä
- Rajattuja ulkoisia riippuvuuksia
- Esimerkki: CI/CD-pipeline-muutos, palomuurisäännön lisäys

### Korkea todennäköisyys
- Muutos on monimutkainen ja koskee useita järjestelmiä
- Testaus tuotantoa vastaavassa ympäristössä on vaikeaa
- Merkittäviä ulkoisia riippuvuuksia
- Esimerkki: Tietokantaskeeman muutos, autentikaatiojärjestelmän päivitys

## Vaikutuksen arviointi

### Matala vaikutus
- Ei palvelukatkoa käyttäjille
- Vaikuttaa vain sisäisiin prosesseihin
- Palautus on välitön (< 5 min)
- Esimerkki: Dokumentaation korjaus, logging-tason muutos

### Keskitason vaikutus
- Mahdollinen lyhyt palvelukatko (< 30 min)
- Vaikuttaa rajattuun käyttäjäjoukkoon
- Palautus vaatii suunnitelman (< 1 h)
- Esimerkki: Load balancer -konfiguraatio, DNS-muutos

### Korkea vaikutus
- Pitkä palvelukatko mahdollinen (> 30 min)
- Vaikuttaa kaikkiin käyttäjiin tai kriittisiin järjestelmiin
- Palautus on monimutkainen tai datahäviön riski
- Esimerkki: Verkkoarkkitehtuurin muutos, tietokantamigraatio

## Riskiluokan valinta

1. Arvioi muutoksen **todennäköisyys** ja **vaikutus** yllä olevien kriteerien perusteella
2. Etsi vastaava ruutu matriisista
3. Riskiluokka määrittää vaaditut kontrollit (ks. [change-classification.md](./change-classification.md))

## Eskalointipolku

Jos riskiluokan arvioinnista on erimielisyyttä:
1. Kehittäjä ja arvioija keskustelevat PR:ssä
2. Erimielisyystilanteessa sovelletaan **korkeampaa luokkaa**
3. Luokan 3 muutoksissa turvallisuusvastaava tekee lopullisen päätöksen
