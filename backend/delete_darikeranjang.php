<?php

// Set header content type to JSON
header('Content-Type: application/json');

// Include database connection
include('koneksi.php');

// Retrieve the request parameters
$idproduk = $_GET['id_produk'];
$iduser = $_GET['id_user'];

// Prepare the response array
$response = array();

// Delete data from the database
$query = mysqli_query($koneksi, "DELETE FROM keranjang_belanja WHERE id_produk='$idproduk' AND id_user='$iduser'");

if ($query) {
    $response['success'] = true;
    $response['message'] = 'Data deleted successfully';
} else {
    $response['success'] = false;
    $response['message'] = 'Failed to delete data';
}

// Return the response as JSON
echo json_encode($response);

?>