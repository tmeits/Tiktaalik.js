#
cd ~/git/Tiktaalik/source
rm *.sym
~/xds/bin/xc =compile Random.ob2
~/xds/bin/xc =complie Controls.ob2
~/xds/bin/xc =compile TestFunctions.ob2
~/xds/bin/xc =compile Tiktaalik.ob2
~/xds/bin/xc =make Tiktaalik.ob2 +MAIN