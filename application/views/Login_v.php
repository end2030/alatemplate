
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <?php
        $data["title"] = "INentori";
        $data["menu"]  = $menu;
?>
    </title>
    <?php $this->load->view("Css"); ?>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <h2>INentori</h2>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Silahkan Login</p>
      <div class="text-danger text-center"><?=$this->session->flashdata("gagal");?></div>
      <form action="<?=base_url()?>login/cek" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="username" placeholder="Email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="password" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="hidden" id="remember">
              <label for="remember">
              </label>
            </div>
          </div>
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
          </div>
        </div>
      </form>
      <p class="mb-1">
        <a href="forgot-password.html"></a>
      </p>
      <p class="mb-0">
        <a href="register.html" class="text-center"></a>
      </p>
    </div>
  </div>
</div>
</html>
  
