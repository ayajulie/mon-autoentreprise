import flatpickr from "flatpickr";
// import "flatpickr/dist/flatpickr.min.css"

import { French } from "flatpickr/dist/l10n/fr.js"



const initFlatpickr = () => {
  const calendars = document.querySelectorAll(".calendar")
  calendars.forEach((calendar) => {
    flatpickr(".calendar", {
      altInput: true,
      altFormat: "j F Y",
      dateFormat: "Y-m-d",
      "locale": French
    });
  });
};

export { initFlatpickr };
