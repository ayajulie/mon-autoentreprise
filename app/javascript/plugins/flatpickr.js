import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const calendars = document.querySelectorAll(".calendar")
  calendars.forEach((calendar) => {
    flatpickr(".calendar", {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    });
  });
};

export { initFlatpickr };
