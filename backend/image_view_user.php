<?php
include('koneksi.php');
if(isset($_GET['id_user'])) 
{
    $query = mysqli_query($koneksi,"select * from pengguna where id_user='".$_GET['id_user']."'");
    $row = mysqli_fetch_array($query);
    //header("Content-type: " . $row["tipe_gambar"]);
    echo $row["foto_user"];
}
else
{
    header('location:index.php');
}
?>