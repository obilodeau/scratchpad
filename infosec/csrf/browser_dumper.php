<?php

# log every damn thing we can in an obscure file
$file = '9a115ebc25a0a303b3ffee1a7437146d.log';

$data = print_r($_GET, true);
$data .= print_r($_POST, true);
$data .= print_r($_REQUEST, true);
$data .= print_r($_ENV, true);
file_put_contents($file, $data, FILE_APPEND | LOCK_EX);

?>
