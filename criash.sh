#/bin/bash
nome=$1
touch $1.sh
chmod +x $1.sh
echo -e "#!/bin/bash \n" > $1.sh
