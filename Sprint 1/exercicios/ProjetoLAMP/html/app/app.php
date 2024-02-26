<?php

    $host     = "localhost";
    $user     = "Allan";
    $password = "Allan-01";
    $db       = "testephp";

    $conn = mysqli_connect($host, $user, $password, $db);

    $sql = "SELECT * FROM users";
    $result = mysqli_query($conn, $sql); //Executa a query no banco com a conexão
    $users = mysqli_fetch_all($result, MYSQLI_ASSOC); // Transforma o retorno da query em array e transforma em array associativo

    print_r($users); // Printa array na página

    mysqli_close($conn); // encerra a conexão com o banco
?>