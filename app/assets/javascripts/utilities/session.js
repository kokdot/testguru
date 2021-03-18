document.addEventListener('turbolinks:load', function() {
  var caushion_green = document.querySelector('.caushion-green')
  var caushion_red = document.querySelector('.caushion-red')

  
  var compare_val = document.querySelector('.compare')
  var input_val = document.querySelector('.input')
  
  if (input_val) {
    input_val.addEventListener('input', updateValue)
  }

  function updateValue(e) {
    if (input_val.value === '') {
      caushion_green.classList.add('hide')
      caushion_red.classList.add('hide')
      return
    }
    if (compareVal(compare_val.value, input_val.value)) {
      caushion_green.classList.remove('hide')
      caushion_red.classList.add('hide')
    } else {
      caushion_green.classList.add('hide')
      caushion_red.classList.remove('hide')
    }
  }

})

function compareVal(val1, val2) {
  if (val2 == val1) {
    return true
  } else {
    return false
  }
}
