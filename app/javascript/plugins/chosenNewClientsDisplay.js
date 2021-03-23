const monthNewClients = () => {
  document.getElementById('btn-month-new-clients').addEventListener("click", (event) => {
  document.getElementById('past-month-new-clients').classList.remove("d-none");
  document.getElementById('past-year-new-clients').classList.add("d-none");
  document.getElementById('this-exercise-new-clients').classList.add("d-none");
  event.currentTarget.classList.add("active");
  document.getElementById('btn-year-new-clients').classList.remove("active");
  document.getElementById('btn-exercise-new-clients').classList.remove("active");
  });
};

const yearNewClients = () => {
  document.getElementById('btn-year-new-clients').addEventListener("click", (event) => {
  document.getElementById('past-year-new-clients').classList.remove("d-none");
  document.getElementById('past-month-new-clients').classList.add("d-none");
  document.getElementById('this-exercise-new-clients').classList.add("d-none");
  event.currentTarget.classList.add("active");
  document.getElementById('btn-exercise-new-clients').classList.remove("active");
  document.getElementById('btn-month-new-clients').classList.remove("active");
  });
};

const exerciseNewClients = () => {
  document.getElementById('btn-exercise-new-clients').addEventListener("click", (event) => {
  document.getElementById('past-year-new-clients').classList.add("d-none");
  document.getElementById('past-month-new-clients').classList.add("d-none");
  document.getElementById('this-exercise-new-clients').classList.remove("d-none");
  event.currentTarget.classList.add("active");
  document.getElementById('btn-year-new-clients').classList.remove("active");
  document.getElementById('btn-month-new-clients').classList.remove("active");
  });
};

export { monthNewClients, yearNewClients, exerciseNewClients };
