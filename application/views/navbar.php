
	


<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-dark ms-3 me-3 ">
      <div class="container-fluid ">
      <a class="navbar-brand " href="<?= base_url('Test')?>"><h1><i class="bi bi-keyboard-fill text-warning"></i></h1></a>
      <a class="navbar-brand " href="<?= base_url('Test')?>"><h2 class="h1">typingmaster</h2></a>
      <button class="navbar-toggler bg-dark collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbarSupportedContent" style="">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link " href="<?= base_url('Test/loadPracticeView')?>"><h5>Practice</h5></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<?= base_url('Test')?>"><h5>Test</h5></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<?= base_url('Competition')?>"><h5>Competition</h5></a>
            </li>
           </ul>
           <button class="btn text-warning">
            <?php if($this->session->userdata('user')){ ?>
              <h4 class="fs-3"><?= $this->session->userdata('user')['name'] ?></h4>
              <?php } else { ?>
            <a class="text-warning fs-4" href="<?= base_url('login') ?>" style="text-decoration: none;">Login   </a>
             <i class="bi bi-person-check-fill  fs-3"></i>
             <?php  }?> 
           </button> 
           <?php if($this->session->userdata('user')) { ?>
             <a href="<?= base_url('logout') ?>"><i class="bi bi-box-arrow-right fs-2 text-warning btn-sm"></i></a>
             <?php } ?>
        </div>
      </div>
</nav>

