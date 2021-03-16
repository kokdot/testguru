// document.addEventListener('turbolinks:load', function() {
//   var control = document.querySelectorAll('.form-inline-link')
//   if (control.length) {
//     for (var i = 0; i < control.length; i++) {
//       control[i].addEventListener('click', formInLineLinkHandler)
//     }
//   }

//   var errors = document.querySelector('.resource-errors')
  
//   if (errors) {
//     var resourceId = errors.dataset.resourceId
//     formInLineHandler(resourceId)
//   }
// })

// function formInLineLinkHandler(event) {
//   event.preventDefault()

//   var testId = this.dataset.testId
//   formInLineHandler(testId)
// }

// function formInLineHandler(testId) {
//   var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
//   var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
//   var formInLine = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

//   if (formInLine.classList.contains('hide')) {  
//     testTitle.classList.add('hide')
//     formInLine.classList.remove('hide')
//     link.textContent = 'Cancel'
//   } else{
//     testTitle.classList.remove('hide')
//     formInLine.classList.add('hide')
//     link.textContent = 'Edit'

//   }
//  }
