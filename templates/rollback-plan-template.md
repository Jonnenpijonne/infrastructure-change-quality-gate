# Palautussuunnitelma (Rollback Plan)

## Perustiedot

- **Liittyy muutospyyntöön:** [Muutoksen nimi / PR-numero]
- **Riskiluokka:** [1 / 2 / 3]
- **Palautuksen vastuuhenkilö:** [Nimi]
- **Laadittu:** [YYYY-MM-DD]

## Palautusstrategia

### Ensisijainen palautustapa
- **Menetelmä:** [git revert / konfiguraation palautus / snapshot restore / blue-green switch / muu]
- **Kuvaus:** [Yksityiskohtainen kuvaus palautuksen vaiheista]
- **Arvioitu kesto:** [minuuteissa]

### Vaihtoehtoinen palautustapa (jos ensisijainen epäonnistuu)
- **Menetelmä:** [kuvaa]
- **Kuvaus:** [vaiheet]
- **Arvioitu kesto:** [minuuteissa]

## Palautuksen vaiheet

> Kuvaa jokainen vaihe riittävällä tarkkuudella, että kuka tahansa tiimin jäsen voi suorittaa palautuksen.

1. **Vaihe 1:** [Kuvaus]
   - Komento/toimenpide: `[komento tai toimenpide]`
   - Odotettu tulos: [mitä tapahtuu]

2. **Vaihe 2:** [Kuvaus]
   - Komento/toimenpide: `[komento tai toimenpide]`
   - Odotettu tulos: [mitä tapahtuu]

3. **Vaihe 3:** [Kuvaus]
   - Komento/toimenpide: `[komento tai toimenpide]`
   - Odotettu tulos: [mitä tapahtuu]

## Palautuksen laukaisukriteerit (Rollback Triggers)

Palautus käynnistetään, jos jokin seuraavista toteutuu:

- [ ] Palvelu ei vastaa X minuutin kuluessa muutoksesta
- [ ] Virheaste nousee yli X% normaalista
- [ ] Kriittinen toiminnallisuus on rikki
- [ ] Tietoturvahavainto (välitön palautus)
- [ ] Muu: [kuvaa]

## Datan käsittely

- **Sisältääkö muutos dataan kohdistuvia muutoksia?** [Kyllä / Ei]
- **Onko data varmuuskopioitu ennen muutosta?** [Kyllä / Ei]
- **Varmuuskopion sijainti:** [kuvaa]
- **Datahäviön riski palautuksessa:** [Ei / Kyllä — kuvaa]

## Testaus

> Pakollinen luokalle 3.

- **Onko palautus testattu staging-ympäristössä?** [Kyllä / Ei]
- **Testauspäivämäärä:** [YYYY-MM-DD]
- **Testaustulokset:** [Yhteenveto]

## Kommunikaatio palautustilanteessa

- **Kuka ilmoittaa sidosryhmille?** [Nimi]
- **Ilmoituskanavat:** [Slack / sähköposti / statussivu / muu]
- **Viestirunko:** [Lyhyt esimerkki viestistä]

## Palautuksen jälkeiset toimenpiteet

1. Varmista palvelun toimivuus monitoroinnilla (X min)
2. Kirjaa incident/postmortem (luokat 2-3)
3. Päivitä muutospyyntö palautuksen syillä
4. Suunnittele korjattu muutos tarvittaessa

## Tarkistuslista

- [ ] Palautusstrategia määritelty
- [ ] Vaiheet dokumentoitu riittävällä tarkkuudella
- [ ] Laukaisukriteerit määritelty
- [ ] Datan varmuuskopiointi varmistettu
- [ ] Palautus testattu (luokka 3)
- [ ] Kommunikaatiosuunnitelma laadittu (luokka 3)
