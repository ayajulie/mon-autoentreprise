import Chart from 'chart.js';

const ctx = document.getElementById('myChart');

const myChart = new Chart(ctx,
  {
        type: "bar",
    data: {
        labels: [ 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novemebre', 'Décembre','Janvier', 'Février', 'Mars'],
        datasets: [{
            label: "Chiffre d'affaire mensuel",
            data: [3500, 4500, 2300, 5500, 3400, 7900, 1200, 1900, 3000, 5000, 1250, 6700],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
  }
  );



const myPieChart = new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["Cotisations sociales", "Taxes consulaires", "Impôt sur le revenu", "Chiffres d'affaire"],
      datasets: [{
        label: "Chiffres d'affaire de",
        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
        data: [1500,5267,7340, 45000]
      }]
    },
    options: {
      title: {
        display: true,
        text: "Visualisationd de votre chiffre d'affaire et de vos côtisations"
      }
    }
});


export { myChart };
export { myPieChart };

