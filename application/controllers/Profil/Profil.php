<?php defined("BASEPATH") OR exit("No direct script access allowed");
	class Profil extends CI_Controller {	
		public function __construct(){
			parent::__construct();
      cekLogin();
		}
		public function index(){
			$data = array(
			"page" => "Profil/Profil_v",
			"menu" => "Profil"
		);
			$this->load->view("index",$data);
		}
	}
