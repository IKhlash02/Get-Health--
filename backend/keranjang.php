<?php

include('koneksi.php');

// Set header content type to JSON
header('Content-Type: application/json');

// Initialize the response array
$response = array();

$iduser = $_GET['id'];

// Retrieve data from the database
$query = "SELECT keranjang_belanja.id_produk, produk.nama_produk, keranjang_belanja.jumlah, produk.jenis_satuan, keranjang_belanja.jumlah * produk.harga_produk AS total_harga
          FROM keranjang_belanja
          INNER JOIN produk ON keranjang_belanja.id_produk = produk.id_produk
          WHERE keranjang_belanja.id_user = $iduser";

$result = mysqli_query($koneksi, $query);

if ($result) {
    // Check if there are any rows returned
    if (mysqli_num_rows($result) > 0) {
        $total = 0;
        $array_id_produk = array();
        $rows = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $array_id_produk[] = $row['id_produk'];

            // Create an array for each row of data
            $data = array(
                'id_produk' => $row['id_produk'],
                'nama_produk' => $row['nama_produk'],
                'jumlah' => $row['jumlah'],
                'jenis_satuan' => $row['jenis_satuan'],
                'total_harga' => $row['total_harga'],
                'gambar' => "image_view_produk.php?id_produk=" . $row['id_produk'],
            );

            // Add the data array to the rows array
            $rows[] = $data;

            // Calculate the total
            $total += $row['total_harga'];
        }

        // Add the total to the response
        $response['total'] = $total;

        // Add the array of product IDs to the response
        $response['produk_checkout'] = $array_id_produk;

        // Add the rows array to the response
        $response['data'] = $rows;
        $response['message'] = 'Succes';
    } else {
        // No data found
        $response['message'] = 'No data found.';
    }
} else {
    // Query execution error
    $response['message'] = 'Query execution error.';
}

// Return the response as JSON
echo json_encode($response);

?>