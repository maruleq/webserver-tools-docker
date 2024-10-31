<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web Server</title>
</head>
<body>
    <?php
    echo '<h1>Welcome on WebServer ;-)</h1>';
    echo date('l jS \of F Y h:i:s A');
    echo '<h2>Connected to database successfully!</h2>';
    echo '<br><br>';
    echo '<h2>Variables available:</h2>';
    var_dump($_ENV);
    echo '<br><br>';

    echo '<h2>PHP Info:</h2>';
    phpinfo();
    ?>
</body>
</html>