#!/bin/bash
tables=(Beranda Profil Informasi Berita Login)
echo  'Aplikasi Name :'
read nama_aplikasi
echo  'insert username :'
read setusername
echo  'insert password :'
read setpassword
echo  'insert db_name :'
read setdb
mysql -u $setusername -p $setpassword -e "create database $setdb"
for a in "${tables[@]}" ; do 
  mkdir application/controllers/$a
  mkdir application/views/$a
  if [[ $a == "Login" ]]; then
  mysql -u $setusername -p $setpassword -e "CREATE TABLE $setdb.tb_users ( username VARCHAR(50) NOT NULL , password VARCHAR(100) NOT NULL , level VARCHAR(50) NOT NULL , status INT(1) NOT NULL , PRIMARY KEY (username)) ENGINE = InnoDB;"
  mysql -u $setusername -p $setpassword -e "INSERT INTO $setdb.tb_users (username, password, level, status) VALUES ('admin', MD5('admin'), 'administrator', '1')"
    
  echo '<?php defined("BASEPATH") OR exit("No direct script access allowed");
	class '$a' extends CI_Controller {	
		public function __construct(){
			parent::__construct();
		}
		public function index(){
			$data = array(
			"page" => "'$a'_v",
			"menu" => "'$a'"
		);
			$this->load->view("login_v",$data);
		}
   public function cek()
    {
      $username = $this->input->post("username");
      $password = $this->input->post("password");
      $cek = $this->db->get_Where("tb_users", array("username" => $username))->row();
      if (!empty($cek)) {
        if ($cek->password == md5($password)) {
          $ses = array(
            "username" => $cek->username,
            "level" => $cek->level,
            "status" => $cek->status

          );
          $this->session->set_userdata($ses);
          redirect("'${tables[0]}'/'${tables[0]}'");
        }
      } else {
        $this->session->set_flashdata("gagal", "Password / Email Salah!!!");
        redirect("login");
      }
    }
    public function logout()
    {
      $this->session->sess_destroy();
      redirect("login");
    }
	}'  > application/controllers/$a.php
  echo '
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <?php
        $data["title"] = "'$nama_aplikasi'";
        $data["menu"]  = $menu;
?>
    </title>
    <?php $this->load->view("Css"); ?>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <h2>'$nama_aplikasi'</h2>
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
  '>application/views/$a'_v.php'
  else
  mysql -u $setusername -p $setpassword -e "CREATE TABLE $setdb.$a ( id INT NOT NULL AUTO_INCREMENT , email VARCHAR(20) NOT NULL , PRIMARY KEY (id)) ENGINE = InnoDB;"
  echo '<?php defined("BASEPATH") OR exit("No direct script access allowed");
	class '$a' extends CI_Controller {	
		public function __construct(){
			parent::__construct();
      cekLogin();
		}
		public function index(){
			$data = array(
			"page" => "'$a'/'$a'_v",
			"menu" => "'$a'"
		);
			$this->load->view("index",$data);
		}
	}'  > application/controllers/$a/$a.php 
  	echo '<div class="content-wrapper">
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><?=$menu?></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active"></li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <section class="col-lg-12 connectedSortable">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="fas fa-chart-pie mr-1"></i>
                  Sales
                </h3>
                <div class="card-tools">
                  <ul class="nav nav-pills ml-auto">
                    <li class="nav-item">
                      <a class="nav-link active" href="#revenue-chart" data-toggle="tab">Area</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#sales-chart" data-toggle="tab">Donut</a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="card-body">
                <div class="tab-content p-0">
                  <div class="chart tab-pane active" id="revenue-chart"
                       style="position: relative; height: 300px;">
                        <div>AREA</div>
                   </div>
                  <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;">
                    <div>Donut</div>
                </div>
                </div>
              </div>
            </div>
          </section>
        </div>
    </section>
  </div>
	' > application/views/$a/$a'_v.php'
	echo "view $a created"
  fi
done
# # mysql --user=user_name --password=your_password -e "SELECT 1 FROM information_schema.tables"

sed -i "s/\['libraries'\] = array();/\['libraries'\] = array('database','session','form_validation','pagination','email', 'upload');/g" application/config/autoload.php
sed -i "s/\['helper'\] = array();/\['helper'\] = array('url', 'html', 'file', 'form', 'text', 'date', 'security', 'cookie','captcha','custom');/g" application/config/autoload.php
sed -i "s/\['base_url'\] = '';/\['base_url'\] =  (isset(\$_SERVER\['HTTPS'\]) \? 'https:\/\/' : 'http:\/\/').\$_SERVER\['HTTP_HOST'\].str_replace(basename(\$_SERVER\['SCRIPT_NAME'\]),'', \$_SERVER\['SCRIPT_NAME'\]);/g" application/config/config.php
sed -i "s/\['index_page'\] = 'index.php';/\['index_page'\] = '';/g" application/config/config.php
sed -i "s/\['index_page'\] = 'index.php';/\['index_page'\] = '';/g" application/config/config.php
sed -i "s/\['default_controller'\] = 'welcome';/\['default_controller'\] = 'login';/g" application/config/routes.php
sed -i "s/username' => '',/username' => '$setusername',/g" application/config/database.php
sed -i "s/password' => '',/password' => '$setpassword',/g" application/config/database.php
sed -i "s/database' => '',/database' => '$setdb',/g" application/config/database.php

