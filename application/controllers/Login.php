<?php defined("BASEPATH") OR exit("No direct script access allowed");
	class Login extends CI_Controller {	
		public function __construct(){
			parent::__construct();
		}
		public function index(){
			$data = array(
			"page" => "Login_v",
			"menu" => "Login"
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
          redirect("Beranda/beranda");
        }
      } else {
        $this->session->set_flashdata("gagal", "password / email salah");
        redirect("login");
      }
    }
    public function logout()
    {
      $this->session->sess_destroy();
      redirect("login");
    }
	}
