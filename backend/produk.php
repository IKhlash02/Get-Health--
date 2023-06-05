<?php
include('koneksi.php');



// Query untuk mengambil semua data produk dari database
$query = mysqli_query($koneksi, "SELECT * FROM produk");

// Buat array kosong untuk menyimpan data produk
$produk = array();

// Looping setiap baris data produk dan menambahkannya ke array produk
while ($row = mysqli_fetch_array($query)) {
    $id_produk = $row['id_produk'];
    $queryulasan = mysqli_query($koneksi, "SELECT * FROM ulasan WHERE id_produk=$id_produk ORDER BY timestamp_ulasan DESC");
    if (mysqli_num_rows($queryulasan) != 0) {
        // kalo ada ulasan tampilin rata2 ulasan sama ulasan2nya
        $penilaian = mysqli_query($koneksi, "SELECT (AVG(rating)) AS avg_rating FROM ulasan WHERE id_produk = $id_produk");
        $berapa = mysqli_fetch_array($penilaian);

    }
    $produk[] = array(
        'id_produk' => $row['id_produk'],
        'gambar' => 'image_view_produk.php?id_produk=' . $row['id_produk'],
        'id_golongan' => $row['id_golongan'],
        'nama_produk' => $row['nama_produk'],
        'deskripsi_produk' => $row['deskripsi_produk'],
        'indikasi' => $row['indikasi'],
        'kontraindikasi' => $row['kontraindikasi'],
        'komposisi' => $row['komposisi'],
        'aturan_pakai' => $row['aturan_pakai'],
        'efek_samping' => $row['efek_samping'],
        'peringatan_perhatian' => $row['peringatan_perhatian'],
        'harga_produk' => $row['harga_produk'],
        'jenis_satuan' => $row['jenis_satuan'],
        'perlu_resep' => $row['perlu_resep'],
        'jumlah_stok' => $row['jumlah_stok'],
        'avg_rating' => $berapa['avg_rating'] ?? "0.00",

    );


}

// Set header untuk mengirimkan output dalam format JSON
header('Content-Type: application/json');

// Konversi array produk menjadi format JSON dan kirimkan ke client
echo json_encode($produk);
?>