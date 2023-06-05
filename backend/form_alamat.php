<?php 
include('koneksi.php');
session_start();
if($_SESSION['id_user']!=NULL){
		$iduser = $_SESSION["id_user"]; 
	} else {
		header("Location:form_login.php");
}
if(isset($_POST['tombol']))
{

    $nama = $_POST['nama_alamat'];
    $penerima = $_POST['penerima_alamat'];
    $telp = $_POST['telp_alamat'];
    $provinsi = $_POST['provinsi_alamat'];
    $kabkot = $_POST['kabkot_alamat'];
    $kec = $_POST['kec_alamat'];
    $kel = $_POST['kel_alamat'];
    $kodepos = $_POST['kodepos_alamat'];
    $detail = $_POST['detail_alamat'];
    if( isset($_POST['favorit_alamat'])){
        mysqli_query($koneksi,"UPDATE alamat SET favorit_alamat=0 WHERE alamat.favorit_alamat=1");
        $fav = TRUE;
    }
    else{
        $fav = FALSE;
    }
    
    mysqli_query($koneksi,"INSERT into alamat (id_user,nama_alamat,penerima_alamat,telp_alamat,provinsi_alamat,kabkot_alamat,kec_alamat,kel_alamat,kodepos_alamat,detail_alamat,favorit_alamat) values ('$iduser','$nama','$penerima','$telp','$provinsi','$kabkot','$kec','$kel','$kodepos','$detail','$fav')");
    header("location:sukseslogin.php");
    
}

?>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <form method="post" action="" enctype="multipart/form-data">
        <table>
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
			<td><input type="checkbox" name="favorit_alamat" value="Ya">Jadikan alamat favorit</td>
            </tr>
            <tr>
                <td><input type="submit" name="tombol"/></td>
            </tr>
        </table>
        </form>

    </body>
</html>