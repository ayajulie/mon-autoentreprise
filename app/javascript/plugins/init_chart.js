import Chart from 'chart.js';

Chart.pluginService.register({
    beforeDraw: function (chart) {
        const width = chart.chart.width,
            height = chart.chart.height,
            ctx = chart.chart.ctx;
        ctx.restore();
        const fontSize = (height / 114).toFixed(2);
        ctx.font = fontSize + "em sans-serif";
        ctx.textBaseline = "middle";
        const text = chart.config.options.elements.center.text,
            textX = Math.round((width - ctx.measureText(text).width) / 2),
            textY = height / 2;
        ctx.fillText(text, textX, textY + 10);
        ctx.save();
    }
});


const myChart = () => {
  new Chart(document.getElementById("myChart"), {
  type: 'bar',
  data: {
    labels: ['Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novemebre', 'Décembre','Janvier', 'Février', 'Mars'],
    datasets: [{
        label: 'Taxes',
        data: [700, 800, 400, 900, 740, 1200, 400, 200, 600, 1000, 350, 1200],
        backgroundColor: [
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
        ],
        borderColor: [
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
          '#3c415c',
        ],
        borderWidth: 2
      },
      {
        label: 'Restant hors taxe',
        data: [3500, 4500, 2300, 5500, 3400, 7900, 1200, 1900, 3000, 5000, 1250, 6700],
        backgroundColor: [
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2'
        ],
        borderColor: [
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2',
          '#8e5ea2'
        ],
        borderWidth: 2
      }
    ]
  },
  options: {
    scales: {
      yAxes: [{
        stacked: true,
        ticks: {
          beginAtZero: true
        }
      }],
      xAxes: [{
        stacked: true,
        ticks: {
          beginAtZero: true
        }
      }]

    },
    title: {
          display: true,
          text: "Chiffre d'affaires mensuelles et taxes dues"
        },
    elements: {
        center: {
        text: '',
        sidePadding: 60
        }
    }
  }
});
}

const myChart2 = () => {
  new Chart(document.getElementById("myChart2"), {
      type: 'bar',
      data: {
        labels: [ 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novemebre', 'Décembre','Janvier', 'Février', 'Mars'],
        datasets: [
          {
            label: "Année précédente",
            backgroundColor: "#3e95cd",
            data: [3500, 4500, 2300, 5500, 3400, 7900, 1200, 1900, 3000, 5000, 1250, 6700]
          }, {
            label: "Année courante",
            backgroundColor: "#8e5ea2",
            data: [4500, 3500, 3300, 4500, 5400, 3900, 4200, 2900, 2000, 5500, 3500, 5700]
          }
        ]
      },
      options: {
        elements: {
            center: {
            text: '',
            sidePadding: 60
            }
        },
        title: {
          display: false,
          text: "Chiffre d'affaires en euros"
        }
      }
  });
}

/*const myChart = () => {
  new Chart(document.getElementById('myChart'),
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
            xAxes: [{
                stacked: true
            }],
             yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
    }
  }
  );
}
*/

const myPieChart = () => {
  new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["Cotisations sociales", "Taxes consulaires", "Impôt sur le revenu", "Chiffres d'affaire"],
      datasets: [{
        label: "Chiffres d'affaire de",
        backgroundColor: ["#3e95cd","#e8c3b9","#3cba9f", "#8e5ea2"],
        data: [1500,5267,7340, 45000]
      }]
    },
    options: {
      elements: {
            center: {
            text: '',
            sidePadding: 60
            }
        },
      title: {
        display: false,
        text: "Visualisation de votre chiffre d'affaire et de vos côtisations"
      },
      legend: {
        display: false
    }
    }
});
}

const myDoughnutChart = () => {
  new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
      labels: ["CA net", "Taxes", ""],
      datasets: [{
        label: "Chiffres d'affaire de",
        backgroundColor: ["#8e5ea2", "#3c415c","#edeef7"],
        data: [32000, 6000, 34000]
      }]
    },
    options: {
      elements: {
            center: {
            text: '56%',
            sidePadding: 60
            }
        },
      title: {
        display: false,
        text: "Activité réalisée cette année / max"
      },
      cutoutPercentage: 60,
      legend: {
        display: false
    }
    }
});
}


export { myChart };
export { myChart2 };
export { myPieChart };
export { myDoughnutChart };
// if window.location.pathname ='/dfv/vf'
