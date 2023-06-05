<?php
include('koneksi.php');

header('Content-Type: application/json');

// Pastikan metode HTTP adalah POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Membaca data JSON dari body permintaan
    $data = json_decode(file_get_contents('php://input'), true);

    // Memeriksa apakah parameter yang dibutuhkan ada
    if (isset($data['id_user']) && isset($data['id_alamat']) && isset($data['produk_pesanan']) && isset($data['jumlah_produk'])) {
        // Mendapatkan data dari input
        $id_user = $data['id_user'];
        $id_alamat = $data['id_alamat'];
        $produk_pesanan = $data['produk_pesanan'];
        $jumlah_produk = $data['jumlah_produk'];

        mysqli_query($koneksi, "INSERT into pesanan (id_user, id_alamat, status_pesanan) VALUES ('$id_user', '$id_alamat', 0)");

        $total_harga = 0;
        for ($i = 0; $i < count($produk_pesanan); $i++) {
            $id_produk = $produk_pesanan[$i];
            $jumlah_pesanan = $jumlah_produk[$i];

            // Lakukan operasi sesuai kebutuhan, misalnya:
            // - Mendapatkan informasi produk dari database
            // - Menghitung total harga
            // - Menyimpan rincian pesanan ke dalam tabel rincian_pesanan
            // ...

            // Contoh: Menghitung total harga


            // Contoh: Menyimpan rincian pesanan
            mysqli_query($koneksi, "INSERT into rincian_pesanan (id_pesanan, id_produk, jumlah_pesanan) VALUES (LAST_INSERT_ID(), '$id_produk', '$jumlah_pesanan')");

            // Hapus item dari keranjang belanja
            mysqli_query($koneksi, "DELETE FROM keranjang_belanja WHERE id_produk = '$id_produk' AND id_user = '$id_user'");
        }

        // Buat respons JSON
        $response = [
            'status' => 'success',
            'message' => 'Pesanan berhasil dibuat',
            // Informasi lain yang ingin Anda sertakan dalam respons
        ];

        echo json_encode($response);
    } else {
        // Jika parameter yang dibutuhkan tidak ada
        $response = [
            'status' => 'error',
            'message' => 'Parameter tidak lengkap'
        ];

        echo json_encode($response);
    }
} else {
    // Jika metode HTTP tidak sesuai
    http_response_code(405);
    $response = [
        'status' => 'error',
        'message' => 'Metode HTTP tidak diizinkan'
    ];

    echo json_encode($response);
}

?>