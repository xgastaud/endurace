import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

// flatpickr(".datepicker", {})

flatpickr("#range_start", {
  mode: "range"
})
