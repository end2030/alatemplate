<?php
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

