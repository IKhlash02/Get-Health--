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

    $nama = $_POST['nama_alamat'];
    $penerima = $_POST['penerima_alamat'];
    $telp = $_POST['telp_alamat'];
    $provinsi = $_POST['provinsi_alamat'];
    $kabkot = $_POST['kabkot_alamat'];
    $kec = $_POST['kec_alamat'];
    $kel = $_POST['kel_alamat'];
    $kodepos = $_POST['kodepos_alamat'];
    $detail = $_POST['detail_alamat'];
    $fav = TRUE;

    // Validasi data
    if (empty($nama) || empty($penerima) || empty($telp) || empty($provinsi)) {
        sendResponse('error', 'Semua field harus diisi');
    }
    // Simpan data pengguna
    $insertUserQuery = "UPDATE alamat SET nama_alamat='$nama', penerima_alamat='$penerima', telp_alamat='$telp', provinsi_alamat='$provinsi', kabkot_alamat='$kabkot', kec_alamat='$kec', kel_alamat='$kel', kodepos_alamat='$kodepos', detail_alamat='$detail', favorit_alamat=$fav WHERE id_user='$id'";
    $insertUserResult = mysqli_query($koneksi, $insertUserQuery);
    if (!$insertUserResult) {
        sendResponse('error', 'Gagal menyimpan data pengguna');
    }


    sendResponse('success', 'Edit data alamat berhasil');
}