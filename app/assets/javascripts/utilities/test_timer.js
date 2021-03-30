document.addEventListener('turbolinks:load', function() {
  const time = $('.seconds')
  console.log("test_timer", time.text())
  timerDecrement()
  
  
  function timerDecrement() {
    console.log("test_timer_click_start")
    setTimeout(function() {
      const newTime = time.text() - 1
      
      time.text(newTime)
      
      if(newTime > 0) timerDecrement()
    }, 1000)
  }
})
