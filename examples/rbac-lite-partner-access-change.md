# Muutospyyntö — RBAC-Lite Partner Access Control Update

## Perustiedot

- **Muutoksen nimi:** RBAC-Lite partner isolation validation update
- **Pyytäjä:** Jonne Silvennoinen
- **Päivämäärä:** 2026-06-09
- **Riskiluokka:** 2
- **Kohdeympäristö:** staging

## Kuvaus

### Mitä muutetaan?
Tämä muutospyyntö validoi RBAC-Lite-pluginin partneripohjaiseen käyttöoikeusrajaukseen liittyvän muutoksen.

Muutos koskee WordPress-pohjaista RBAC-Lite-kontrollia, jossa käyttäjän näkyvyys ja käyttöoikeudet rajataan partneriorganisaation mukaan. Tavoitteena on varmistaa, että ei-admin-käyttäjä näkee vain oman partneriorganisaationsa tiedot, ja että admin-ohitus on tarkoituksellinen, dokumentoitu ja auditoitavissa.

Related repository:

https://github.com/Jonnenpijonne/RBAC-Lite

### Mitä komponentteja muutos koskee?
- [ ] Verkko
- [ ] Tietokanta
- [ ] CI/CD
- [x] Pääsynhallinta (IAM/RBAC)
- [ ] DNS
- [ ] Sertifikaatit
- [x] Muu: WordPress user meta, audit logging, NDA enforcement

## Vaikutusanalyysi

### Todennäköisyys (ongelman)
- [ ] Matala — Rajattu, yksinkertainen muutos
- [x] Keskitaso — Useampi komponentti, rajattuja riippuvuuksia
- [ ] Korkea — Monimutkainen, useita järjestelmiä

### Vaikutus (ongelman)
- [ ] Matala — Ei palvelukatkoa, palautus < 5 min
- [ ] Keskitaso — Lyhyt katko mahdollinen (< 30 min)
- [x] Korkea — Käyttöoikeusrajan rikkoutuminen voisi aiheuttaa partnerien välisen tietovuodon

### Riskiluokan perustelu
Muutos koskee RBAC-Lite-pluginin partnerieristystä, käyttöoikeuslogiikkaa ja audit trail -todennettavuutta. Virheellinen partnerisuodatus voisi johtaa siihen, että Partner A näkee Partner B:n tietoja. Koska kyseessä on validaattorirepon integraatioesimerkki ja governance-dokumentaatio RBAC-Liteen liittyvästä access-control-muutoksesta, riskiluokka on 2. Varsinainen tuotannon partnerieristystä muuttava RBAC-Lite-koodimuutos tulisi käsitellä luokkana 3.

## Palautussuunnitelma (Rollback)

- **Palautusstrategia:** git revert ja edellisen plugin-version palautus
- **Palautuksen omistaja:** Technical Reviewer
- **Palautus testattu:** kyllä

Palautuksen vaiheet:

1. Palauta RBAC-Lite-muutos versionhallinnasta komennolla git revert.
2. Palauta tarvittaessa edellinen plugin-versio.
3. Tyhjennä välimuistit, jos käytössä on object cache tai muu cache-kerros.
4. Varmista, että aiempi partnerieristys toimii.
5. Varmista, että audit logging toimii palautuksen jälkeen.

## Testaussuunnitelma

- **Testausympäristö:** staging
- **Testaus suoritettu staging-ympäristössä:** kyllä

Testit:

1. Varmista, että Partner A -käyttäjä ei näe Partner B:n käyttäjiä tai dataa.
2. Varmista, että Partner B -käyttäjä ei näe Partner A:n käyttäjiä tai dataa.
3. Varmista, että admin-käyttäjän laajempi näkyvyys perustuu tarkoitukselliseen admin-ohitukseen.
4. Varmista, että partner assignment -muutos kirjoittuu audit logiin.
5. Varmista, että login-tapahtuma kirjoittuu audit logiin.
6. Varmista, että NDA / terms acceptance -portti toimii edelleen.
7. Varmista, ettei WordPress admin -näkymässä synny PHP fatal error -virheitä.

## Hyväksyjät

- **Hyväksyjä 1:** Product Owner
- **Hyväksyjä 2:** Technical Reviewer

## Freeze-periodi

- **Freeze-periodi tarkistettu:** kyllä
- **Tuotantojäädytys aktiivinen:** ei

Muutosta ei saa viedä tuotantoon freeze-periodin tai aktiivisen customer onboarding -jakson aikana ilman erillistä hyväksyntää.

## Viestintäsuunnitelma

Sidosryhmät:

- Product owner
- Technical maintainer
- Security/compliance reviewer
- Pilot/customer contact, jos tuotannon access behavior muuttuu

## Audit evidence

Muutoksen jälkeen kerättävä evidenssi:

- Partner A isolation test result
- Partner B isolation test result
- Audit log query result for partner assignment update
- Audit log query result for login event
- Pull request review approval records
