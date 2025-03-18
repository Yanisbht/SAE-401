CREATE TABLE AutoEcole (
    id_auto_ecole INT PRIMARY KEY,
    nom VARCHAR(255),
    adresse VARCHAR(255)
);

CREATE TABLE Personne (
    id_personne INT PRIMARY KEY,
    prenom VARCHAR(100),
    nom VARCHAR(100),
    age INT,
    login VARCHAR(100) UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE Eleve (
    id_eleve INT PRIMARY KEY,
    npeh VARCHAR(50),
    id_personne INT,
    FOREIGN KEY (id_personne) REFERENCES Personne(id_personne)
);

CREATE TABLE Admin (
    id_admin INT PRIMARY KEY,
    administrateur_reseau VARCHAR(255),
    id_personne INT,
    FOREIGN KEY (id_personne) REFERENCES Personne(id_personne)
);

CREATE TABLE Test (
    id_test INT PRIMARY KEY,
    date_test DATE,
    nombre_questions INT,
    score FLOAT
);

CREATE TABLE Examens (
    id_examen INT PRIMARY KEY,
    date_examen DATE,
    nombre_questions INT,
    resultat VARCHAR(50),
    motif_echec TEXT
);

CREATE TABLE Avis (
    id_avis INT PRIMARY KEY,
    score_avis FLOAT,
    date_publication DATE,
    statut_moderation VARCHAR(50),
    id_eleve INT,
    FOREIGN KEY (id_eleve) REFERENCES Eleve(id_eleve)
);

CREATE TABLE Appartenir (
    id_auto_ecole INT,
    id_eleve INT,
    PRIMARY KEY (id_auto_ecole, id_eleve),
    FOREIGN KEY (id_auto_ecole) REFERENCES AutoEcole(id_auto_ecole),
    FOREIGN KEY (id_eleve) REFERENCES Eleve(id_eleve)
);

CREATE TABLE FaitDes (
    id_eleve INT,
    id_test INT,
    PRIMARY KEY (id_eleve, id_test),
    FOREIGN KEY (id_eleve) REFERENCES Eleve(id_eleve),
    FOREIGN KEY (id_test) REFERENCES Test(id_test)
);

CREATE TABLE Poste (
    id_eleve INT,
    id_avis INT,
    PRIMARY KEY (id_eleve, id_avis),
    FOREIGN KEY (id_eleve) REFERENCES Eleve(id_eleve),
    FOREIGN KEY (id_avis) REFERENCES Avis(id_avis)
);
