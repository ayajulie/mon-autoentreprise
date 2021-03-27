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
        ctx.fillText(text, textX, textY + 15);
        ctx.save();
    }
});

// console.log(document.getElementById("myChart2").dataset.monthlyTurnoverPreviousYear);
// console.log(document.getElementById("doughnut-chart").dataset.currentYear);

const myChart2 = () => {
  new Chart(document.getElementById("myChart2"), {
      type: 'bar',
      data: {
        labels: [ 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre','Janvier', 'Février', 'Mars'],
        datasets: [
          {
            label: "Année précédente",
            backgroundColor: "#0061f2",
            data: JSON.parse(document.getElementById("myChart2").dataset.monthlyTurnoverPreviousYear)
          }, {
            label: "Année courante",
            backgroundColor: "#edae2f",
            data: JSON.parse(document.getElementById("myChart2").dataset.monthlyTurnoverPastYear)
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

const myDoughnutChart = () => {
  new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
      labels: ["CA net", "Taxes", "CA max"],
      datasets: [{
        label: "Chiffres d'affaire de",
        backgroundColor: ["#edae2f", "#6c757d","#edeef7"],
        data: JSON.parse(document.getElementById("doughnut-chart").dataset.currentYear)
      }]
    },
    options: {
      elements: {
            center: {
            text: JSON.parse(document.getElementById("doughnut-chart").dataset.variationRate),
            sidePadding: 60
            }
        },
      title: {
        display: false,
        text: "Activité réalisée cette année / max"
      },
      cutoutPercentage: 60,
      legend: {
        display: true
    }
    }
});
}

/*

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
*/

//export { myChart };
export { myChart2 };
//export { myPieChart };
export { myDoughnutChart };
// if window.location.pathname ='/dfv/vf'
