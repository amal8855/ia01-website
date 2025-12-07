// --- DONNEES : UNIVERSITES ---
const universites = [
    // --- ALBANIE ---
    {
        id: "UP-TIRANA",
        nom: "Université Polytechnique de Tirana",
        pays: "Albanie",
        climat: "TEMPERE",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GI"],
        objectifsOK: ["SEMESTRE", "DOUBLE-DIPLOME"]
    },

    // --- ALLEMAGNE ---
    {
        id: "TU-BRAUNSCHWEIG",
        nom: "TU Braunschweig",
        pays: "Allemagne",
        climat: "TEMPERE",
        cout: "MOYEN",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "B2" }, // LA03
        branchesOK: ["GB", "GP", "IM", "GSU"],
        objectifsOK: ["SEMESTRE", "DOUBLE-DIPLOME"]
    },
    {
        id: "BERLIN-EPOG",
        nom: "Berlin School of Economics and Law (EPOG+)",
        pays: "Allemagne",
        climat: "TEMPERE",
        cout: "MOYEN",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM", "GSU"], // Inferred EPOG -> Eco/Gestion -> IM/GSU
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    },

    // --- AUTRICHE ---
    {
        id: "VIENNA-EPOG",
        nom: "Vienna University of Econ. & Law (EPOG+)",
        pays: "Autriche",
        climat: "FROID",
        cout: "ELEVE",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM", "GSU"],
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    },

    // --- ESPAGNE ---
    {
        id: "UPC",
        nom: "Universitat Politècnica de Catalunya",
        pays: "Espagne",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "B1", allemandMin: "NIL" },
        branchesOK: ["GI"],
        objectifsOK: ["SEMESTRE", "DOUBLE-DIPLOME"]
    },

    // --- ITALIE ---
    {
        id: "TORINO-EPOG",
        nom: "Università degli studi di Torino (EPOG+)",
        pays: "Italie",
        climat: "CHAUD",
        cout: "MOYEN",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM", "GSU"],
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    },
    {
        id: "ROMA-TRE-EPOG",
        nom: "Università degli studi di Roma Tre (EPOG+)",
        pays: "Italie",
        climat: "CHAUD",
        cout: "MOYEN",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM", "GSU"],
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    },
    {
        id: "GENOVA",
        nom: "Università degli studi di Genova",
        pays: "Italie",
        climat: "CHAUD",
        cout: "MOYEN",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GI"],
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    },

    // --- ROYAUME-UNI ---
    {
        id: "CRANFIELD",
        nom: "Cranfield University",
        pays: "Royaume-Uni",
        climat: "TEMPERE",
        cout: "ELEVE",
        langues: { anglaisMin: "C1", espagnolMin: "NIL", allemandMin: "NIL" }, // LA13
        branchesOK: ["GB", "GP", "GI", "IM"],
        objectifsOK: ["SEMESTRE", "DOUBLE-DIPLOME"]
    },

    // --- AFRIQUE DU SUD ---
    {
        id: "WITWATERSRAND",
        nom: "University of the Witwatersrand (EPOG+)",
        pays: "Afrique du Sud",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM", "GSU"],
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    },

    // --- EGYPTE ---
    {
        id: "UFE",
        nom: "Université Française d’Egypte",
        pays: "Egypte",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GI"],
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    },

    // --- MAROC ---
    {
        id: "ENSAM-RABAT",
        nom: "ENSAM Rabat",
        pays: "Maroc",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM"],
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE", "STAGE"]
    },

    // --- ARGENTINE ---
    {
        id: "UNS-BAHIA",
        nom: "Universidad Nacional del Sur",
        pays: "Argentine",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "B1", allemandMin: "NIL" },
        branchesOK: ["GP"],
        objectifsOK: ["SEMESTRE"]
    },
    {
        id: "FAVALORO",
        nom: "Universidad Favaloro",
        pays: "Argentine",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "B1", allemandMin: "NIL" },
        branchesOK: ["GB"],
        objectifsOK: ["SEMESTRE"]
    },

    // --- BRESIL ---
    {
        id: "UFPR",
        nom: "Universidade Federal do Paraná",
        pays: "Brésil",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM"],
        objectifsOK: ["SEMESTRE"]
    },
    {
        id: "UTFPR",
        nom: "UTFPR",
        pays: "Brésil",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GB", "GP", "IM"],
        objectifsOK: ["SEMESTRE", "DOUBLE-DIPLOME"]
    },
    {
        id: "UNIFEI",
        nom: "UNIFEI (Itajubá)",
        pays: "Brésil",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM"],
        objectifsOK: ["SEMESTRE"]
    },
    {
        id: "PUCPR",
        nom: "Pontifícia Universidade Católica do Paraná",
        pays: "Brésil",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM", "GI"],
        objectifsOK: ["SEMESTRE"]
    },

    // --- CHILI ---
    {
        id: "U-VALPARAISO",
        nom: "Universidad de Valparaiso",
        pays: "Chili",
        climat: "TEMPERE",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "B1", allemandMin: "NIL" },
        branchesOK: ["GB"],
        objectifsOK: ["SEMESTRE"]
    },

    // --- COLOMBIE ---
    {
        id: "ECI",
        nom: "Escuela Colombiana de Ingeniería",
        pays: "Colombie",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "NIL", espagnolMin: "B1", allemandMin: "NIL" },
        branchesOK: ["GB", "GI", "IM", "GP", "GSU"], // "GU" interpreted as GSU
        objectifsOK: ["SEMESTRE"]
    },

    // --- CANADA ---
    {
        id: "ETS",
        nom: "École de technologie supérieure (ETS)",
        pays: "Canada",
        climat: "FROID",
        cout: "MOYEN",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GI", "IM", "GSU", "GP", "GM", "GB"],
        objectifsOK: ["SEMESTRE", "DOUBLE-DIPLOME"]
    },
    {
        id: "POLY-MTL",
        nom: "École Polytechnique de Montréal",
        pays: "Canada",
        climat: "FROID",
        cout: "MOYEN",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GI", "IM", "GSU", "GP", "GM", "GB"],
        objectifsOK: ["SEMESTRE", "DOUBLE-DIPLOME"]
    },
    {
        id: "UQAC",
        nom: "Université du Québec à Chicoutimi",
        pays: "Canada",
        climat: "FROID",
        cout: "MOYEN",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GI", "GSU", "IM"],
        objectifsOK: ["SEMESTRE"]
    },
    {
        id: "LAVAL",
        nom: "Université Laval",
        pays: "Canada",
        climat: "FROID",
        cout: "MOYEN",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM", "GI"],
        objectifsOK: ["SEMESTRE"]
    },
    {
        id: "SHERBROOKE",
        nom: "Université de Sherbrooke",
        pays: "Canada",
        climat: "FROID",
        cout: "MOYEN",
        langues: { anglaisMin: "NIL", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GSU"],
        objectifsOK: ["SEMESTRE"]
    },

    // --- USA ---
    {
        id: "GEORGIA-TECH",
        nom: "Georgia Institute of Technology",
        pays: "USA",
        climat: "TEMPERE",
        cout: "ELEVE",
        langues: { anglaisMin: "C1", espagnolMin: "NIL", allemandMin: "NIL" }, // TOEFL+GRE ~ C1
        branchesOK: ["GI", "IM"],
        objectifsOK: ["SEMESTRE", "DOUBLE-DIPLOME"]
    },
    {
        id: "URI",
        nom: "University of Rhode Island",
        pays: "USA",
        climat: "TEMPERE",
        cout: "ELEVE",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM"],
        objectifsOK: ["SEMESTRE"]
    },

    // --- CHINE ---
    {
        id: "XIAN-JIAOTONG",
        nom: "Xi'an Jiaotong University",
        pays: "Chine",
        climat: "TEMPERE",
        cout: "MOYEN",
        langues: { anglaisMin: "C1", espagnolMin: "NIL", allemandMin: "NIL" }, // LA13
        branchesOK: ["GB", "GI", "IM"],
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    },
    {
        id: "UTSEUS",
        nom: "UTSEUS (Shanghai)",
        pays: "Chine",
        climat: "TEMPERE",
        cout: "MOYEN",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["IM", "GI"], // Mecatronics/Systems
        objectifsOK: ["DOUBLE-DIPLOME"]
    },

    // --- JAPON ---
    {
        id: "CHIBA",
        nom: "Chiba Institute of Technology",
        pays: "Japon",
        climat: "TEMPERE",
        cout: "ELEVE",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GI", "IM"],
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    },

    // --- LIBAN ---
    {
        id: "UL-LIBAN",
        nom: "Université Libanaise",
        pays: "Liban",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GI", "IM"],
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    },
    {
        id: "USEK",
        nom: "Université Saint-Esprit de Kaslik",
        pays: "Liban",
        climat: "CHAUD",
        cout: "FAIBLE",
        langues: { anglaisMin: "B2", espagnolMin: "NIL", allemandMin: "NIL" },
        branchesOK: ["GI", "IM", "GSU"], // Inferred from Innovation/Services
        objectifsOK: ["DOUBLE-DIPLOME", "SEMESTRE"]
    }
];