echo '<?php
function cekLogin()
{
    $CI =& get_instance();
    if (empty($CI->session->userdata("username"))) {
        redirect("login");
    }
}
function custom (){
    $json = file_get_contents(base_url("custom.json"));
    $obj  = json_decode($json);
    return $obj;
}
'> application/helpers/custom_helper.php
echo 'RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php?/$1 [L]

php_value date.timezone "Asia/Jakarta"' > .htaccess

echo '
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <?php
        $data["title"] = "'$nama_aplikasi'";
        $data["menu"]  = $menu;
?>
    </title>
    <?php $this->load->view("Css"); ?>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        <?php
        $this->load->view("NavTop", $data);
        $this->load->view("LeftMenu");
        $this->load->view($page,$data);
        $this->load->view("footer");
        ?>
    </div>
    <?php $this->load->view("js"); ?>
</body>
</html>
' >application/views/index.php

echo '<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="<?=base_url()?>src/css/all.min.css">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="<?=base_url()?>src/css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet" href="<?=base_url()?>src/css/icheck-bootstrap.min.css">
<link rel="stylesheet" href="<?=base_url()?>src/css/jqvmap.min.css">
<link rel="stylesheet" href="<?=base_url()?>src/css/adminlte.min.css">
<link rel="stylesheet" href="<?=base_url()?>src/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="<?=base_url()?>src/css/daterangepicker.css">
<link rel="stylesheet" href="<?=base_url()?>src/css/summernote-bs4.min.css">
<link rel="stylesheet" href="<?=base_url()?>src/css/fontawesome.css">' >application/views/Css.php
echo '<div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="<?= base_url() ?>/src/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
</div>
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="index3.html" class="nav-link"><?php echo  $title?></a>
        </li>
    </ul>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="fa fa-power-off"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="<?= base_url() ?>/src/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="<?= base_url() ?>login/logout" class="d-block">Logout</a>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</nav>' >application/views/NavTop.php
echo '<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="index3.html" class="brand-link">
        <img src="<?= base_url() ?>/src/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light"><?="User Level"?></span>
    </a>
    <?php
    $json = file_get_contents(base_url("custom.json"));
    $obj  = json_decode($json);
    ?>
    <div class="sidebar">
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-header">Dashboard</li>
                <?php
                foreach ($obj->menu as $key => $value) {
                ?>
                    <li class="nav-item">
                        <a href="<?= base_url($value."/".$value) ?>" class="nav-link">
                            <i class="nav-icon fa fa-bullseye"></i>
                            <p><?= $value ?></p>
                        </a>
                    </li>
                <?php
                }
                foreach ($obj->menusub as $key => $value) {
                ?>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-plus-square"></i>
                            <p><?= $value->menu ?><i class="fas fa-angle-left right"></i></p>
                        </a>
                        <ul class="nav nav-treeview">
                            <?php
                            foreach ($value->sub as $key => $subs) {
                            ?>
                                <li class="nav-item"><a href="pages/examples/login.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p><?= $subs ?></p>
                                    </a>
                                </li>
                            <?php
                            }
                            ?>
                        </ul>
                    </li>
                <?php
                }
                ?>
            </ul>
        </nav>
    </div>
</aside>' >application/views/LeftMenu.php
echo '<footer class="main-footer">
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">Admin</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.1.0
    </div>
  </footer>
  <aside class="control-sidebar control-sidebar-dark">
  </aside>' >application/views/footer.php
echo '<script src="<?=base_url()?>src/js/jquery.min.js"></script>
<script src="<?=base_url()?>src/js/jquery-ui.min.js"></script>
<script>
  $.widget.bridge("uibutton", $.ui.button)
</script>
<script src="<?=base_url()?>src/js/bootstrap.bundle.min.js"></script>
<script src="<?=base_url()?>src/js/Chart.min.js"></script>
<script src="<?=base_url()?>src/js/sparkline.js"></script>
<script src="<?=base_url()?>src/js/jquery.vmap.min.js"></script>
<script src="<?=base_url()?>src/js/jquery.vmap.usa.js"></script>
<script src="<?=base_url()?>src/js/jquery.knob.min.js"></script>
<script src="<?=base_url()?>src/js/moment.min.js"></script>
<script src="<?=base_url()?>src/js/daterangepicker.js"></script>
<script src="<?=base_url()?>src/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="<?=base_url()?>src/js/summernote-bs4.min.js"></script>
<script src="<?=base_url()?>src/js/jquery.overlayScrollbars.min.js"></script>
<script src="<?=base_url()?>src/js/adminlte.js"></script>
<script src="<?=base_url()?>src/js/dashboard.js"></script>' >application/views/js.php