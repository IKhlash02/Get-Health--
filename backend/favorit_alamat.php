<?php
if(isset($_GET['id_alamat']))
{
    include('koneksi.php');
    $id_alamat = $_GET['id_alamat'];
    $query = mysqli_query($koneksi,"UPDATE alamat SET favorit_alamat = FALSE WHERE favorit_alamat=TRUE");
    $query = mysqli_query($koneksi,"UPDATE alamat SET favorit_alamat = TRUE WHERE id_alamat='$id_alamat'");
}
header('location:sukseslogin.php');
?>