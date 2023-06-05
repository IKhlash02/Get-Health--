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
        'data' => $data
    ];
    header('Content-Type: application/json');
    echo json_encode($response);
    exit;
}

// Route untuk registrasi
if ($_SERVER['REQUEST_METHOD'] === 'POST') {


    $nama = $_POST['nama_user'];
    $email = $_POST['email_user'];
    $password = $_POST['password_user'];
    $telp = $_POST['telp_user'];

    // Validasi data
    if (empty($nama) || empty($email) || empty($password) || empty($telp)) {
        sendResponse('error', 'Semua field harus diisi');
    }

    // Cek apakah email sudah terdaftar
    $checkEmailQuery = "SELECT * FROM pengguna WHERE email_user = '$email'";
    $checkEmailResult = mysqli_query($koneksi, $checkEmailQuery);
    if (mysqli_num_rows($checkEmailResult) > 0) {
        sendResponse('error', 'Email sudah terdaftar');
    }

    // Simpan data pengguna
    $insertUserQuery = "INSERT INTO pengguna (nama_user, email_user, password_user, telp_user, foto_user) VALUES ('$nama', '$email', '$password', '$telp', 'http://localhost/get_healt/gethealthplus/image_view_produk.php?id_produk=1')";
    $insertUserResult = mysqli_query($koneksi, $insertUserQuery);
    if (!$insertUserResult) {
        sendResponse('error', 'Gagal menyimpan data pengguna');
    }

    // Ambil ID user yang baru ditambahkan
    $iduser = mysqli_insert_id($koneksi);

    // Simpan data alamat
    $namaAlamat = $_POST['nama_alamat'];
    $penerima = $_POST['penerima_alamat'];
    $telpAlamat = $_POST['telp_alamat'];
    $provinsi = $_POST['provinsi_alamat'];
    $kabkot = $_POST['kabkot_alamat'];
    $kec = $_POST['kec_alamat'];
    $kel = $_POST['kel_alamat'];
    $kodepos = $_POST['kodepos_alamat'];
    $detail = $_POST['detail_alamat'];
    $favorit = true;

    $insertAlamatQuery = "INSERT INTO alamat (id_user, nama_alamat, penerima_alamat, telp_alamat, provinsi_alamat, kabkot_alamat, kec_alamat, kel_alamat, kodepos_alamat, detail_alamat, favorit_alamat) VALUES ('$iduser', '$namaAlamat', '$penerima', '$telpAlamat', '$provinsi', '$kabkot', '$kec', '$kel', '$kodepos', '$detail', '$favorit')";
    $insertAlamatResult = mysqli_query($koneksi, $insertAlamatQuery);
    if (!$insertAlamatResult) {
        sendResponse('error', 'Gagal menyimpan data alamat');
    }

    sendResponse('success', 'Registrasi berhasil');
}