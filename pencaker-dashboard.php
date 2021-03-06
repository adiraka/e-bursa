<?php

	session_start();

	require 'cores/misc/connect.php';
	require 'cores/misc/function.php'; 

	$dataProfil = getPencakerProfil($_SESSION['user_id']);

	if (!isset($_SESSION['username']) || $_SESSION['hak_akses'] != 'pencaker') {
		session_unset();
		$_SESSION['gagal'] = 'Maaf anda tidak memiliki izin untuk mengakses halaman ini';
		header('Location:main.php?page=home');
		die();
	}

?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Pencari Kerja</title>
	<link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendors/datatables/datatables.min.css">
	<link rel="stylesheet" href="assets/vendors/air-datepicker/dist/css/datepicker.min.css">
	<link rel="stylesheet" href="assets/css/app.css">
	<script src="assets/vendors/jquery/js/jquery.min.js"></script>
</head>
<body>
	<?php include "views/partials/pencaker-navbar.php"; ?>

	<div class="container main-content">
		
		<div><br></div>

		<?php include "views/partials/notification.php" ?>
		
		<?php  

			if (ISSET($_GET['page'])) {
				$page = $_GET['page'];
				
				if ($page == 'home') {
					include "views/pencaker/home.php";
				} elseif ($page == 'profil') {
					include "views/pencaker/profil.php";
				} elseif ($page == 'lamaran') {
					include "views/pencaker/lamaran.php";
				} elseif ($page == 'hapus-pendidikan-formal') {
					include "views/pencaker/profil/hapus-pendidikan-formal.php";
				} elseif ($page == 'hapus-pendidikan-nonformal') {
					include "views/pencaker/profil/hapus-pendidikan-nonformal.php";
				} elseif ($page == 'hapus-pengalaman-kerja') {
					include "views/pencaker/profil/hapus-pengalaman-kerja.php";
				}

			}
				
		?>
		
	</div>

	<footer class="footer">
		<div class="container">
			<?php echo date('Y') ?> @ <a href="https://stmikindonesia.ac.id" target="_blank">STMIK INDONESIA PADANG</a>
		</div>
	</footer>

	
	<script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendors/datatables/datatables.min.js"></script>
	<script src="assets/vendors/air-datepicker/dist/js/datepicker.min.js"></script>
	<script src="assets/vendors/air-datepicker/dist/js/i18n/datepicker.en.js"></script>
	<script src="assets/vendors/tinymce/jquery.tinymce.min.js"></script>
	<script src="assets/vendors/tinymce/tinymce.min.js"></script>
	<script src="assets/js/app.js"></script>
</body>
</html>