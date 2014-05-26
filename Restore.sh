target=$(ls -1dt ~/.config/google-chrome/Default/Extensions/hbdpomandigafcibbmofojjchbcdagbl/* | head -1)

if [ -d "extBackup" ]; then
  rm -r $target
  mv extBackup $target
fi
