<?php
if(isset($_GET['id_produk']))
{
    include('koneksi.php');
    $id_produk = $_GET['id_produk'];
    $query = mysqli_query($koneksi,"DELETE FROM produk WHERE id_produk='$id_produk'");
}
header('location:index.php');
?>