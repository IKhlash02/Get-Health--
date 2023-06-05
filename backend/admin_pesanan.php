<?php

// Set header content type to JSON
header('Content-Type: application/json');

// Include database connection
include('koneksi.php');

// Retrieve the request parameters


// Prepare the response array
$response = array();

// Retrieve data from the database
$query = mysqli_query($koneksi, "SELECT * FROM pesanan");

while ($row = mysqli_fetch_array($query)) {
    $id_pesanan = $row['id_pesanan'];
    $id_user = $row['id_user'];
    $tanggal_pesanan = $row['timestamp_pesanan'];
    $user = mysqli_query($koneksi, "SELECT * FROM pengguna WHERE id_user = $id_user");
    $hasil = mysqli_fetch_array($user);


    // Create an array for each row of data
    $data = array(
        'nama_user' => $hasil['nama_user'],
        'foto_user' => 'image_view_user.php?id_user=' . $row['id_user'],
        'id_pesanan' => $row['id_pesanan'],
        'tanggal_pesanan' => $row['timestamp_pesanan'],
        'total' => getTotal($koneksi, $id_pesanan),
        'status_pesanan' => $row['status_pesanan'],
        'rincian_pesanan' => getRincianPesanan($koneksi, $id_pesanan, $row['status_pesanan'], $id_user),


    );

    // Add the data array to the response array
    $response[] = $data;

}


// Return the response as JSON
echo json_encode($response);

// Function to get the status of the order
function getStatusPesanan($status)
{
    if ($status == 0) {
        return "Diproses";
    } elseif ($status == 1) {
        return "Dikirim";
    } elseif ($status == 2) {
        return "Selesai";
    } elseif ($status == 3) {
        return "Batal";
    } else {
        return "";
    }
}

// Function to get the order details
function getRincianPesanan($koneksi, $id_pesanan, $status_pesanan, $id_user)
{
    $rincian_pesanan = array();
    $total = 0;

    $queryprodukpesanan = mysqli_query($koneksi, "SELECT * FROM rincian_pesanan WHERE id_pesanan=$id_pesanan");
    while ($rowproduk = mysqli_fetch_array($queryprodukpesanan)) {
        $id_produk = $rowproduk['id_produk'];
        $infoproduk = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM produk WHERE id_produk=$id_produk;"));


        $tombol = false;
        if ($status_pesanan == 2) {
            $cekulasan = mysqli_query($koneksi, "SELECT * FROM ulasan WHERE id_user = '$id_user' AND id_pesanan ='$id_pesanan' AND id_produk='$id_produk'");
            if (mysqli_num_rows($cekulasan) == 0) {
                $tombol = true;
            } else {

                $tombol = false;
            }
        } else {

            $tombol = false;
        }
        // Create an array for each item in the order
        $item = array(
            'id_produk' => $rowproduk['id_produk'],
            'gambar' => "image_view_produk.php?id_produk=" . $rowproduk['id_produk'],
            'nama_produk' => $infoproduk['nama_produk'],
            'jumlah_pesanan' => $rowproduk['jumlah_pesanan'],
            'jenis_satuan' => $infoproduk['jenis_satuan'],
            'total_harga' => $rowproduk['jumlah_pesanan'] * $infoproduk['harga_produk'],
            'enable_tombol' => $tombol
        );

        // Add the item array to the order details array
        $rincian_pesanan[] = $item;

        // Calculate the total price

    }

    // Add the total price to the order details array


    return $rincian_pesanan;
}

function getTotal($koneksi, $id_pesanan)
{
    $total = 0;
    $queryprodukpesanan = mysqli_query($koneksi, "SELECT * FROM rincian_pesanan WHERE id_pesanan=$id_pesanan");
    while ($rowproduk = mysqli_fetch_array($queryprodukpesanan)) {

        $id_produk = $rowproduk['id_produk'];
        $infoproduk = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM produk WHERE id_produk=$id_produk;"));
        $total += $rowproduk['jumlah_pesanan'] * $infoproduk['harga_produk'];
    }
    return $total;
}



?>