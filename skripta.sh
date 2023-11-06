gist_url="https://gist.githubusercontent.com/patik123/e9261bea9adbd8e87a96e622988dcdfb/raw/3f89b929d38d170edfae109d33c32c206fe1f4bc/predmeti.txt"

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
BLUEITALIC="\e[34;3m"
ENDCOLOR="\e[0m"

# Check if directory exists
if [ -d "studij" ]; then
    echo -e "${RED}Mapa studij že obstaja. Mapa bo v celoti izbrisana${ENDCOLOR}" # print message
    rm -R "studij" # remove directory 
fi

# Create directory
mkdir "studij" # create directory
cd "studij" # enter directory

# Create directory
mkdir "2023-2024" # create directory
cd "2023-2024" # enter directory

# Create directories
while read line; do # read file line by line
    echo -e "${BLUEITALIC}Ustvarjam mapo $line${ENDCOLOR}" # print message
    mkdir "$line" # create directory
    cd "$line" # enter directory
    mkdir "vaje" # create directory
    mkdir "predavanja" # create directory
    cd .. # exit directory 
done < <(curl -s "$gist_url") # read file from url

echo -e "${GREEN}Uspešno ustvarjena struktura map${ENDCOLOR}" # print message

# Tree
echo -e "${BLUE}Struktura map:${ENDCOLOR}" # print message 
find . | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/" # print tree

# Path: skripta.sh

# Opomba zame: 
# Prenos iz lokalne naprave na strežnik:
# scp C:\laragon\oikt\skripta.sh patrick@192.168.201.128:/home/patrick/

# Deploy na strežnik:
# $ bash skripta.sh

# Vir za barve: https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4

# Vir za tree: https://stackoverflow.com/a/61073579