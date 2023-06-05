<?php
include('koneksi.php');
// Mendapatkan data ulasan produk
header('Content-Type: application/json');
// Menyimpan ulasan produk
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_produk = $_POST['id_produk'];
    $id_user = $_POST['id_user'];
    $id_pesanan = $_POST['id_pesanan'];
    $rating = $_POST['rating'];
    $review = $_POST['review'];



    // Menyimpan ulasan ke tabel ulasan
    $query = mysqli_query($koneksi, "INSERT INTO ulasan(id_pesanan, id_user, id_produk, rating, review) VALUES('$id_pesanan', '$id_user', '$id_produk', '$rating', '$review')");

    // Menutup koneksi ke database


    if ($query) {
        echo json_encode(array('message' => 'Ulasan berhasil disimpan.', 'status' => 'success'));
    } else {
        echo json_encode(array('message' => 'Ulasan gagal disimpan.', 'status' => 'failed'));
    }
    // Mengembalikan respon sukses

}
?>