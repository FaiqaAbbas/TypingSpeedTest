<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Bootstrap demo</title>
      <link href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
      <link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/icons/bootstrap-icons.css">
      <script src="<?php echo base_url();?>assets/bootstrap/js/jquery.min.js" ></script>
      <script src="<?php echo base_url();?>assets/bootstrap/popper/popper.min.js" ></script>
      <script src="<?php echo base_url();?>assets/bootstrap/js/bootstrap.min.js" ></script>

      <script src="<?php echo base_url();?>assets/bootstrap/js/chart.min.js" ></script>

      <style>
        body{
             background-color:rgba(51, 53, 56);  
        }
        .btn-sm{
            /* background-color:rgba(33, 37, 41); */
            color:white;
             border:none;

        }
      
    
      </style>    
</head>
  <body>
        <?php  
                $this->load->view('navbar');
        ?>
        <div class="container-fluid mt-5">
            
            <div class="row">
                  <div class="col-1" style="margin-left:20px; margin-right:40px;">
                    <div class="text-secondary" style="font-size: 25px;">wpm</div>
                    <div class="text-warning display-4" id="wpm" style="font-weight: 400"></div>  
                    <div class="text-secondary" style="font-size: 25px;">acc</div>
                    <div class="text-warning display-4" style="font-weight: 400"><?php echo $data->accuracy;?>%</div>
                  </div>
                  <div class="col-9">
                      <canvas id="chartId" aria-label="chart" style="height:300px; width:95vw;"></canvas>  
                  </div>
            </div>
            <div class="row justify-content-center"> 
                <div class="col-12 col-12 d-flex justify-content-center text-warning" >
                    <button id="reloadButton" class="btn fs-5  btn-sm" data-bs-toggle="tooltip" title="ReTake test"> <i class="bi bi-arrow-clockwise"></i></button>
                </div>
            </div>
        </div>     
   <script>
        $(document).ready(function(){
            $('[data-bs-toggle="tooltip"]').tooltip(); 
            $('#reloadButton').click(function() {
                window.location.href=href="<?= base_url('Test')?>";
            });
        });
      var wpm=document.getElementById('wpm');
      var timeTaken=<?php echo $data->timeTaken;?>;
      var arr = Array.from({ length:timeTaken  }, (_, index) => index);
      var wpmArray = <?php echo ($data->wpm); ?>;
      wpm.innerHTML = wpmArray[wpmArray.length-1];
      const ctx = document.getElementById('chartId').getContext("2d");

      var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: arr,
                datasets: [{
                    label: 'wpm',
                    data: <?php echo $data->wpm?>,
                    fill: false,
                    borderColor: 'rgb(255, 193, 7)',
                    pointBackgroundColor: 'rgb(255, 193, 7)',
                    borderWidth:1,
                    tension: 0.1
                }]
            },
      
            options: {
                plugins: {
                    legend: {
                        display: false,
                    }
                },
                scales: {
                    x: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Time in seconds'
                        }
                    },
                    y: {
                        display: true,
                        title: {
                            display: true,
                            text: 'words per minute'
                        }
                    }
                }
        
            }
        });
   </script>
</body>
</html>
</body>
</html>