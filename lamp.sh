#!/bin/bash
tables=(Beranda Profil Informasi Berita Login)

echo  'insert username :'
read setusername
echo  'insert password :'
read setpassword
echo  'insert db_name :'
read setdb
mysql -u $setusername -p $setpassword -e "create database $setdb"
for a in "${tables[@]}" ; do 
	mysql -u $setusername -p $setpassword -e "CREATE TABLE db_tes.$a ( id INT NOT NULL AUTO_INCREMENT , email VARCHAR(20) NOT NULL , PRIMARY KEY (id)) ENGINE = InnoDB;"
	echo "Table $a created" 
	echo '<?php defined("BASEPATH") OR exit("No direct script access allowed");
	class '$a' extends CI_Controller {	
		public function __construct(){
			parent::__construct();
		}
		public function index(){
			$this->load->view("'$a'_v");
		}
	}'  > application/controllers/$a.php
	echo '<?php echo "ini '$a'";' > application/views/$a'_v.php'
	echo "view $a created"
done
# # mysql --user=user_name --password=your_password -e "SELECT 1 FROM information_schema.tables"

sed -i "s/\['libraries'\] = array();/\['libraries'\] = array('database','session','form_validation','pagination','email', 'upload');/g" application/config/autoload.php
sed -i "s/\['helper'\] = array();/\['helper'\] = array('url', 'html', 'file', 'form', 'text', 'date', 'security', 'cookie','captcha');/g" application/config/autoload.php
sed -i "s/\['base_url'\] = '';/\['base_url'\] =  (isset(\$_SERVER\['HTTPS'\]) \? 'https:\/\/' : 'http:\/\/').\$_SERVER\['HTTP_HOST'\].str_replace(basename(\$_SERVER\['SCRIPT_NAME'\]),'', \$_SERVER\['SCRIPT_NAME'\]);/g" application/config/config.php
sed -i "s/\['index_page'\] = 'index.php';/\['index_page'\] = '';/g" application/config/config.php
sed -i "s/\['index_page'\] = 'index.php';/\['index_page'\] = '';/g" application/config/config.php
sed -i "s/username' => '',/username' => '$setusername',/g" application/config/database.php
sed -i "s/password' => '',/password' => '$setpassword',/g" application/config/database.php
sed -i "s/database' => '',/database' => '$setdb',/g" application/config/database.php

echo 'RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php?/$1 [L]

php_value date.timezone "Asia/Jakarta"' > .htaccess

echo '<?php defined("BASEPATH") OR exit("No direct script access allowed");
class Home extends CI_Controller {	
	public function __construct(){
		parent::__construct();
	}
	public function index(){
		$this->load->view("home_v");
	}
}' > application/controllers/Home.php
echo '
<?php echo "ini Home";
' >application/views/Home_v.php