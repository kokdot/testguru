document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInLineLinkHandler)

  var errors = document.querySelector('.resource-errors')
  
  if (errors) {
    var resourceId = errors.dataset.resourceId
    formInLineHandler(resourceId)
  }
})

function formInLineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInLineHandler(testId)
}

function formInLineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  
  $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  $formInLine = $('.form-inline[data-test-id="' + testId + '"]')

  $formInLine.toggle()
  $testTitle.toggle()

  if($formInLine.is(':visible')) {
    link.textContent = 'Cancel'
  } else{
    link.textContent = 'Edit'
  }
}
