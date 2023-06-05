<?php

// Koneksi ke database
include('koneksi.php');

// Fungsi untuk mengambil data POST dari body request


// Fungsi untuk mengirim respon JSON
function sendResponse($status, $message, $data = null)
{
    $response = [
        'status' => $status,
        'message' => $message,

    ];
    header('Content-Type: application/json');
    echo json_encode($response);
    exit;
}

// Route untuk registrasi
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_GET['id'];

    $nama = $_POST['nama_user'];
    $email = $_POST['email_user'];
    $password = $_POST['password_user'];
    $telp = $_POST['telp_user'];

    // Validasi data
    if (empty($nama) || empty($email) || empty($password) || empty($telp)) {
        sendResponse('error', 'Semua field harus diisi');
    }
    // Simpan data pengguna
    $insertUserQuery = "UPDATE pengguna SET nama_user='$nama',email_user='$email',password_user='$password',telp_user='$telp' WHERE id_user='$id'";
    $insertUserResult = mysqli_query($koneksi, $insertUserQuery);
    if (!$insertUserResult) {
        sendResponse('error', 'Gagal menyimpan data pengguna');
    }


    sendResponse('success', 'Edit data diri berhasil');
}