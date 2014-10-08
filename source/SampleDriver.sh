#
cd ~/git/Tiktaalik/source
rm *.sym
rm *.o
~/xds/bin/xc =compile Random.ob2
~/xds/bin/xc =compile Controls.ob2
~/xds/bin/xc =compile TestFunctions.ob2
~/xds/bin/xc =compile Tiktaalik.ob2
~/xds/bin/xc =make SampleDriver.ob2 +MAIN
