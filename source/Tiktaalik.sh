#
cd ~/git/Tiktaalik/source
rm *.sym
rm *.o

~/xds/bin/xc =compile Random.ob2
~/xds/bin/xc =complie Controls.ob2
~/xds/bin/xc =compile TestFunctions.ob2
~/xds/bin/xc =make Tiktaalik.ob2 +MAIN


