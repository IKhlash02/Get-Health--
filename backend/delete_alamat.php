<?php
if(isset($_GET['id_alamat']))
{
    include('koneksi.php');
    $id_alamat = $_GET['id_alamat'];
    $query = mysqli_query($koneksi,"DELETE FROM alamat WHERE id_alamat='$id_alamat'");
}
header('location:sukseslogin.php');
?>