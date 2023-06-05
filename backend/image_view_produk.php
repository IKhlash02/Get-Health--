<?php
include('koneksi.php');
if(isset($_GET['id_produk'])) 
{
    $query = mysqli_query($koneksi,"SELECT * FROM produk WHERE id_produk='".$_GET['id_produk']."'");
    $row = mysqli_fetch_array($query);
    echo $row["foto_produk"];
}
else
{
    header('location:index.php');
}
?>