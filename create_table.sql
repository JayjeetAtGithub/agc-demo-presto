DROP TABLE IF EXISTS hep;
CREATE TABLE hep (
    run                 INTEGER,
    luminosityBlock     BIGINT,
    event               BIGINT,
    MET ROW(
        pt              REAL,
        phi             REAL,
        sumet           REAL,
        significance    REAL,
        CovXX           REAL,
        CovXY           REAL,
        CovYY           REAL),
    HLT ROW(
        IsoMu24_eta2p1                  BOOLEAN,
        IsoMu24                         BOOLEAN,
        IsoMu17_eta2p1_LooseIsoPFTau20  BOOLEAN),
    PV ROW(
        npvs            INTEGER,
        x               REAL,
        y               REAL,
        z               REAL),
    Muon ARRAY(ROW(
        pt              REAL,
        eta             REAL,
        phi             REAL,
        mass            REAL,
        charge          INTEGER,
        pfRelIso03_all  REAL,
        pfRelIso04_all  REAL,
        tightId         BOOLEAN,
        softId          BOOLEAN,
        dxy             REAL,
        dxyErr          REAL,
        dz              REAL,
        dzErr           REAL,
        jetIdx          INTEGER,
        genPartIdx      INTEGER)),
    Electron ARRAY(ROW(
        pt              REAL,
        eta             REAL,
        phi             REAL,
        mass            REAL,
        charge          INTEGER,
        pfRelIso03_all  REAL,
        dxy             REAL,
        dxyErr          REAL,
        dz              REAL,
        dzErr           REAL,
        cutBasedId      BOOLEAN,
        pfId            BOOLEAN,
        jetIdx          INTEGER,
        genPartIdx      INTEGER)),
    Photon ARRAY(ROW(
        pt              REAL,
        eta             REAL,
        phi             REAL,
        mass            REAL,
        charge          INTEGER,
        pfRelIso03_all  REAL,
        jetIdx          INTEGER,
        genPartIdx      INTEGER)),
    Jet ARRAY(ROW(
        pt              REAL,
        eta             REAL,
        phi             REAL,
        mass            REAL,
        puId            BOOLEAN,
        btag            REAL)),
    Tau ARRAY(ROW(
        pt              REAL,
        eta             REAL,
        phi             REAL,
        mass            REAL,
        charge          INTEGER,
        decayMode       INTEGER,
        relIso_all      REAL,
        jetIdx          INTEGER,
        genPartIdx      INTEGER,
        idDecayMode     BOOLEAN,
        idIsoRaw        REAL,
        idIsoVLoose     BOOLEAN,
        idIsoLoose      BOOLEAN,
        idIsoMedium     BOOLEAN,
        idIsoTight      BOOLEAN,
        idAntiEleLoose  BOOLEAN,
        idAntiEleMedium BOOLEAN,
        idAntiEleTight  BOOLEAN,
        idAntiMuLoose   BOOLEAN,
        idAntiMuMedium  BOOLEAN,
        idAntiMuTight   BOOLEAN))
) WITH (
    EXTERNAL_LOCATION = 'hdfs://namenode/dataset',
    FORMAT = 'PARQUET'
);
