import 'jquery'
import 'selectric'

import 'selectric/src/selectric.scss'

function niceDropdown() {
  $(function() {
    $('.select_value').selectric();
  });
}

export { niceDropdown }
// var $selectValue = $('.select_value').find('strong');

// // Get initial value
// $selectValue.text($('#get_value').val());

// // Initialize Selectric and bind to 'change' event
// $('#get_value').selectric().on('change', function() {
//   $selectValue.text($(this).val());
// });
