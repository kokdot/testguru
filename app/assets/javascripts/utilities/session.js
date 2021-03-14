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
    if (compareVal(compare_val, input_val)) {
      caushion_green.classList.remove('hide')
      caushion_red.classList.add('hide')
    } else {
      caushion_green.classList.add('hide')
      caushion_red.classList.remove('hide')
    }
  }

})

function compareVal(val1, val2) {
  arr1 = val1.value.split("")
  arr2 = val2.value.split("")
  for (i = 0; i < arr2.length; i++) {
    if (arr1[i] === arr2[i]) { 
      continue
    } else { return false }
  }
  if (arr2.length > arr1.length) {
    return false
  } else {
    return true
  }

}