// --- UTILITAIRES ---

// Conversion niveau langue en valeur numérique pour comparaison
function getLangValue(level) {
    const levels = ["NIL", "A1", "A2", "B1", "B2", "C1", "C2"];
    return levels.indexOf(level);
}

// Initialisation au chargement
document.addEventListener('DOMContentLoaded', () => {
    const select = document.getElementById('univ-target');
    universites.forEach(u => {
        const opt = document.createElement('option');
        opt.value = u.id;
        opt.textContent = `${u.nom} (${u.pays})`;
        select.appendChild(opt);
    });
});

// --- LOGIQUE METIER ---

function getProfil() {
    return {
        branche: document.getElementById('branche').value,
        anglais: document.getElementById('anglais').value,
        allemand: document.getElementById('allemand').value,
        espagnol: document.getElementById('espagnol').value,
        budget: document.getElementById('budget').value,
        climat: document.getElementById('climat').value,
        objectif: document.getElementById('objectif').value,
        culture: document.getElementById('culture').value
    };
}

function evaluerUniversite(univ, profil) {
    let score = 0;
    let positifs = [];
    let limites = [];
    let exclu = false;

    // --- RÈGLES LINGUISTIQUES ---

    // R2: Si Anglais < B2, exclure USA/UK/Australie (anglophones stricts)
    if (getLangValue(profil.anglais) < getLangValue("B2")) {
        if (["USA", "Royaume-Uni", "Australie"].includes(univ.pays)) {
            exclu = true;
            limites.push("Niveau d'anglais insuffisant pour ce pays anglophone (B2 requis)");
        }
    }

    // R4: Si Allemand < B2, exclure Allemagne
    // Note: TU Braunschweig demande B1/B2. Si profil < B1, c'est sûr non.
    if (univ.pays === "Allemagne" && getLangValue(profil.allemand) < getLangValue("B1")) { // Simplification B1 min
        exclu = true;
        limites.push("Niveau d'allemand insuffisant pour l'Allemagne");
    }

    // R5: Cranfield demande C1 (LA13)
    if (univ.id === "CRANFIELD" && getLangValue(profil.anglais) < getLangValue("C1")) {
        exclu = true;
        limites.push("Cranfield exige un niveau d'anglais C1 (LA13)");
    }

    // Vérification générale des prérequis langue de l'université
    if (univ.langues.anglaisMin !== "NIL" && getLangValue(profil.anglais) < getLangValue(univ.langues.anglaisMin)) {
        // Déjà géré par R2/R5 mais au cas où
        limites.push(`Niveau d'anglais ${profil.anglais} insuffisant (requis ${univ.langues.anglaisMin})`);
        score -= 5;
    } else if (univ.langues.anglaisMin !== "NIL") {
        positifs.push("Niveau d'anglais suffisant");
        score += 2;
    }

    if (univ.langues.espagnolMin !== "NIL") {
        if (getLangValue(profil.espagnol) >= getLangValue(univ.langues.espagnolMin)) {
            positifs.push("Niveau d'espagnol suffisant");
            score += 2;
        } else {
            limites.push(`Niveau d'espagnol insuffisant (requis ${univ.langues.espagnolMin})`);
            score -= 5;
        }
    }

    if (univ.langues.allemandMin !== "NIL") {
        if (getLangValue(profil.allemand) >= getLangValue(univ.langues.allemandMin)) {
            positifs.push("Niveau d'allemand suffisant");
            score += 2;
        }
        // Exclusion déjà gérée par R4
    }

    // --- RÈGLES BRANCHE ---
    // R7, R8, R9, R10, R11
    if (univ.branchesOK.includes(profil.branche)) {
        positifs.push(`Votre branche ${profil.branche} est acceptée dans ce partenariat`);
        score += 5;
    } else {
        limites.push(`Ce partenariat ne cible pas prioritairement la branche ${profil.branche}`);
        score -= 10;
        // On n'exclut pas forcément totalement, mais gros malus
    }

    // --- RÈGLES BUDGET ---
    // R12, R13, R14
    if (profil.budget === "FAIBLE") {
        if (["USA", "Australie"].includes(univ.pays)) { // R13
            limites.push("Budget faible incompatible avec le coût de la vie (USA/Australie)");
            score -= 10;
        } else if (univ.cout === "FAIBLE" || univ.cout === "MOYEN") { // R12 (Europe du sud/Est)
            positifs.push("Budget compatible avec le coût de la vie");
            score += 3;
        } else if (univ.cout === "ELEVE") {
            limites.push("Coût de la vie élevé pour un budget faible");
            score -= 5;
        }
    } else if (profil.budget === "MOYEN") {
        if (univ.cout === "ELEVE") {
            limites.push("Attention, coût de la vie élevé pour un budget moyen");
            score -= 2;
        } else {
            positifs.push("Budget compatible");
            score += 2;
        }
    } else if (profil.budget === "ELEVE") { // R14
        positifs.push("Budget confortable pour cette destination");
        score += 2;
    }

    // --- RÈGLES OBJECTIF ---
    // R15, R16, R17, R18, R19
    if (profil.objectif === "DOUBLE-DIPLOME") {
        if (!univ.objectifsOK.includes("DOUBLE-DIPLOME")) {
            exclu = true;
            limites.push("Cette université ne propose pas de Double Diplôme");
        } else {
            positifs.push("Double Diplôme possible");
            score += 5;
        }
    } else if (profil.objectif === "STAGE") {
        // R18: Préférence anglophone
        if (["Royaume-Uni", "USA", "Canada", "Australie", "Irlande"].includes(univ.pays) || univ.langues.anglaisMin !== "NIL") {
            positifs.push("Région anglophone adaptée pour un stage international");
            score += 3;
        }
    }

    // --- RÈGLES CLIMAT & CULTURE ---
    // R20, R21, R22
    if (profil.climat === univ.climat) {
        positifs.push(`Climat ${univ.climat.toLowerCase()} correspondant à votre préférence`);
        score += 3;
    } else {
        limites.push(`Le climat ${univ.climat} diffère de votre préférence (${profil.climat})`);
        score -= 1;
    }

    if (profil.culture === "ASIATIQUE" && ["Japon", "Chine", "Corée du Sud"].includes(univ.pays)) { // R22
        positifs.push("Correspond à votre préférence culturelle Asiatique");
        score += 4;
    }
    if (profil.culture === "LATINE" && ["Espagne", "Brésil", "Argentine", "Colombie", "Mexique"].includes(univ.pays)) {
        positifs.push("Correspond à votre préférence culturelle Latine");
        score += 4;
    }
    if (profil.culture === "NORDIQUE" && ["Suède", "Finlande", "Norvège", "Danemark"].includes(univ.pays)) {
        positifs.push("Correspond à votre préférence culturelle Nordique");
        score += 4;
    }
    if (profil.culture === "EUROPEENNE" && ["Albanie", "Allemagne", "Autriche", "Espagne", "Italie", "Royaume-Uni"].includes(univ.pays)) {
        positifs.push("Correspond à votre préférence culturelle Européenne");
        score += 4;
    }

    // --- RETOUR ---
    if (exclu) score = -100; // Force low score

    return {
        univ: univ,
        score: score,
        positifs: positifs,
        limites: limites,
        exclu: exclu
    };
}

