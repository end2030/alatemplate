<?php defined("BASEPATH") or exit("No direct script access allowed");
class Beranda extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		cekLogin();
	}
	public function index()
	{
		$data = array(
			"page" => "Beranda/Beranda_v",
			"menu" => "Beranda"
		);

		$data["field"] = $this->db->list_fields('beranda');

		$this->db->select("*");
		$this->db->from("beranda");
		$data["table"] = $this->db->get()->result();

		$this->load->view("index", $data);
	}
	public function simpan()
	{
		$this->db->insert("beranda",$_POST);
		$this->session->set_flashdata("simpan","Simpan data berhasil");
		redirect("beranda/beranda");
	}
}
