@echo off
rem the standard MAME ROM file names are used

set rom_path=roms\

romgen %rom_path%82s126.1m PACROM_1M 9 l r e > %rom_path%pacrom_1m.vhd
romgen %rom_path%82s126.4a PACROM_4A_DST 8 c > %rom_path%pacrom_4a_dst.vhd
romgen %rom_path%82s123.7f PACROM_7F_DST 4 c > %rom_path%pacrom_7f_dst.vhd

romgen %rom_path%pacplus.4a PACROM_4A_PACPLUS 8 c > %rom_path%pacrom_4a_pacplus.vhd
romgen %rom_path%pacplus.7f PACROM_7F_PACPLUS 4 c > %rom_path%pacrom_7f_pacplus.vhd

romgen %rom_path%pacrom_1m.bin PACROM_1M_PONG 9 l r e > %rom_path%pacrom_1m_pong.vhd
romgen %rom_path%pacrom_4a.bin PACROM_4A_PONG 8 c > %rom_path%pacrom_4a_pong.vhd
romgen %rom_path%pacrom_7f.bin PACROM_7F_PONG 4 c > %rom_path%pacrom_7f_pong.vhd

romgen %rom_path%4a.cpu PACROM_4A_LIZWIZ 8 c > %rom_path%pacrom_4a_lizwiz.vhd
romgen %rom_path%7f.cpu PACROM_7F_LIZWIZ 4 c > %rom_path%pacrom_7f_lizwiz.vhd

romgen %rom_path%2s140.4a PACROM_4A_CRUSH 8 c > %rom_path%pacrom_4a_crush.vhd


decryptmrtnt %rom_path%

copy/b %rom_path%pacman.6e+%rom_path%pacman.6f+%rom_path%pacman.6h+%rom_path%pacman.6j+%rom_path%pacman.5e+%rom_path%pacman.5f+%rom_path%blank8k.dat %rom_path%pacman.all
copy/b %rom_path%pacrom_6e.bin+%rom_path%pacrom_6f.bin+%rom_path%pacrom_6h.bin+%rom_path%pacrom_6j.bin+%rom_path%pacrom_5e.bin+%rom_path%pacrom_5f.bin+%rom_path%blank8k.dat %rom_path%pong.all
copy/b %rom_path%pacplusu.6e+%rom_path%pacplusu.6f+%rom_path%pacplusu.6h+%rom_path%pacplusu.6j+%rom_path%pacplus.5e+%rom_path%pacplus.5f+%rom_path%blank8k.dat %rom_path%pacplus.all
copy/b %rom_path%tntu.1+%rom_path%tntu.2+%rom_path%tntu.3+%rom_path%tntu.4+%rom_path%tntu.5+%rom_path%tntu.6+%rom_path%blank8k.dat %rom_path%mrtnt.all
copy/b %rom_path%boot1+%rom_path%boot2+%rom_path%boot3+%rom_path%boot4+%rom_path%5e+%rom_path%5f+%rom_path%boot5+%rom_path%boot6 %rom_path%mspac.all
copy/b %rom_path%tp1+%rom_path%tp5a+%rom_path%tp2+%rom_path%tp6+%rom_path%tp3+%rom_path%tp7+%rom_path%tp4+%rom_path%tp8+%rom_path%tpa+%rom_path%tpc+%rom_path%tpb+%rom_path%tpd+%rom_path%blank8k.dat %rom_path%crush.all
copy/b %rom_path%1.bin+%rom_path%5.bin+%rom_path%2.bin+%rom_path%6.bin+%rom_path%3.bin+%rom_path%7.bin+%rom_path%4.bin+%rom_path%8.bin+%rom_path%x.bin+%rom_path%c.bin+%rom_path%b.bin+%rom_path%p.bin+%rom_path%blank8k.dat %rom_path%eyes.all
copy/b %rom_path%6e.cpu+%rom_path%6f.cpu+%rom_path%6h.cpu+%rom_path%6j.cpu+%rom_path%5e.cpu+%rom_path%5f.cpu+%rom_path%wiza+%rom_path%wizb %rom_path%lizwiz.all

copy/b %rom_path%pacman.all+%rom_path%pacplus.all+%rom_path%pong.all+%rom_path%mrtnt.all+%rom_path%mspac.all+%rom_path%crush.all+%rom_path%eyes.all+%rom_path%lizwiz.all %rom_path%pacmulti.dat

bin2hex /4 /O524288 %rom_path%pacmulti.dat %rom_path%pacmulti.mcs

dir %rom_path%*.all
dir %rom_path%*.dat
dir %rom_path%*.mcs

echo done
