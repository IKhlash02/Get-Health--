<?php
// Menghubungkan ke database (misalnya menggunakan koneksi $koneksi)
include('koneksi.php');





// Mendapatkan ID alamat dari parameter URL
$id = $_GET['id'];


// Mengambil data alamat berdasarkan ID
$query = mysqli_query($koneksi, "SELECT * FROM alamat WHERE id_user = $id");

// Memeriksa apakah data alamat dengan ID yang diberikan ditemukan
if (mysqli_num_rows($query) > 0) {
    // Mengambil data alamat
    $row = mysqli_fetch_assoc($query);


    // Set header untuk mengirimkan output dalam format JSON
    header('Content-Type: application/json');

    // Menampilkan respons dalam format JSON
    echo json_encode($row);
} else {
    // Jika data alamat tidak ditemukan, menampilkan pesan error
    echo json_encode(array('message' => 'Alamat tidak ditemukan'));
}

// Menutup koneksi ke database (jika sudah tidak digunakan)
?>