<?php
include('koneksi.php');
if ($_SERVER['REQUEST_METHOD'] == "POST") {


    $response = array();
    // ambil data login pengguna
    $email = $_POST['email_user'];
    $password = $_POST['password_user'];

    // lihat apakah pasangan email dan password terdapat pada database dan mengambil idpem
    $loggedin_user = mysqli_query($koneksi, "SELECT email_user, password_user, id_user FROM pengguna WHERE email_user='$email' AND password_user='$password'");
    $row = mysqli_fetch_array($loggedin_user);


    // apakah pasangan email dan password terdapat dalam database?
    if (mysqli_num_rows($loggedin_user) == 0) {
        // kalau tidak, alihkan ke halaman loginp.php dengan cek_owner=salah
        $response['value'] = 0;
        $response['message'] = "Email atau Password salah";
        echo json_encode($response);
    } else {
        // kalau ada, mulai sesi, set iduser, alihkan ke halaman pengguna.php
        $id = $row['id_user'];
        $query = mysqli_query($koneksi, "SELECT id_alamat FROM alamat WHERE id_user = $id");
        $hail = mysqli_fetch_array($query);
        $response['value'] = 1;
        $response['message'] = "Login Succesfully";
        $response['id_user'] = $row['id_user'];
        $response['id_alamat'] = $hail['id_alamat'];

        echo json_encode($response);
    }

}
?>