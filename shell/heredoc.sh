#!/bin/sh

echo "Heredoc to stdout must use cat and not echo"
VAR="Variables"
cat <<EOD
====================
  Something Fancy

  by Someone Fancy
====================
Using $VAR
EOD

echo "Want to see if we can echo an heredoc and redirect it to a file"
VAR="Variables"
cat > heredoc-msg.txt <<EOD
====================
  Something Fancy

  by Someone Fancy
====================
Using $VAR
EOD
