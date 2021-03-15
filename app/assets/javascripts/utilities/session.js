document.addEventListener('turbolinks:load', function() {
  const caushion_green = document.querySelector('.caushion-green')
  const caushion_red = document.querySelector('.caushion-red')

  
  var compare_val = document.querySelector('.compare')
  var input_val = document.querySelector('.input')
  
  input_val.addEventListener('input', updateValue)

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
  val1 = val1.substring(0, val2.length)

  if (val2 == val1) {
    return true
  } else {
    return false
  }
}
