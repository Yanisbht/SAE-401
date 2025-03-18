CREATE TABLE Personne (
    id_personne INT PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(100) NOT NULL,
    nom VARCHAR(100) NOT NULL,
    date_naissance DATE NOT NULL,
    login VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Etudiant (
    id_etudiant INT PRIMARY KEY AUTO_INCREMENT,
    id_personne INT UNIQUE NOT NULL,
    neph VARCHAR(50) UNIQUE NOT NULL,
    date_inscription DATE NOT NULL,
    etg BOOLEAN NOT NULL,
    echec_etg INT DEFAULT 0,
    FOREIGN KEY (id_personne) REFERENCES Personne(id_personne) ON DELETE CASCADE
);

CREATE TABLE Admin (
    id_admin INT PRIMARY KEY AUTO_INCREMENT,
    id_personne INT UNIQUE NOT NULL,
    administrateur_reseau VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_personne) REFERENCES Personne(id_personne) ON DELETE CASCADE
);

CREATE TABLE AutoEcole (
    id_auto_ecole INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL
);

CREATE TABLE Test (
    id_test INT PRIMARY KEY AUTO_INCREMENT,
    theme VARCHAR(100) NOT NULL,
    date_test DATE NOT NULL,
    nombre_questions INT NOT NULL,
    score FLOAT CHECK (score >= 0 AND score <= 100)
);

CREATE TABLE Examens (
    id_examen INT PRIMARY KEY AUTO_INCREMENT,
    theme VARCHAR(100) NOT NULL,
    date_examen DATE NOT NULL,
    nombre_questions INT NOT NULL,
    score FLOAT CHECK (score >= 0 AND score <= 100),
    resultat VARCHAR(50) NOT NULL,
    motif_echec TEXT
);

CREATE TABLE Avis (
    id_avis INT PRIMARY KEY AUTO_INCREMENT,
    id_etudiant INT NOT NULL,
    contenu TEXT NOT NULL,
    date_depot DATE NOT NULL,
    date_publication DATE NOT NULL,
    score_avis FLOAT CHECK (score_avis >= 0 AND score_avis <= 5),
    statut_moderation VARCHAR(50) NOT NULL DEFAULT 'en attente',
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant) ON DELETE CASCADE
);

-- Relations
CREATE TABLE Appartient (
    id_etudiant INT NOT NULL,
    id_auto_ecole INT NOT NULL,
    PRIMARY KEY (id_etudiant, id_auto_ecole),
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant) ON DELETE CASCADE,
    FOREIGN KEY (id_auto_ecole) REFERENCES AutoEcole(id_auto_ecole) ON DELETE CASCADE
);

CREATE TABLE PasseTest (
    id_etudiant INT NOT NULL,
    id_test INT NOT NULL,
    PRIMARY KEY (id_etudiant, id_test),
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant) ON DELETE CASCADE,
    FOREIGN KEY (id_test) REFERENCES Test(id_test) ON DELETE CASCADE
);

CREATE TABLE PasseExamens (
    id_etudiant INT NOT NULL,
    id_examen INT NOT NULL,
    PRIMARY KEY (id_etudiant, id_examen),
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant) ON DELETE CASCADE,
    FOREIGN KEY (id_examen) REFERENCES Examens(id_examen) ON DELETE CASCADE
);
