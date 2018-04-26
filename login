<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);

 session_start();

//is set 
 if(isset($_POST["username"]) && isset($_POST["password"]))
    {
        $useremail = $_POST["username"];
        $password = $_POST["password"];
		$company=$_POST["companies"];
	}
//cs
$link = mysqli_connect('iberia.coumfe5q4pny.us-west-2.rds.amazonaws.com', 'iberiadashboard', 'franlikespwd2017');
mysqli_select_db($link,'iberiadashboard');
//query
$sql= "SELECT name,pass FROM users WHERE name like '".$useremail."' and company like '".$company."';";
$result = mysqli_query($link,$sql);
//attempts

    while ($fila = mysqli_fetch_assoc($result)) {
		//dcryption + enter
		if(crypt($password, $row->pass) == $row->pass and $useremail == $row->name){
		$_SESSION['name']=$row->name;
    	echo 'OK,/dashboard.php';
		}else{
		session_destroy();
		echo "Error";
	}
	}
?>
