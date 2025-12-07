;;; This is the IDE's built-in-editor, where you create and edit
;;; lisp source code.  You could use some other editor instead,
;;; though the IDE's menu-bar commands would not be applicable there.
;;; 
;;; This editor has a tab for each file that it's editing.  You can
;;; create a new editor buffer at any time with the File | New command.
;;; Other commands such as Search | Find Definitions will create
;;; editor buffers automatically for existing code.
;;; 
;;; You can use the File | Compile and Load command to compile and
;;; load an entire file, or compile an individual definition by
;;; placing the text cursor inside it and using Tools | Incremental
;;; Compile.  You can similarly evaluate test expressions in the
;;; editor by using Tools | Incremental Evaluation; the returned
;;; values and any printed output will appear in a lisp listener
;;; in the Debug Window.
;;; 
;;; For a brief introduction to other IDE tools, try the
;;; Help | Interactive IDE Intro command.  And be sure to explore
;;; the other facilities on the Help menu.

;;; ====================================================================
;;; TP3: SYSTEME EXPERT D'ORDRE 0+ POUR LA MOBILITE INTERNATIONALE
;;; ====================================================================
;;; Fichier : tp3-expert-system.lisp
;;; Auteur : Antigravity (Generated for User)
;;; Description : Systeme expert complet avec chainage avant, arriere,
;;;               et recommandation avancee (Rules R1-R22).
;;; ====================================================================

(defpackage :tp3-expert
  (:use :common-lisp)
  (:export :menu-principal))

(in-package :tp3-expert)

;;; --------------------------------------------------------------------
;;; 1. STRUCTURES DE DONNEES ET VARIABLES GLOBALES
;;; --------------------------------------------------------------------

(defstruct regle
  nom           ; Symbole, ex: 'R1
  conditions    ; Liste de conditions, ex: '((>= NIVEAU-ANGLAIS B2))
  conclusions   ; Liste de faits a ajouter, ex: '((REGIONS-ACCESSIBLES ANGLOPHONES))
  description   ; Description textuelle pour le debug
  )

(defparameter *base-de-faits* nil
  "Liste des faits symboliques. Ex: ((BRANCHE GI) (NIVEAU-ANGLAIS B2))")

(defparameter *base-de-regles* nil
  "Liste des structures de regles.")

