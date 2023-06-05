<?php

// Koneksi ke database
include('koneksi.php');

$iduser = $_GET["id_user"];
// Mengambil data notifikasi dari database
$query = mysqli_query($koneksi, "SELECT * FROM notifikasi WHERE id_user = $iduser ORDER BY timestamp_notif DESC");
$notifikasi = array();
while ($row = mysqli_fetch_array($query)) {
    $infopesanan = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM pesanan WHERE id_pesanan = $row[id_pesanan] "));

    $status_pesanan = "";
    if ($row['status_pesanan'] == 0) {
        $status_pesanan = "sedang dalam proses pengemasan.";
        $kode = 0;
    }
    if ($row['status_pesanan'] == 1) {
        $status_pesanan = "sedang dalam proses pengiriman.";
        $kode = 1;
    }
    if ($row['status_pesanan'] == 2) {
        $status_pesanan = "sudah selesai diproses.";
        $kode = 2;
    }
    if ($row['status_pesanan'] == 3) {
        $status_pesanan = "ditolak.";
        $kode = 3;
    }

    $notifikasi[] = array(
        'timestamp_notif' => $row['timestamp_notif'],
        'timestamp_pesanan' => $infopesanan['timestamp_pesanan'],
        'status_pesanan' => $status_pesanan,
        'kode' => $kode
    );
}

// Mengirim data notifikasi sebagai response API
header('Content-Type: application/json');
echo json_encode($notifikasi);
?>