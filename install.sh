mkdir -p "$HOME/.neat/"
cd "$HOME/.neat/"

git clone "https://github.com/HereIsKevin/neat"
cd "./neat/"

./tool.sh build

echo "add 'source \"$HOME/.neat/neat/out/neat.sh\"' to your .bashrc"
