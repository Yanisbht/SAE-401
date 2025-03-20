const ctx = document.getElementById('resultChart').getContext('2d');

        new Chart(ctx, {
            type: 'line',
            data: {
                labels: Array.from({ length: 30 }, (_, i) => i + 1), // Jours de 1 à 30
                datasets: [{
                    label: 'Résultats des Tests (/20)',
                    data: [null, null, 1, null, null, null, 8, null, null, null, null, null, null, null, null, null, null, 14, 11, null, null, null, null, null, null, null, null, 18, null, null],
                    borderColor: '#1FBFB8', /* Couleur turquoise */
                    backgroundColor: 'rgba(31, 191, 184, 0.2)', /* Couleur transparente sous la ligne */
                    borderWidth: 2,
                    pointRadius: 5,
                    pointBackgroundColor: '#000', /* Points en noir */
                    tension: 0.3 /* Rend la courbe fluide */
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        title: { display: true, text: 'Jours de Mars' }
                    },
                    y: {
                        min: 0,
                        max: 20,
                        title: { display: true, text: 'Score /20' },
                        ticks: { stepSize: 2 }
                    }
                }
            }
        });


        document.addEventListener("DOMContentLoaded", function () {
            var popup = document.getElementById("popup");
            var openPopup = document.getElementById("openPopup");
            var closePopup = document.getElementById("closePopup");
        
            // Ouvrir le pop-up
            openPopup.addEventListener("click", function (event) {
                event.preventDefault(); // Empêche la redirection
                popup.style.display = "flex"; // Afficher le pop-up
            });
        
            // Fermer le pop-up en cliquant sur la croix
            closePopup.addEventListener("click", function () {
                popup.style.display = "none"; // Cacher le pop-up
            });
        
            // Fermer le pop-up en cliquant en dehors du contenu
            window.addEventListener("click", function (event) {
                if (event.target === popup) { 
                    popup.style.display = "none"; // Cacher le pop-up
                }
            });
        });

        
// Données de test simulées
const resultats7Jours = [15, 18, 16]; // 3 résultats pour les 7 derniers jours
const resultats30Jours = [18, 16, 17, 19, 20, 18, 16, 15, 14, 17, 19]; // 11 résultats pour les 30 derniers jours
const resultatsTotaux = [20, 18, 16, 17, 18, 15, 14, 19, 20, 18, 17, 16, 19, 18, 17, 16, 15, 18, 19, 17, 18, 16, 15, 19, 20, 18, 19, 16, 17, 20]; // 30 résultats totaux

// Fonction pour créer un graphique
function createChart(ctx, labels, data) {
    return new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Résultats sur 20',
                data: data,
                fill: false,
                borderColor: 'rgba(75, 192, 192, 1)',
                tension: 0.1
            }]
        },
        options: {
            responsive: true,
            scales: {
                x: {
                    title: {
                        display: true,
                        text: 'Tests'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: 'Résultats'
                    },
                    min: 0,
                    max: 20
                }
            }
        }
    });
}

// Labels pour chaque graphique
const labels7Jours = ['Test 1', 'Test 2', 'Test 3']; // 3 résultats
const labels30Jours = [
    'Test 1', 'Test 2', 'Test 3', 'Test 4', 'Test 5', 'Test 6', 'Test 7', 'Test 8', 'Test 9', 'Test 10', 'Test 11'
]; // 11 résultats
const labelsTotaux = Array.from({ length: 30 }, (_, i) => `Test ${i + 1}`); // 30 résultats

// Création des graphiques
const ctx7Days = document.getElementById('chart7Days').getContext('2d');
const ctx30Days = document.getElementById('chart30Days').getContext('2d');
const ctxTotal = document.getElementById('chartTotal').getContext('2d');

// Création des graphiques
const chart7DaysObj = createChart(ctx7Days, labels7Jours, resultats7Jours);
const chart30DaysObj = createChart(ctx30Days, labels30Jours, resultats30Jours);
const chartTotalObj = createChart(ctxTotal, labelsTotaux, resultatsTotaux);

// Fonction pour afficher le graphique en fonction du bouton cliqué
function showChart(type) {
    // Masquer tous les graphiques
    document.getElementById('chart7Days').style.display = 'none';
    document.getElementById('chart30Days').style.display = 'none';
    document.getElementById('chartTotal').style.display = 'none';

    // Afficher le graphique sélectionné
    if (type === 'week') {
        document.getElementById('chart7Days').style.display = 'block';
    } else if (type === 'month') {
        document.getElementById('chart30Days').style.display = 'block';
    } else if (type === 'total') {
        document.getElementById('chartTotal').style.display = 'block';
    }
}
