<?php
// Menghubungkan ke database (misalnya menggunakan koneksi $koneksi)
include('koneksi.php');
$produk = array();

$id_produk = $_GET['id_produk'];
// Set header untuk mengirimkan output dalam format JSON
header('Content-Type: application/json');
$queryulasan = mysqli_query($koneksi, "SELECT * FROM ulasan WHERE id_produk=$id_produk ORDER BY timestamp_ulasan DESC");
while ($row = mysqli_fetch_array($queryulasan)) {
    $id_pengulas = $row['id_user'];
    $queryuser = mysqli_query($koneksi, "SELECT nama_user FROM pengguna WHERE id_user=$id_pengulas");
    $fetchnamauser = mysqli_fetch_array($queryuser);



    $produk[] = array(
        'nama_user' => $fetchnamauser['nama_user'],
        'gambar' => 'image_view_user.php?id_user=' . $row['id_user'],
        'timestamp_ulasan' => $row['timestamp_ulasan'],
        'rating' => $row['rating'],
        'review' => $row['review'],


    );



}
echo json_encode($produk);
?>