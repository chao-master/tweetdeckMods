target=$(ls -1dt ~/.config/google-chrome/Default/Extensions/hbdpomandigafcibbmofojjchbcdagbl/* | head -1)

if [ -d "extBackup" ]; then
    echo "WARNING! Backup Director already detected, This normally means you have already injected code."
    echo "To inject new or modified code run Restore.sh first"
    read -p "Press Y to continue, or any other key to abort   " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
fi

cp -r $target extBackup
mkdir $target/hacks
cp *.js $target/hacks

for f in *.html; do
    set -- $(head -1 $f)
    echo "Injecting $f into $2 at $3"
    
    awk '/'$3'/{while(getline line<"'$f'"){print line}} //' $target/$2 > tmp
    mv tmp $target/$2
done