// --- MOTEUR D'AFFICHAGE ---


function renderResult(containerId, results, isForward) {
    const container = document.getElementById(containerId);
    container.innerHTML = "";

    if (results.length === 0) {
        container.innerHTML = `<div class="empty-state"><p class="text-muted">Aucun résultat trouvé correspondant à vos critères.</p></div>`;
        return;
    }

    // Header message
    const headerMsg = document.createElement('div');
    headerMsg.className = "result-header-text";
    if (isForward) {
        if (results[0].score >= 10) {
            headerMsg.textContent = "Nous avons trouvé une ou plusieurs destinations idéales pour vous !";
        } else {
            headerMsg.textContent = "Voici les meilleures options trouvées, malgré quelques incompatibilités.";
        }
    } else {
        headerMsg.textContent = `Analyse pour : ${results[0].univ.nom}`;
    }
    container.appendChild(headerMsg);

    // Items
    const limit = isForward ? Math.min(results.length, 3) : 1;

    for (let i = 0; i < limit; i++) {
        const r = results[i];

        // Determine match class
        let matchClass = "match-med";
        let badgeHtml = '<span class="badge badge-ok">Acceptable</span>';

        if (r.exclu) {
            matchClass = "match-low";
            badgeHtml = '<span class="badge badge-warn">Non Recommandé</span>';
        } else if (r.score >= 10) {
            matchClass = "match-high";
            badgeHtml = '<span class="badge badge-ideal">Idéal</span>';
        }

        const card = document.createElement('div');
        card.className = `result-card ${matchClass}`;

        // Header Card
        let htmlContent = `
            <div class="rc-header">
                <div>
                    <div class="rc-title">${r.univ.nom}</div>
                    <div class="rc-subtitle">${r.univ.pays}</div>
                </div>
                <div>${badgeHtml}</div>
            </div>
        `;

        // Positives
        if (r.positifs.length > 0) {
            htmlContent += `<div class="rc-section-title">Points Forts</div>`;
            htmlContent += `<ul class="rc-list list-pos">`;
            r.positifs.forEach(p => {
                htmlContent += `<li>${p}</li>`;
            });
            htmlContent += `</ul>`;
        }

        // Limits
        if (r.limites.length > 0) {
            htmlContent += `<div class="rc-section-title">Points d'Attention</div>`;
            htmlContent += `<ul class="rc-list list-neg">`;
            r.limites.forEach(l => {
                htmlContent += `<li>${l}</li>`;
            });
            htmlContent += `</ul>`;
        } else {
            htmlContent += `<div class="rc-section-title">Points d'Attention</div>`;
            htmlContent += `<p class="text-muted" style="font-size:0.9rem; margin-bottom:12px;">Aucune contrainte majeure identifiée.</p>`;
        }

        // Conclusion (Backward only or detailed view)
        if (!isForward || true) { // Display small conclusion for all
            let conclusion = "";
            if (r.exclu) conclusion = "Cette destination présente des critères bloquants pour votre profil.";
            else if (r.score >= 10) conclusion = "Excellent choix, foncez !";
            else conclusion = "Un choix possible, mais vérifiez bien les points d'attention.";

            htmlContent += `<div class="conclusion-text"><strong>Conclusion de l'expert :</strong> ${conclusion}</div>`;
        }

        card.innerHTML = htmlContent;
        container.appendChild(card);
    }
}

// --- FONCTIONS PRINCIPALES ---

function chainageAvant() {
    const profil = getProfil();

    // Evaluer toutes les universités
    let resultats = universites.map(u => evaluerUniversite(u, profil));

    // Trier par score décroissant
    resultats.sort((a, b) => b.score - a.score);

    // Filtrer les exclusions totales si on a d'autres choix ? 
    // Pour l'instant on garde tout mais on les met à la fin via le tri score

    renderResult("forward-result", resultats, true);
}

function chainageArriere() {
    const profil = getProfil();
    const targetId = document.getElementById('univ-target').value;
    const univ = universites.find(u => u.id === targetId);

    if (!univ) return;

    const resultat = evaluerUniversite(univ, profil);
    renderResult("backward-result", [resultat], false);
}
