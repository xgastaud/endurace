import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
import { French } from "flatpickr/dist/l10n/fr.js"

// flatpickr(".datepicker", {})

flatpickr("#range_start", {
  mode: "range",
  locale: French
})
