const currentYearTurnover = () => {
  document.getElementById('btn-year-2021-doughnut').addEventListener("click", (event) => {
  document.getElementById('doughnut-chart-2021').classList.remove("d-none");
  document.getElementById('doughnut-chart-2020"').classList.add("d-none");
  event.currentTarget.classList.add("active");
  document.getElementById('btn-year-2020-doughnut').classList.remove("active");
  });
};

const pastYearTurnover = () => {
  document.getElementById('btn-year-2020-doughnut').addEventListener("click", (event) => {
  document.getElementById('doughnut-chart-2020').classList.remove("d-none");
  document.getElementById('doughnut-chart-2021"').classList.add("d-none");
  event.currentTarget.classList.add("active");
  document.getElementById('btn-year-2021-doughnut').classList.remove("active");
  });
};

export { currentYearTurnover, pastYearTurnover };
