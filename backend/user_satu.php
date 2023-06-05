<?php
// Menghubungkan ke database (misalnya menggunakan koneksi $koneksi)
include('koneksi.php');

// Mendapatkan ID pengguna dari parameter URL
$id = $_GET['id'];

// Mengambil data pengguna berdasarkan ID
$query = mysqli_query($koneksi, "SELECT * FROM pengguna WHERE id_user = $id");

// Memeriksa apakah data pengguna dengan ID yang diberikan ditemukan
if (mysqli_num_rows($query) > 0) {
    // Mengambil data pengguna
    $row = mysqli_fetch_array($query);

    // Membuat objek data pengguna
    $user = new stdClass();
    $user->id_user = $row['id_user'];
    $user->nama_user = $row['nama_user'];
    $user->email_user = $row['email_user'];
    $user->password_user = $row['password_user'];
    $user->telp_user = $row['telp_user'];
    $user->foto_user = 'image_view_user.php?id_user=' . $row['id_user'];

    // Set header untuk mengirimkan output dalam format JSON
    header('Content-Type: application/json');

    // Menampilkan respons dalam format JSON
    echo json_encode($user);
} else {
    // Jika data pengguna tidak ditemukan, mengembalikan respons kosong
    echo json_encode(array('message' => 'User tidak ditemukan'));
}
?>