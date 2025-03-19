@startuml
class Personne {
    + id_personne : INT
    + prenom : VARCHAR(100)
    + nom : VARCHAR(100)
    + date_naissance : DATE
    + login : VARCHAR(100)
    + password : VARCHAR(255)
}

class Etudiant {
    + id_etudiant : INT
    + neph : VARCHAR(50)
    + date_inscription : DATE
    + etg : BOOLEAN
    + echec_etg : INT
}

class Admin {
    + id_admin : INT
    + administrateur_reseau : VARCHAR(255)
}

class AutoEcole {
    + id_auto_ecole : INT
    + nom : VARCHAR(255)
    + adresse : VARCHAR(255)
}

class Test {
    + id_test : INT
    + theme : VARCHAR(100)
    + date_test : DATE
    + nombre_questions : INT
    + score : FLOAT
}

class Examens {
    + id_examen : INT
    + theme : VARCHAR(100)
    + date_examen : DATE
    + nombre_questions : INT
    + score : FLOAT
    + resultat : VARCHAR(50)
    + motif_echec : TEXT
}

class Avis {
    + id_avis : INT
    + contenu : TEXT
    + date_depot : DATE
    + date_publication : DATE
    + score_avis : FLOAT
    + statut_moderation : VARCHAR(50)
}

' Héritage
Personne <|-- Etudiant
Personne <|-- Admin

' Relations
Etudiant "1" -- "1" AutoEcole : appartient à
Etudiant "1" -- "0..n" Test : passe
Etudiant "1" -- "0..n" Examens : passe
Etudiant "1" -- "0..n" Avis : laisse

@enduml
