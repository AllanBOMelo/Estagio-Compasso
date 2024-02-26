<?php
 include_once "app.php";
?>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h1>Usuarios:</h1>

    <ul>
        <?php foreach($users as $user): ?>
            <li>Nome:
                <?php echo $user['name']; ?>,
                Idade:
                <?php echo $user['age']; ?>
            </li>
        <?php endforeach; ?>
</body>
</html>
