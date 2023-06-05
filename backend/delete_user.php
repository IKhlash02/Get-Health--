<?php
if(isset($_GET['id_user']))
{
    include('koneksi.php');
    $id_user = $_GET['id_user'];
    $query = mysqli_query($koneksi,"DELETE FROM pengguna WHERE id_user='$id_user'");
    $query = mysqli_query($koneksi,"DELETE FROM alamat WHERE id_user='$id_user'");
}
header('location:index.php');
?>