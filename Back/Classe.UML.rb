@startuml
class Personne {
    + id_personne : INT
    + prenom : VARCHAR(100)
    + nom : VARCHAR(100)
    + age : INT
    + login : VARCHAR(100)
    + password : VARCHAR(255)
}

class Eleve {
    + id_eleve : INT
    + npeh : VARCHAR(50)
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
    + date_test : DATE
    + nombre_questions : INT
    + score : FLOAT
}

class Examens {
    + id_examen : INT
    + date_examen : DATE
    + nombre_questions : INT
    + resultat : VARCHAR(50)
    + motif_echec : TEXT
}

class Avis {
    + id_avis : INT
    + score_avis : FLOAT
    + date_publication : DATE
    + statut_moderation : VARCHAR(50)
}

' Héritage
Personne <|-- Eleve
Personne <|-- Admin

' Relations
Eleve "1" -- "0..n" AutoEcole : appartient à
Eleve "1" -- "0..n" Test : passe
Eleve "1" -- "0..n" Examens : passe
Eleve "1" -- "0..n" Avis : poste

@enduml
