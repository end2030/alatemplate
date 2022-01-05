<?php defined("BASEPATH") OR exit("No direct script access allowed");
	class Informasi extends CI_Controller {	
		public function __construct(){
			parent::__construct();
      cekLogin();
		}
		public function index(){
			$data = array(
			"page" => "Informasi/Informasi_v",
			"menu" => "Informasi"
		);
			$this->load->view("index",$data);
		}
	}
