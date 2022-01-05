<?php defined("BASEPATH") OR exit("No direct script access allowed");
	class Berita extends CI_Controller {	
		public function __construct(){
			parent::__construct();
      cekLogin();
		}
		public function index(){
			$data = array(
			"page" => "Berita/Berita_v",
			"menu" => "Berita"
		);
			$this->load->view("index",$data);
		}
	}
