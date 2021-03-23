const monthTurnover = () => {
  document.getElementById('btn-monthly-turnover').addEventListener("click", (event) => {
  document.getElementById('monthly-turnover').classList.remove("d-none");
  document.getElementById('yearly-turnover').classList.add("d-none");
  document.getElementById('exercise-turnover').classList.add("d-none");
  event.currentTarget.classList.add("active");
  document.getElementById('btn-yearly-turnover').classList.remove("active");
  document.getElementById('btn-exercise-turnover').classList.remove("active");
  });
};

const yearTurnover = () => {
  document.getElementById('btn-yearly-turnover').addEventListener("click", (event) => {
  document.getElementById('yearly-turnover').classList.remove("d-none");
  document.getElementById('monthly-turnover').classList.add("d-none");
  document.getElementById('exercise-turnover').classList.add("d-none");
  event.currentTarget.classList.add("active");
  document.getElementById('btn-exercise-turnover').classList.remove("active");
  document.getElementById('btn-monthly-turnover').classList.remove("active");
  });
};

const exerciseTurnover = () => {
  document.getElementById('btn-exercise-turnover').addEventListener("click", (event) => {
  document.getElementById('yearly-turnover').classList.add("d-none");
  document.getElementById('monthly-turnover').classList.add("d-none");
  document.getElementById('exercise-turnover').classList.remove("d-none");
  event.currentTarget.classList.add("active");
  document.getElementById('btn-monthly-turnover').classList.remove("active");
  document.getElementById('btn-yearly-turnover').classList.remove("active");
  });
};

export { monthTurnover, yearTurnover, exerciseTurnover };

