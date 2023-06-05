<?php

include('koneksi.php');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_produk = $_GET['id_produk'];
    $id_user = $_GET['id_user'];
    $jumlah = $_POST['jumlah'];

    // Periksa apakah data dengan id_produk dan id_user sudah ada di database
    $checkQuery = mysqli_query($koneksi, "SELECT * FROM keranjang_belanja WHERE id_produk = $id_produk AND id_user = $id_user");
    $numRows = mysqli_num_rows($checkQuery);

    if ($numRows > 0) {
        // Jika data sudah ada, lakukan operasi update dengan menambahkan nilai sebelumnya dengan nilai sekarang
        $updateQuery = mysqli_query($koneksi, "UPDATE keranjang_belanja SET jumlah = jumlah + $jumlah WHERE id_produk = $id_produk AND id_user = $id_user");

        if ($updateQuery) {
            $response = [
                'status' => 'success',
                'message' => 'Data updated successfully',
            ];
        } else {
            $response = [
                'status' => 'error',
                'message' => 'Failed to update data',
            ];
        }
    } else {
        // Jika data belum ada, lakukan operasi insert
        $insertQuery = mysqli_query($koneksi, "INSERT INTO keranjang_belanja (id_user, id_produk, jumlah) VALUES ($id_user, $id_produk, $jumlah)");

        if ($insertQuery) {
            $response = [
                'status' => 'success',
                'message' => 'Data inserted successfully',
            ];
        } else {
            $response = [
                'status' => 'error',
                'message' => 'Failed to insert data',
            ];
        }
    }

    echo json_encode($response);
}
?>