<?php

// Set header content type to JSON
header('Content-Type: application/json');

// Include database connection
include('koneksi.php');
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


// Retrieve the request parameters
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $status_pesanan = $_POST['status_pesanan'] + 1;
    $id_pesanan = $_POST['id_pesanan'];
    $insertUserQuery = "UPDATE pesanan SET status_pesanan= '$status_pesanan' WHERE id_pesanan='$id_pesanan'";
    $insertUserResult = mysqli_query($koneksi, $insertUserQuery);

    if (!$insertUserResult) {
        sendResponse('error', 'Gagal menyimpan data pengguna');
    }
    sendResponse('success', 'produk berhasil diupdate');
}


?>