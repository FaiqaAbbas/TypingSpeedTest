<div class="container-fluid">
    <div class="row justify-content-evenly">
    
        <div class="col-auto" >
          <h1 id="timer-container" class="text-warning display-1">00</h1>
        </div>
             
        <div class="col-auto">
                  <ul class="list-group list-group-horizontal list-group-sm ">
                    <a class="list-group-item" href="#">SetTimer:</a>  
                    <a class="list-group-item" href="#">15</a>
                    <a class="list-group-item" href="#">30</a>
                    <a class="list-group-item" href="#">60</a>
                    <a class="list-group-item" href="#">120</a>
                    <a class="list-group-item" href="#"><i class=" bi bi-gear-fill text-warning"></i></li>
                  </ul>
        </div>
    </div>
</div>
    <script>
      

      var timeText;
      // Get the timer container element
      var timerContainer = document.getElementById("timer-container");

      // Set the initial time to 0
      var seconds = 0;

    // Set a variable to store the timer interval ID
      var timerIntervalId;
      async function startTimer() {
        // Clear any previous timer interval
        clearInterval(timerIntervalId);

        // Start the timer interval
        timerIntervalId = setInterval(function() {
          // Increment the number of seconds
          seconds++;

          // Calculate the minutes and seconds components
          var minutes = Math.floor(seconds / 60);
          var remainingSeconds = seconds % 60;

          // Format the time as MM:SS
          var timeText = minutes.toString().padStart(2, '0') + ":" + remainingSeconds.toString().padStart(2, '0');

          // Update the timer display
          timerContainer.innerHTML = timeText;
        }, 1000);
      }

      // Function to pause the timer
      function pauseTimer() {
        // Clear the timer interval
        clearInterval(timerIntervalId);
      }
      function returnTime() {
        // Clear the timer interval
        return timeTexr;
      }

    </script>
