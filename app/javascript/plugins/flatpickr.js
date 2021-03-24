import flatpickr from "flatpickr";
// import "flatpickr/dist/flatpickr.min.css"

import { French } from "flatpickr/dist/l10n/fr.js"



const initFlatpickr = () => {
  const calendars = document.querySelectorAll(".calendar")
  calendars.forEach((calendar) => {
    flatpickr(".calendar", {
      altInput: true,
      altFormat: "j F Y",
      dateFormat: "dmY",
      "locale": French,
      minDate: "today",
      maxDate: new Date().fp_incr(365)
    });
  });
};

const birthFlatpickr = () => {
  const calendars = document.querySelectorAll(".birth-calendar")
  calendars.forEach((calendar) => {
    flatpickr(".birth-calendar", {
      altInput: true,
      altFormat: "j F Y",
      dateFormat: "dmY",
      "locale": French,
      //defaultDate: "01011990",
      maxDate: "01012005"
    });
  });
};

export { initFlatpickr };
export { birthFlatpickr };
