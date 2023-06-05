<?php 
include('koneksi.php');
if(isset($_POST['tombol']))
{
    if(!isset($_FILES['gambar']['tmp_name'])){
        echo '<span style="color:red"><b><u><i>Pilih file gambar</i></u></b></span>';
    }
    else
    {
        $file_size = $_FILES['gambar']['size'];
        $file_type = $_FILES['gambar']['type'];
        if ($file_size < 2048000 and ($file_type =='image/jpeg' or $file_type == 'image/png'))
        {
            $nama = $_POST['nama_user'];
            $email = $_POST['email_user'];
            $password = $_POST['password_user'];
            $telp = $_POST['telp_user'];
            $foto = addslashes(file_get_contents($_FILES['gambar']['tmp_name']));
            mysqli_query($koneksi,"insert into pengguna (nama_user,email_user,password_user,telp_user,foto_user) values ('$nama','$email','$password','$telp','$foto')");

            $loggedin_user = mysqli_query($koneksi,"SELECT email_user, password_user, id_user FROM pengguna WHERE email_user='$email' AND password_user='$password'");
            $row = mysqli_fetch_array($loggedin_user);
            $iduser = $row['id_user'];
            
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
        
            mysqli_query($koneksi,"INSERT into alamat (id_user,nama_alamat,penerima_alamat,telp_alamat,provinsi_alamat,kabkot_alamat,kec_alamat,kel_alamat,kodepos_alamat,detail_alamat,favorit_alamat) values ('$iduser','$nama','$penerima','$telp','$provinsi','$kabkot','$kec','$kel','$kodepos','$detail','$fav')");
            
            session_start();
            $_SESSION["id_user"] = $iduser;
            header("Location: sukseslogin.php");
        }
        else
        {
            echo '<span style="color:red"><b><u><i>Ukuruan File / Tipe File Tidak Sesuai</i></u></b></span>';
        }
        
    }
}
?>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <form method="post" action="" enctype="multipart/form-data">
        <table>
        <tr><td><b>Data Diri</b></td></tr>
            <tr>
                <td>Nama pengguna</td>
                <td><input type="text" name="nama_user"/></td>
            </tr>
            <tr>
                <td>Alamat email</td>
                <td><input type="text" name="email_user"></textarea></td>
            </tr>
            <tr>
                <td>Kata sandi</td>
                <td><input type="password" name="password_user"></textarea></td>
            </tr>
            <tr>
                <td>Nomor telepon</td>
                <td><input type="text" name="telp_user"></textarea></td>
            </tr>
            <tr>
                <td>Foto profil</td>
                <td><input type="file" name="gambar"/></td>
            </tr>
            <tr><td><b>Data Alamat</b><td></tr>
            <tr>
                <td>Nama alamat</td>
                <td><input type="text" name="nama_alamat"/></td>
            </tr>
            <tr>
                <td>Nama penerima</td>
                <td><input type="text" name="penerima_alamat"></textarea></td>
            </tr>
            <tr>
                <td>No. telp penerima</td>
                <td><input type="text" name="telp_alamat"></textarea></td>
            </tr>
            <tr>
                <td>Provinsi</td>
                <td><input type="text" name="provinsi_alamat"></textarea></td>
            </tr>
            <tr>
                <td>Kota/Kabupaten</td>
                <td><input type="text" name="kabkot_alamat"></textarea></td>
            </tr>
            <tr>
                <td>Kecamatan</td>
                <td><input type="text" name="kec_alamat"></textarea></td>
            </tr>
            <tr>
                <td>Kelurahan</td>
                <td><input type="text" name="kel_alamat"></textarea></td>
            </tr>
            <tr>
                <td>Kode pos</td>
                <td><input type="text" name="kodepos_alamat"></textarea></td>
            </tr>
            <tr>
                <td>Detail alamat</td>
                <td><input type="text" name="detail_alamat"></textarea></td>
            </tr>
            <tr>
                <td><input type="submit" name="tombol"/></td>
            </tr>
        </table>
        </form>

    </body>
</html>
