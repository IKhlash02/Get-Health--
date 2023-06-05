<?php
include('koneksi.php');
?>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <!-- https://www.warungbelajar.com/upload-dan-menampilkan-blob-image-dengan-php-dan-mysql.html -->
        <h1>Halaman ini cuma buat ngecek isi masing2 tabel</h1>
        <h2>Pengguna</h2>
        <a href="form_daftar.php">Daftar user baru</a>
        <a href="form_login.php">Login user</a>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Foto profil</th>
                <th>Nama</th>
                <th>Email</th>
                <th>Password</th>
                <th>No.telp</th>
            </tr>
            <?php
            $query = mysqli_query($koneksi,"SELECT * FROM pengguna");
            while($row = mysqli_fetch_array($query))
            {
                ?>
                <tr>
                    <td><?php echo $row['id_user']; ?></td>
                    <td><img src="image_view_user.php?id_user=<?php echo $row['id_user']; ?>" width="100"/></td>
                    <td><?php echo $row['nama_user']; ?></td>
                    <td><?php echo $row['email_user']; ?></td>
                    <td><?php echo $row['password_user']; ?></td>
                    <td><?php echo $row['telp_user']; ?></td>
                </tr>
                <?php
            }
            ?>
        </table>
        </br>

        <h2>Golongan</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nama golongan</th>
                <th>Deskripsi</th>
            </tr>
            <?php
            $query = mysqli_query($koneksi,"SELECT * FROM golongan");
            while($row = mysqli_fetch_array($query))
            {
                ?>
                <tr>
                    <td><?php echo $row['id_golongan']; ?></td>
                    <td><?php echo $row['nama_golongan']; ?></td>
                    <td><?php echo $row['deskripsi_golongan']; ?></td>
                </tr>
                <?php
            }
            ?>
        </table>

        <h2>Produk</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Foto</th>
                <th>Golongan</th>
                <th>Nama</th>
                <th>Deskripsi</th>
                <th>Indikasi</th>
                <th>Kontraindikasi</th>
                <th>Komposisi</th>
                <th>Aturan pakai</th>
                <th>Efek samping</th>
                <th>Peringatan & perhatian</th>
                <th>Harga</th>
                <th>Satuan</th>
                <th>Perlu resep</th>
            </tr>
            <?php
            $query = mysqli_query($koneksi,"SELECT * FROM produk");
            while($row = mysqli_fetch_array($query))
            {
                ?>
                <tr>
                    <td style="vertical-align: top;"><?php echo $row['id_produk']; ?></td>
                    <td style="vertical-align: top;"><img src="image_view_produk.php?id_produk=<?php echo $row['id_produk']; ?>" width="100"/></td>
                    <td style="vertical-align: top;"><?php echo $row['id_golongan']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['nama_produk']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['deskripsi_produk']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['indikasi']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['kontraindikasi']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['komposisi']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['aturan_pakai']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['efek_samping']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['peringatan_perhatian']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['harga_produk']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['jenis_satuan']; ?></td>
                    <td style="vertical-align: top;"><?php echo $row['perlu_resep']; ?></td>
                </tr>
                <?php
            }
            ?>
        </table>

        <h2>List Alamat</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nama alamat</th>
                <th>Nama penerima</th>
                <th>No telp. penerima</th>
                <th>Provinsi</th>
                <th>Kota/Kabupaten</th>
                <th>Kecamatan</th>
                <th>Kelurahan</th>
                <th>Kode pos</th>
                <th>Detail alamat</th>
                <th>Favorit?</th>
            </tr>
            <?php
            $query = mysqli_query($koneksi,"SELECT * FROM alamat");
            while($row = mysqli_fetch_array($query))
            {
                ?>
                <tr>
                    <td><?php echo $row['id_alamat']; ?></td>
                    <td><?php echo $row['nama_alamat']; ?></td>
                    <td><?php echo $row['penerima_alamat']; ?></td>
                    <td><?php echo $row['telp_alamat']; ?></td>
                    <td><?php echo $row['provinsi_alamat']; ?></td>
                    <td><?php echo $row['kabkot_alamat']; ?></td>
                    <td><?php echo $row['kec_alamat']; ?></td>
                    <td><?php echo $row['kel_alamat']; ?></td>
                    <td><?php echo $row['kodepos_alamat']; ?></td>
                    <td><?php echo $row['detail_alamat']; ?></td>
                    <td><?php echo $row['favorit_alamat']; ?></td>
                </tr>
                <?php
            }
            ?>
        </table>

    </body>
</html>