;;; Niveaux de langue pour les comparaisons
(defparameter *niveaux-langue* '(NIL A1 A2 B1 B2 C1 C2 LA13))

(defun valeur-niveau (niv)
  "Retourne l'index numerique d'un niveau de langue."
  (position niv *niveaux-langue*))

;;; --------------------------------------------------------------------
;;; 2. BASE DE REGLES (R1 - R22)
;;; --------------------------------------------------------------------

(defun initialiser-base-de-regles ()
  (setf *base-de-regles*
        (list
         ;; --- 1. REGLES LINGUISTIQUES ---
         (make-regle
          :nom 'R1
          :conditions '((>= NIVEAU-ANGLAIS B2))
          :conclusions '((REGIONS-ACCESSIBLES ANGLOPHONES))
          :description "SI NIVEAU-ANGLAIS >= B2 ALORS REGIONS-ACCESSIBLES += ANGLOPHONES")

         (make-regle
          :nom 'R2
          :conditions '((< NIVEAU-ANGLAIS B2))
          :conclusions '((EXCLURE-PAYS "USA") (EXCLURE-PAYS "ROYAUME-UNI"))
          :description "SI NIVEAU-ANGLAIS < B2 ALORS exclure {USA, ROYAUME-UNI}")

         (make-regle
          :nom 'R3
          :conditions '((>= NIVEAU-ANGLAIS B2))
          :conclusions '((CONSIDERER-PAYS "CANADA") (CONSIDERER-PAYS "SUEDE") (CONSIDERER-PAYS "FINLANDE"))
          :description "SI NIVEAU-ANGLAIS >= B2 ALORS considerer {CANADA, SUEDE, FINLANDE}")

         (make-regle
          :nom 'R4
          :conditions '((< NIVEAU-ALLEMAND B2))
          :conclusions '((EXCLURE-PAYS "ALLEMAGNE") (EXCLURE-DESTINATION "TU-BRAUNSCHWEIG"))
          :description "SI NIVEAU-ALLEMAND < B2 ALORS exclure ALLEMAGNE")

         (make-regle
          :nom 'R5
          :conditions '((EQUAL DESTINATION "CRANFIELD-UNIVERSITY"))
          :conclusions '((NIVEAU-REQUIS-ANGLAIS LA13))
          :description "SI destination = CRANFIELD-UNIVERSITY ALORS niveau requis = ANGLAIS LA13")

         (make-regle
          :nom 'R6
          :conditions '((>= NIVEAU-ESPAGNOL B1))
          :conclusions '((AJOUTER-DESTINATIONS "ESPAGNE") (AJOUTER-DESTINATIONS "AMERIQUE-LATINE"))
          :description "SI NIVEAU-ESPAGNOL >= B1 ALORS destinations += {ESPAGNE, AMERIQUE-LATINE}")

         ;; --- 2. REGLES LIEES A LA BRANCHE UTC ---
         (make-regle
          :nom 'R7
          :conditions '((EQUAL BRANCHE GI))
          :conclusions '((AJOUTER-OPTIONS "CANADA") (AJOUTER-OPTIONS "SUEDE") (AJOUTER-OPTIONS "ESPAGNE") (AJOUTER-OPTIONS "JAPON"))
          :description "SI BRANCHE = GI ALORS options += {CANADA, SUEDE, ESPAGNE, JAPON}")

         (make-regle
          :nom 'R8
          :conditions '((EQUAL BRANCHE IM))
          :conclusions '((AJOUTER-OPTIONS "ALLEMAGNE") (AJOUTER-OPTIONS "MAROC") (AJOUTER-OPTIONS "BRESIL") (AJOUTER-OPTIONS "JAPON"))
          :description "SI BRANCHE = IM ALORS options += {ALLEMAGNE, MAROC, BRESIL, JAPON}")

         (make-regle
          :nom 'R9
          :conditions '((EQUAL BRANCHE GSU))
          :conclusions '((AJOUTER-OPTIONS "QUEBEC") (AJOUTER-OPTIONS "SHERBROOKE"))
          :description "SI BRANCHE = GSU ALORS options += {QUEBEC, SHERBROOKE}")

         (make-regle
          :nom 'R10
          :conditions '((EQUAL BRANCHE GP))
          :conclusions '((AJOUTER-OPTIONS "ARGENTINE") (AJOUTER-OPTIONS "COLOMBIE"))
          :description "SI BRANCHE = GP ALORS options += {ARGENTINE, COLOMBIE}")

         (make-regle
          :nom 'R11
          :conditions '((EQUAL DESTINATION "TU-BRAUNSCHWEIG"))
          :conclusions '((BRANCHES-ADMISSIBLES GB GP IM GSU))
          :description "SI destination = TU-BRAUNSCHWEIG ALORS branches admissibles = {GB, GP, IM, GSU}")

         ;; --- 3. REGLES LIEES AU BUDGET ---
         (make-regle
          :nom 'R12
          :conditions '((EQUAL BUDGET FAIBLE))
          :conclusions '((PRIVILEGIER-REGION "EUROPE") (AJOUTER-OPTIONS "ESPAGNE") (AJOUTER-OPTIONS "PORTUGAL") (AJOUTER-OPTIONS "ALLEMAGNE"))
          :description "SI BUDGET = FAIBLE ALORS privilegier Europe")

         (make-regle
          :nom 'R13
          :conditions '((EQUAL BUDGET FAIBLE))
          :conclusions '((EXCLURE-PAYS "USA") (EXCLURE-PAYS "AUSTRALIE"))
          :description "SI BUDGET = FAIBLE ALORS exclure {USA, AUSTRALIE}")

         (make-regle
          :nom 'R14
          :conditions '((EQUAL BUDGET ELEVE))
          :conclusions '((AJOUTER-OPTIONS "JAPON") (AJOUTER-OPTIONS "CHINE") (AJOUTER-OPTIONS "CANADA"))
          :description "SI BUDGET = ELEVE ALORS options += {JAPON, CHINE, CANADA}")

         ;; --- 4. REGLES LIEES AU TYPE DE PROGRAMME ---
         (make-regle
          :nom 'R15
          :conditions '((EQUAL OBJECTIF DOUBLE-DIPLOME))
          :conclusions '((DUREE-MINIMALE 12))
          :description "SI OBJECTIF = DOUBLE-DIPLOME ALORS duree minimale >= 12 mois")

         (make-regle
          :nom 'R16
          :conditions '((EQUAL OBJECTIF DOUBLE-DIPLOME))
          :conclusions '((OPTIONS-RESTREINTES "TU-BRAUNSCHWEIG") (OPTIONS-RESTREINTES "POLY-MONTREAL") (OPTIONS-RESTREINTES "UTFPR") (OPTIONS-RESTREINTES "UPC-BARCELONE") (OPTIONS-RESTREINTES "CHIBA-UNIVERSITY"))
          :description "SI OBJECTIF = DOUBLE-DIPLOME ALORS options restreintes")

         (make-regle
          :nom 'R17
          :conditions '((EQUAL OBJECTIF SEMESTRE))
          :conclusions '((TOUTES-DESTINATIONS-POSSIBLES T))
          :description "SI OBJECTIF = SEMESTRE ALORS toutes destinations possibles")

         (make-regle
          :nom 'R18
          :conditions '((EQUAL OBJECTIF STAGE))
          :conclusions '((REGION-PREFEREE ANGLOPHONE))
          :description "SI OBJECTIF = STAGE ALORS regions preferees = ANGLOPHONES")

         (make-regle
          :nom 'R19
          :conditions '((EQUAL DESTINATION "TU-BRAUNSCHWEIG"))
          :conclusions '((DUREE-OBLIGATOIRE 18))
          :description "SI destination = TU-BRAUNSCHWEIG ALORS duree obligatoire = 18 mois")

         ;; --- 5. REGLES LIEES AU CLIMAT ET A LA CULTURE ---
         (make-regle
          :nom 'R20
          :conditions '((EQUAL CLIMAT-PREFERE FROID))
          :conclusions '((PROPOSER-PAYS "FINLANDE") (PROPOSER-PAYS "SUEDE") (PROPOSER-PAYS "CANADA"))
          :description "SI CLIMAT-PREFERE = FROID ALORS proposer {FINLANDE, SUEDE, CANADA}")

         (make-regle
          :nom 'R21
          :conditions '((EQUAL CLIMAT-PREFERE CHAUD))
          :conclusions '((PROPOSER-PAYS "BRESIL") (PROPOSER-PAYS "ESPAGNE") (PROPOSER-PAYS "ITALIE"))
          :description "SI CLIMAT-PREFERE = CHAUD ALORS proposer {BRESIL, ESPAGNE, ITALIE}")

         (make-regle
          :nom 'R22
          :conditions '((EQUAL PREFERENCE-CULTURELLE ASIATIQUE))
          :conclusions '((AJOUTER-OPTIONS "JAPON") (AJOUTER-OPTIONS "CHINE") (AJOUTER-OPTIONS "COREE-DU-SUD"))
          :description "SI PREFERENCE-CULTURELLE = ASIATIQUE ALORS options += {JAPON, CHINE, COREE-DU-SUD}")
         )))

;;; --------------------------------------------------------------------
;;; 3. MOTEUR D'INFERENCE (CHAINAGE AVANT)
;;; --------------------------------------------------------------------

(defun recuperer-fait (attribut base)
  "Retourne la valeur associee a l'attribut dans la base, ou NIL."
  (let ((res (assoc attribut base)))
    (if res (cadr res) nil)))

(defun evaluer-condition (cond base)
  "Evalue une condition simple (op attr val) ou (equal attr val)."
  (let* ((operateur (first cond))
         (attribut (second cond))
         (valeur-cible (third cond))
         (valeur-reelle (recuperer-fait attribut base)))
    
    (when valeur-reelle
      (cond
        ((member operateur '(>= > <= <))
         (let ((v1 (valeur-niveau valeur-reelle))
               (v2 (valeur-niveau valeur-cible)))
           (if (and v1 v2)
               (funcall operateur v1 v2)
               nil)))
        ((equal operateur 'EQUAL)
         (equal valeur-reelle valeur-cible))
        (t nil)))))

(defun verifier-conditions (conditions base)
  "Retourne T si toutes les conditions sont vraies."
  (every (lambda (c) (evaluer-condition c base)) conditions))

(defun fait-existe-p (fait base)
  "Verifie si le fait est deja present."
  (member fait base :test #'equal))

(defun chainage-avant ()
  "Moteur de chainage avant avec saturation."
  (format t "~%[MOTEUR] Demarrage du chainage avant...~%")
  (let ((nouveau-fait t))
    (loop while nouveau-fait do
      (setf nouveau-fait nil)
      (dolist (r *base-de-regles*)
        (when (verifier-conditions (regle-conditions r) *base-de-faits*)
          (dolist (c (regle-conclusions r))
            (unless (fait-existe-p c *base-de-faits*)
              (push c *base-de-faits*)
              (setf nouveau-fait t)
              ;; (format t "   -> Regle ~a declenchee : Ajout de ~a~%" (regle-nom r) c)
              ))))))
  (format t "[MOTEUR] Saturation atteinte.~%")
  (analyser-et-recommander))

;;; --------------------------------------------------------------------
;;; 4. ANALYSE ET RECOMMANDATION (AMELIOREE)
;;; --------------------------------------------------------------------

;;; Base de connaissances statique sur les destinations pour l'explication
;;; Base de connaissances statique sur les UNIVERSITES
(defparameter *universites*
  '(
    ("UP-Tirana" :pays "Albanie" :langue NIL :niveau NIL :cout FAIBLE :climat TEMPERE :branches (GI))
    ("TU-Braunschweig" :pays "Allemagne" :langue ALLEMAND :niveau B2 :cout MOYEN :climat TEMPERE :branches (GB GP IM GSU))
    ("Berlin School of Economics and Law" :pays "Allemagne" :langue ANGLAIS :niveau B2 :cout MOYEN :climat TEMPERE :branches (IM GSU))
    ("Vienna University of Econ. & Law" :pays "Autriche" :langue ANGLAIS :niveau B2 :cout ELEVE :climat FROID :branches (IM GSU))
    ("UPC Barcelona" :pays "Espagne" :langue ESPAGNOL :niveau B1 :cout FAIBLE :climat CHAUD :branches (GI))
    ("Univ. Torino (EPOG+)" :pays "Italie" :langue ANGLAIS :niveau B2 :cout MOYEN :climat CHAUD :branches (IM GSU))
    ("Univ. Roma Tre (EPOG+)" :pays "Italie" :langue ANGLAIS :niveau B2 :cout MOYEN :climat CHAUD :branches (IM GSU))
    ("Univ. Genova" :pays "Italie" :langue NIL :niveau NIL :cout MOYEN :climat CHAUD :branches (GI))
    ("Cranfield University" :pays "Royaume-Uni" :langue ANGLAIS :niveau LA13 :cout ELEVE :climat TEMPERE :branches (GB GP GI IM))
    ("Univ. Witwatersrand" :pays "Afrique-du-Sud" :langue ANGLAIS :niveau B2 :cout FAIBLE :climat CHAUD :branches (IM GSU))
    ("Univ. Francaise Egypte" :pays "Egypte" :langue NIL :niveau NIL :cout FAIBLE :climat CHAUD :branches (GI))
    ("ENSAM Rabat" :pays "Maroc" :langue ANGLAIS :niveau B2 :cout FAIBLE :climat CHAUD :branches (IM))
    ("Universidad Nacional del Sur" :pays "Argentine" :langue ESPAGNOL :niveau B1 :cout FAIBLE :climat CHAUD :branches (GP))
    ("Universidad Favaloro" :pays "Argentine" :langue ESPAGNOL :niveau B1 :cout FAIBLE :climat CHAUD :branches (GB))
    ("UFPR" :pays "Bresil" :langue NIL :niveau NIL :cout FAIBLE :climat CHAUD :branches (IM))
    ("UTFPR" :pays "Bresil" :langue NIL :niveau NIL :cout FAIBLE :climat CHAUD :branches (GB GP IM))
    ("UNIFEI" :pays "Bresil" :langue NIL :niveau NIL :cout FAIBLE :climat CHAUD :branches (IM))
    ("PUCPR" :pays "Bresil" :langue NIL :niveau NIL :cout FAIBLE :climat CHAUD :branches (IM GI))
    ("Universidad de Valparaiso" :pays "Chili" :langue ESPAGNOL :niveau B1 :cout FAIBLE :climat TEMPERE :branches (GB))
    ("Escuela Colombiana de Ing." :pays "Colombie" :langue ESPAGNOL :niveau B1 :cout FAIBLE :climat CHAUD :branches (GB GI IM GP GSU))
    ("ETS Montreal" :pays "Canada" :langue NIL :niveau NIL :cout MOYEN :climat FROID :branches (GI IM GSU GP GM GB))
    ("Polytechnique Montreal" :pays "Canada" :langue ANGLAIS :niveau B2 :cout MOYEN :climat FROID :branches (GI IM GSU GP GM GB))
    ("UQAC" :pays "Canada" :langue NIL :niveau NIL :cout MOYEN :climat FROID :branches (GI GSU IM))
    ("Universite Laval" :pays "Canada" :langue NIL :niveau NIL :cout MOYEN :climat FROID :branches (IM GI))
    ("Sherbrooke" :pays "Canada" :langue FRANCAIS :niveau NIL :cout MOYEN :climat FROID :branches (GSU))
    ("Georgia Tech" :pays "USA" :langue ANGLAIS :niveau C1 :cout ELEVE :climat TEMPERE :branches (GI IM))
    ("Univ. Rhode Island" :pays "USA" :langue ANGLAIS :niveau B2 :cout ELEVE :climat TEMPERE :branches (IM))
    ("Xian Jiaotong University" :pays "Chine" :langue ANGLAIS :niveau C1 :cout MOYEN :climat TEMPERE :branches (GB GI IM))
    ("UTSEUS Shanghai" :pays "Chine" :langue ANGLAIS :niveau B2 :cout MOYEN :climat TEMPERE :branches (IM GI))
    ("Chiba Institute of Technology" :pays "Japon" :langue ANGLAIS :niveau B2 :cout ELEVE :climat TEMPERE :branches (GI IM))
    ("Universite Libanaise" :pays "Liban" :langue ANGLAIS :niveau B2 :cout FAIBLE :climat CHAUD :branches (GI IM))
    ("USEK" :pays "Liban" :langue ANGLAIS :niveau B2 :cout FAIBLE :climat CHAUD :branches (GI IM GSU))))

(defun get-univ-info (univ key)
  (let ((entry (assoc univ *universites* :test #'string-equal)))
    (if entry (getf (cdr entry) key) nil)))

(defun get-universities-for-country (country)
  "Retourne la liste des universites associees a un pays."
  (let ((res nil))
    (dolist (u *universites*)
      (when (string-equal (getf (cdr u) :pays) country)
        (push (car u) res)))
    res))

(defun generer-analyse (univ-name)
  "Genere une liste de points forts et faibles pour une UNIVERSITE donnee."
  (let ((points-forts nil)
        (points-faibles nil)
        (user-branche (recuperer-fait 'BRANCHE *base-de-faits*))
        (user-anglais (recuperer-fait 'NIVEAU-ANGLAIS *base-de-faits*))
        (user-allemand (recuperer-fait 'NIVEAU-ALLEMAND *base-de-faits*))
        (user-espagnol (recuperer-fait 'NIVEAU-ESPAGNOL *base-de-faits*))
        (user-budget (recuperer-fait 'BUDGET *base-de-faits*))
        (user-climat (recuperer-fait 'CLIMAT-PREFERE *base-de-faits*))
        
        ;; Infos universite
        (univ-pays (get-univ-info univ-name :pays))
        (univ-langue (get-univ-info univ-name :langue))
        (univ-niveau (get-univ-info univ-name :niveau))
        (univ-cout (get-univ-info univ-name :cout))
        (univ-climat (get-univ-info univ-name :climat))
        (univ-branches (get-univ-info univ-name :branches)))

    (unless univ-pays
      (return-from generer-analyse (list nil (list "Universite inconnue ou donnees manquantes"))))

    ;; 1. Analyse Branche
    (if (and univ-branches (member user-branche univ-branches))
        (push "Votre branche est acceptee dans ce partenariat" points-forts)
        (when univ-branches
           (push (format nil "Programme difficile car votre branche (~a) n'est pas explicitement listee" user-branche) points-faibles)))

    ;; 2. Analyse Langue
    (let ((user-lang-level 
           (case univ-langue
             (ANGLAIS user-anglais)
             (ALLEMAND user-allemand)
             (ESPAGNOL user-espagnol)
             (t nil))))
      
      (if univ-niveau
          (if (and user-lang-level (>= (valeur-niveau user-lang-level) (valeur-niveau univ-niveau)))
              (push "Compatibilite linguistique suffisante pour etudier dans cette universite" points-forts)
              (push (format nil "Programme difficile car le niveau ~a requis est plus eleve (~a)" univ-langue univ-niveau) points-faibles))
          ;; Si pas de niveau requis specifique
          (push "Pas de barriere linguistique majeure identifiee" points-forts)))

    ;; 3. Analyse Budget
    (cond
      ((equal user-budget 'ELEVE)
       (push "Budget confortable pour cette destination" points-forts))
      ((equal user-budget 'FAIBLE)
       (if (member univ-cout '(ELEVE MOYEN))
           (push "Co t de la vie eleve pour un budget moyen/faible" points-faibles)
           (push "Budget compatible avec le cout de la vie" points-forts)))
      ((equal user-budget 'MOYEN)
       (if (equal univ-cout 'ELEVE)
           (push "Co t de la vie eleve pour un budget moyen" points-faibles)
           (push "Budget compatible avec le cout de la vie" points-forts))))

    ;; 4. Analyse Climat
    (if (equal user-climat univ-climat)
        (push "Votre climat prefere correspond bien au pays de cette universite" points-forts)
        (when (and user-climat univ-climat)
          (push (format nil "Le climat ~a est different de votre preference (~a)" univ-climat user-climat) points-faibles)))

    (list points-forts points-faibles)))

(defun collecter-valeurs (cle)
  "Collecte toutes les valeurs pour une cle donnee dans la base de faits."
  (let ((valeurs nil))
    (dolist (f *base-de-faits*)
      (when (equal (car f) cle)
        (push (cadr f) valeurs)))
    valeurs))

(defun analyser-et-recommander ()
  "Analyse les faits deduits pour proposer des destinations (UNIVERSITES)."
  (let ((candidats (collecter-valeurs 'AJOUTER-OPTIONS))
        (propositions (collecter-valeurs 'PROPOSER-PAYS))
        (considerations (collecter-valeurs 'CONSIDERER-PAYS))
        (destinations-sup (collecter-valeurs 'AJOUTER-DESTINATIONS))
        (exclus (collecter-valeurs 'EXCLURE-PAYS))
        (options-restreintes (collecter-valeurs 'OPTIONS-RESTREINTES))
        (raw-list nil)
        (final-univ-list nil))

    ;; Fusionner toutes les suggestions positives
    (setf raw-list (append candidats propositions considerations destinations-sup))
    
    ;; Filtrer par options restreintes si present
    (when options-restreintes
      (if raw-list
          (setf raw-list (intersection raw-list options-restreintes :test #'equal))
          (setf raw-list options-restreintes)))

    ;; Retirer les doublons initiaux
    (setf raw-list (remove-duplicates raw-list :test #'equal))

    ;; Appliquer les exclusions (sur les pays ou noms directs)
    (setf raw-list (set-difference raw-list exclus :test #'equal))

    ;; EXPANSION : Convertir tout en universites
    (dolist (item raw-list)
      (cond
        ;; Si c'est une universite connue, on l'ajoute
        ((get-univ-info item :pays)
         (push item final-univ-list))
        ;; Si c'est un pays, on ajoute toutes ses universites
        ((get-universities-for-country item)
         (dolist (u (get-universities-for-country item))
           (push u final-univ-list)))
        ;; Sinon (cas AMERIQUE-LATINE, EUROPE...), on ignore ou on pourrait etendre plus intelligemment
        (t nil)))

    ;; Retirer les doublons finaux
    (setf final-univ-list (remove-duplicates final-univ-list :test #'string-equal))

    ;; Affichage
    (format t "~%=======================================~%")
    (if final-univ-list
        (progn
          (if (= (length final-univ-list) 1)
              (afficher-destination-ideale (first final-univ-list))
              (afficher-alternatives final-univ-list)))
        (afficher-alternatives nil))))

(defun afficher-destination-ideale (univ)
  (let ((analyse (generer-analyse univ))
        (pays (get-univ-info univ :pays)))
    (format t "--- DESTINATION IDEALE TROUVEE ---~%~%")
    (format t "~a (~a)~%~%" univ pays)
    (format t "Raisons positives :~%")
    (dolist (p (first analyse))
      (format t "- ~a~%" p))
    (format t "~%Conclusion : cette universite correspond tres bien a votre profil.~%")))

(defun afficher-alternatives (liste)
  (if liste
      (progn
        (format t "--- RESULTATS DE LA RECHERCHE ---~%~%")
        (format t "Voici les universites recommandees pour votre profil :~%~%")
        (let ((top-3 (subseq liste 0 (min 3 (length liste)))))
          (loop for univ in top-3
                for i from 1 do
                (let ((analyse (generer-analyse univ))
                      (pays (get-univ-info univ :pays)))
                  (format t "~a) ~a (~a)~%" i univ pays)
                  (format t "   Raisons positives :~%")
                  (if (first analyse)
                      (dolist (p (first analyse)) (format t "   - ~a~%" p))
                      (format t "   - Aucune raison specifique detectee~%"))
                  (format t "   Ce qui manque / limites :~%")
                  (if (second analyse)
                      (dolist (p (second analyse)) (format t "   - ~a~%" p))
                      (format t "   - Aucune contre-indication majeure detectee~%"))
                  (format t "~%")))))
      (progn
        (format t "--- AUCUNE DESTINATION PARFAITE ---~%~%")
        (format t "Aucune destination ne correspond parfaitement a vos criteres stricts.~%")
        (format t "Je vous propose neanmoins 3 universites variees :~%~%")
        (let ((defaults '("Aalto University" "UPC Barcelona" "KTH Royal Institute of Technology")))
          (loop for univ in defaults
                for i from 1 do
                (let ((analyse (generer-analyse univ))
                      (pays (get-univ-info univ :pays)))
                  (format t "~a) ~a (~a)~%" i univ pays)
                  (format t "   Raisons positives :~%")
                  (dolist (p (first analyse)) (format t "   - ~a~%" p))
                  (format t "   Ce qui manque / limites :~%")
                  (dolist (p (second analyse)) (format t "   - ~a~%" p))
                  (format t "~%")))))))

;;; --------------------------------------------------------------------
;;; 5. CHAINAGE ARRIERE / VERIFICATION
;;; --------------------------------------------------------------------

(defun verifier-destination (input)
  ;; 1. Identifier si c'est un pays ou une universite
  (let ((univ-cible nil))
    (cond
      ;; Cas 1 : C'est une universite connue
      ((get-univ-info input :pays)
       (setf univ-cible input))
      
      ;; Cas 2 : C'est un pays -> On prend une universite representative
      ((get-universities-for-country input)
       (setf univ-cible (first (get-universities-for-country input))))
      
      ;; Cas 3 : Inconnu
      (t 
       (format t "Destination inconnue ou non geree : ~a~%" input)
       (return-from verifier-destination)))

    (let* ((pays (get-univ-info univ-cible :pays))
           (analyse (generer-analyse univ-cible))
           (points-positifs (first analyse))
           (points-negatifs (second analyse)))

      (format t "~%--- ANALYSE DE LA DESTINATION : ~a (~a) ---~%~%" univ-cible pays)

      (if (null points-negatifs)
          (progn
            (format t "Points compatibles :~%")
            (dolist (p points-positifs) (format t "- ~a~%" p))
            (format t "~%Conclusion :~%")
            (format t "Destination tres adaptee a votre profil.~%"))
          (progn
            (format t "Points compatibles :~%")
            (dolist (p points-positifs) (format t "- ~a~%" p))
            (format t "~%Points problematiques :~%")
            (dolist (p points-negatifs) (format t "- ~a~%" p))
            (format t "~%Conclusion :~%")
            (format t "Destination plutot a eviter pour votre profil actuel.~%"))))))

;;; --------------------------------------------------------------------
;;; 6. INTERFACE UTILISATEUR
;;; --------------------------------------------------------------------

(defun poser-question (texte valid-options)
  "Pose une question et valide la reponse (insensible a la casse et au package)."
  (format t "~a ~a : " texte valid-options)
  (finish-output)
  (let ((rep (read)))
    ;; On cherche l'option qui a le meme nom (string-equal) pour eviter les problemes de package
    (let ((match (find rep valid-options :test (lambda (x y) (string-equal (string x) (string y))))))
      (if match
          match
          (progn
            (format t "Reponse invalide. Essayez encore.~%")
            (poser-question texte valid-options))))))

(defun interview-etudiant ()
  (format t "~%--- INTERVIEW DU CANDIDAT ---~%")
  (setf *base-de-faits* nil)
  
  (push `(BRANCHE ,(poser-question "Quelle est votre branche ?" '(GI IM GSU GP GM GB))) *base-de-faits*)
  (push `(NIVEAU-ANGLAIS ,(poser-question "Niveau d'anglais ?" '(A1 A2 B1 B2 C1 C2))) *base-de-faits*)
  
  (format t "Niveau d'allemand (NIL si aucun) ? ")
  (finish-output)
  (push `(NIVEAU-ALLEMAND ,(read)) *base-de-faits*)
  
  (format t "Niveau d'espagnol (NIL si aucun) ? ")
  (finish-output)
  (push `(NIVEAU-ESPAGNOL ,(read)) *base-de-faits*)
  
  (push `(BUDGET ,(poser-question "Budget ?" '(FAIBLE MOYEN ELEVE))) *base-de-faits*)
  (push `(CLIMAT-PREFERE ,(poser-question "Climat prefere ?" '(FROID TEMPERE CHAUD))) *base-de-faits*)
  (push `(OBJECTIF ,(poser-question "Objectif ?" '(SEMESTRE STAGE DOUBLE-DIPLOME))) *base-de-faits*)
  (push `(PREFERENCE-CULTURELLE ,(poser-question "Preference culturelle ?" '(EUROPEENNE ASIATIQUE NORDIQUE LATINE AUCUNE))) *base-de-faits*)
  
  (format t "~%Profil enregistre en memoire.~%"))

(defun menu-principal ()
  (initialiser-base-de-regles)
  (loop
    (format t "~%=======================================~%")
    (format t "  SYSTEME EXPERT MOBILITE INTERNATIONALE (TP3)~%")
    (format t "=======================================~%")
    (format t "1. Saisir / Modifier mon profil (Interview)~%")
    (format t "2. Trouver ma destination ideale (Chainage Avant)~%")
    (format t "3. Verifier une destination (Chainage Arriere)~%")
    (format t "4. Quitter~%")
    (format t "=======================================~%")
    (format t "Votre choix : ")
    (finish-output)
    (let ((choix (read)))
      (case choix
        (1 (interview-etudiant))
        (2 (if *base-de-faits*
               (chainage-avant)
               (format t "Veuillez d'abord saisir votre profil (Option 1).~%")))
        (3 (if *base-de-faits*
               (progn
                 (format t "Entrez le nom de la destination a verifier (ex: \"CANADA\", \"TU-BRAUNSCHWEIG\") : ")
                 (finish-output)
                 (verifier-destination (read)))
               (format t "Veuillez d'abord saisir votre profil (Option 1).~%")))
        (4 (return-from menu-principal "Au revoir !"))
        (t (format t "Choix invalide.~%"))))))

;;;; (load "c:/Users/TT/.gemini/antigravity/scratch/tp3_expert_system/tp3-expert-system.lisp")
;;;; (tp3-expert:menu-principal)