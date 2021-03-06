#!/bin/sh
# script gutosie 
IMAGEKATALOG=ImageBoot
NEODEVICE=$( cat /usr/lib/enigma2/python/Plugins/Extensions/NeoBoot/.location) 

if [ ! -e /usr/bin/ipkg ]; then 
   ln -sfn /usr/bin/opkg /usr/bin/ipkg
fi
if [ ! -e /usr/bin/ipkg-cl ]; then 
   ln -sfn /usr/bin/opkg-cl /usr/bin/ipkg-cl
fi

#echo "Start network and telnet ..."
if [ -f /tmp/ver.txt ] ; then
    rm -f/tmp/ver.txt
fi 
cd /tmp; curl -O --ftp-ssl https://raw.githubusercontent.com/gutosie/NeoBoot8/master/ver.txt; cd /
if [ ! -f /tmp/ver.txt ] ; then
    /etc/init.d/networking stop; sync; /etc/init.d/networking start;
fi

                   
if [ -f /etc/init.d/inadyn-mt ] ; then
    /etc/init.d/inadyn-mt start
fi

if [ -e /usr/lib/enigma2/python/Plugins/Extensions/NeoBoot/files/mountpoint.sh  ]; then
    /usr/lib/enigma2/python/Plugins/Extensions/NeoBoot/files/mountpoint.sh
fi                

fi                   

if [ -f /etc/rcS.d/S50fat.sh ] ; then
                            ln -s /usr/lib/enigma2/python/Plugins/Extensions/NeoBoot/files/S50fat.sh /etc/rcS.d/S50neo.sh                                                        
                            telnetd on
                            echo ok  
                            rm -f /etc/rcS.d/S50fat.sh
                            echo "file S50fat.sh delete"  
fi 
echo ok                                                
