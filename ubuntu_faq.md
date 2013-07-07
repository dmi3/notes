##Ubuntu FAQ
!tags:Special

Привет!

Здесь собраны решения проблем, возникающих при работе с Ubuntu Linux.

Все FAQ генерируется из текстового файла [Python скриптом](http://thexnews.com/ubuntu-faq-2.html).

Можно найти что-то полезное. Сам пользуюсь.

Док постоянно обновляеться.


##Узнать код клавиши
###keycode for making shortcuts
Узнать код клавиши или комбинации клавиш.
Что-бы задавать hotkeys в настройках например openbox.
    xev | grep keycode

##dpkg: status database area is locked by another process
Небезопасный метод:
    ps ax | grep dpkg
смотрим какой из процессов занимает dpkg
если не получаеться его завершить - убиваем из консоли:
    killall dpkg



##Replace Nautilus by Dolphin:
Заменить Nautilus на Dolphin или любой другой файловый менеджер
    mkdir -p ~/bin && touch ~/bin/nautilus && chmod +x ~/bin/nautilus && gedit ~/bin/nautilus &
paste:
    #!/bin/bash
    exec dolphin $@
    exit 0

##Disable PC Speaker:
    echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/blacklist-pcspkr.conf
    sudo reboot

##Firefox 3 криво маштабирует картинки
###Firefox do not zoom images
!tags:Firefox
    about:config
set browser.zoom.full to false

##Отключить скринсейвер на время
###Pause screensaver
    gnome-screensaver-command -i
(Ctrl +Z что-бы опять включить)

##Запустить несколько комманд из консоли
###Launch more then one command from console:
    command &

##Прервать выполнение команды
###Interrupt command
!tags:Основы,Консоль
Ctrl+Z

##Найти комманду, которую набрали ранее
###Find command
!tags:Основы,Консоль
Ctrl+R

##Перейти в предыдущую директорию (Back)
###Bash previous directiry
!tags:Основы,Консоль
    cd -

##Поиск
###Search
!tags:Основы,Консоль
    find ./ "something"

##Открыть порт
###Open Port
!tags:Сеть
    sudo iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dport 34222 -j ACCEPT

##Закрыть порт
###Close Port:
!tags:Сеть
    sudo iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dport 34222 -j DROP

##Список открытых портов
###ViewOpenPorts:
!tags:Сеть
    netstat -lntup

##Изменить MAC адрес
###Change MAC
!tags:Сеть
    sudo ifconfig eth0 down
    sudo ifconfig eth0 hw ether 00:cc:cc:cc:cc:cc
    sudo ifconfig eth0 up


##Сделать файл исполняемым
###Create executable
!tags:Основы,Консоль
    chmod +x file

##Узнать размер папки
###Folder size
!tags:Основы,Консоль
    du -sh /home/graf/

##Поломался Notebook Remix
###Notebook Remix mode broke
!tags:EEE
    maximus&

##Mathemathica 5 неправильные шрифты
###Mathemathica 5 wine strange fonts
Все криво
!tags:Soft,wine
Options->"FontMonospaced" to "False"

##Подключить Windows Share
###Connect windows network if unseen in "Network Servers"
Даже если не отображается в "Network Servers"
!tags:Сеть
    nautilus smb://username@server/Share/

##Настройка Maximus
###Maximus
!tags:EEE
    gconf-editor /apps/maximus
    xprop | grep WM_CLASS
 gedit /usr/share/gconf/schemas/maximus.schemas
    killall maximus

##Поменять разрешение экрана из терминала
###Screen resolution
!tags:Консоль
узнать доступное разрешение, частоту обновления -
    xrandr
поменять разрешение экрана
    xrandr -s 0
где 0 - номер из списка выведенного xrandr
или
    xrandr --size 1152x864 --refresh 56
Выключить монитор
    xrandr --output VGA1 --off
где VGA1 - выход

##Усыпить компьютер
###Hibernate
##$Консоль
    sudo /usr/sbin/pm-hibernate

##change nautilus to normal fm (dolphin)
    sudo gedit /usr/share/applications/nautilus-folder-handler.desktop
replace "nautilus --no-desktop %U" to "d3lphin"


##Узнать путь к программе
###Path to application
!tags:Консоль
    whereis
    which

##LAN dies after sleep eth0 becomes eth*
    sudo gedit /etc/iftab
    eth0 mac 00:00:00:a00:1a:ec
    /etc/udev/rules.d/70-persistent-net.rules

##Сохранить звук из видео файла
###Extract sound
!tags:Multimedia
    mplayer -dumpaudio video.avi -dumpfile sound.mp3
Альтернативный вариант
    ffmpeg -i video.avi sound.mp3

##Convert wma
!tags:Multimedia
    mplayer -vo null -vc dummy -ao pcm:waveheader:file=output.wav input.wma

##Convert all wma (for)
!tags:Multimedia
    for i in *.wma; do mplayer -vo null -vc dummy -ao pcm:waveheader:file="$i.wav" "$i"; done
    rename *.wma.wav *wav

##Using For
!tags:Основы,Консоль
    for i in *.wma; do echo $i; done

##Отключить логи (уменьшить обращения к жесткому диску)
###Kill logging
На свой страх и риск
    sudo gedit /etc/fstab
Append:
    tmpfs /tmp tmpfs defaults,noatime,mode=1777 0 0
    tmpfs /var/tmp tmpfs defaults,noatime,mode=1777 0 0
    tmpfs /var/log tmpfs defaults,noatime,mode=0755 0 0
    tmpfs /var/log/apt tmpfs defaults,noatime 0 0
    none /var/cache unionfs dirs=/tmp:/var/cache=ro 0 0

##Repos
    sudo gedit /etc/apt/sources.list
    deb http://download.skype.com/linux/repos/debian/ stable non-free
    deb http://ppa.launchpad.net/themono/ubuntu hardy main universe #SMPLAYER
    deb http://wine.budgetdedicated.com/apt hardy main

##Unlock Keyring
    gconf-editor (Uncheck)
    /apps/gnome-power-manager/lock/gnome_keyring_hibernate
    /apps/gnome-power-manager/lock/gnome_keyring_suspend

##public key is not available NO_PUBKEY 00000000000000
    sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 00000000000000

##Timed shutdown
    sudo shutdown -h 10:30

##Find Path
    sudo locate

##Gedit Cyrillic Encoding
    gconf-editor
apps -> gedit-2 -> preferences -> encodings -> auto_detected
add "WINDOWS-1251" after UTF-8

##Gedit Ftp Editing
    gconf-editor
apps -> gedit-2 -> preferences -> editor -> save ->writeble_vfs_schemes
add "ftp"

##Pidgin Normal Popup
    sudo apt-get install pidgin-libnotify
Then enable in Tools->Plugins

##VirtualBox Guest system won't resize
    Ctrl+G

##VirtualBox Add ssh and http connections to guest machine
    VBoxManage setextradata "guestname" "VBoxInternal/Devices/e1000/0/LUN#0/Config/ssh/HostPort" 2222
    VBoxManage setextradata "guestname" "VBoxInternal/Devices/e1000/0/LUN#0/Config/ssh/GuestPort" 22
    VBoxManage setextradata "guestname" "VBoxInternal/Devices/e1000/0/LUN#0/Config/ssh/Protocol" TCP

    VBoxManage setextradata "guestname" "VBoxInternal/Devices/e1000/0/LUN#0/Config/www/HostPort" 8080
    VBoxManage setextradata "guestname" "VBoxInternal/Devices/e1000/0/LUN#0/Config/www/GuestPort" 80
    VBoxManage setextradata "guestname" "VBoxInternal/Devices/e1000/0/LUN#0/Config/www/Protocol" TCP

##VirtualBox xp won't see shared folder
    net use x: \\vboxsvr\Local

##VirtualBox copy vdi
    VBoxManage clonevdi xp.vdi /media/archive/stuff/oracle.vdi

##Восстановить загрузчик GRUB
###Ubuntu restore grub
Например после установки Windows

Для Ubuntu 9.10+
    mount /dev/sdaX /mnt #X - партиция с установленным GRUB
    grub-install --root-directory=/mnt/ /dev/sda

Для Ubuntu <9.10
    sudo grub
    find /boot/grub/stage1
    root (hdX,Y)
    setup (hd0)
    quit
    sudo reboot
    gksu gedit /boot/grub/menu.lst
add windows by example in there

##Install AWN
    sudo gedit /etc/apt/sources.list
append:
deb http://ppa.launchpad.net/awn-testing/ubuntu hardy main
deb-src http://ppa.launchpad.net/awn-testing/ubuntu hardy main
    sudo apt-get install avant-window-navigator-trunk awn-extras-applets-trunk

##Nautilus do not show mounted volumes on desktop
    gconf-editor /apps/nautilus/desktop
uncheck "volumes visible"

##Loading withou splash
sudo gedit /boot/grub/menu.lst
remove "splash"

##Firefox 3 and Flash 10 no sound
ubuntu 8.04
    sudo apt-get install libflashsupport
ubuntu 9.04
    sudo apt-get install flashplugin-nonfree-extrasound

##Add swap
    cat /proc/sys/vm/swappiness #shows current swap
    swapon -s  #also shows current swap
    sudo gparted& #and create swap partition RAM*2
    sudo mount -a #mount all unmounted
    sudo swapon -a #make swap for all swaps
    sudo blkid /dev/sda6 #get swap UUID
or ls -l /dev/disk/by-uuid
    sudo gedit /etc/fstab
add UUID=XYZ none swap sw 0 0
    sudo gedit /etc/initramfs-tools/conf.d/resume #add UUID
    sudo update-initramfs -u
    sudo reboot

##Не спрашивать пароль после hibernate или resume
###Prompt password after hibernate-resume
Логично, при автологине
Убрать галочки
    gconf-editor /apps/gnome-power-manager/lock/hibernate

##Disconnect network on sleep
    /apps/gnome-power-manager/general/network_sleep

    Save/load gconf settings
    gconftool --dump /apps/panel > my-panel-settings.xml"
    and later >
    gconfool --load < my-panel-settings.xml

##Ubuntu samba wont see windows shares
    sudo gedit /etc/samba/smb.conf
Replace:
name resolve order = lmhosts host wins bcast
Whith:
name resolve order = lmhosts bcast wins host
    sudo /etc/init.d/samba restart
wait 5min


##cups wont working
(/usr/lib/cups/backend/cups-pdf failed)
    mkdir ~/PDF


##Vlc is "playing some media" - unable to suspend or hibernate
    kill -9 $(pidof vlc)
    gedit ~/.config/vlc/vlcrc
set "inhibit=0"

##Vlc external audio track
    vlc video.avi--input-slave audio.ac3
Audio->Audio Track->Track 2


##make disk image
    mount #select disk by /dev/*
    umount #selected disk
backup:
    sudo dd if=/dev/sdb1 of=~/my.img bs=1M
restore:
    sudo dd if=~/my.img of=/dev/sdb1 bs=1M

##NO_PUBKEY 123000
    sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 123000

##Криво отображаются .doc формулы в Openoffice
###Openoffice .doc formulas won't work
!tags:Софт,Openoffice
copy C:\Windows\Fonts into
    .openoffice.org/3/user/fonts


##Тормозит вся графика на Asus EEE 1000H
##Ubuntu on EEE 1000H or any with i945 graphics slow
Или на других ноутбуках с i945
!tags:EEE
    sudo gedit /etc/X11/xorg.conf
under the "Device" section add:
    Option "MigrationHeuristic" "greedy"

##notify-send 9.04
    sudo apt-get install libnotify-bin

##poweroff reboot hibernate shutdown without sudo
    sudo visudo
!Выполнять комманды poweroff reboot hibernate shutdown без пароля sudo
!Выполнять комманды poweroff reboot hibernate shutdown и любые другие без админских прав
Нужно, например чтобы запланировать [[Выключить компьютер через определенное время]]
    sudo visudo
 append, where _graf_ is username
    graf   ALL=(ALL) NOPASSWD:/usr/sbin/pm-hibernate,/usr/sbin/pm-suspend,/sbin/reboot,/sbin/halt,/sbin/shutdown,/sbin/poweroff

##poweroff after time
!Выключить компьютер через определенное время
    sudo -i
    sleep 21600 && poweroff
где 21600 время в секундах 
что-бы не вводить sudo -i, установите выключение без пароля [[Выполнять комманды poweroff reboot hibernate shutdown и любые другие без админских правг]]


##Записать все происходящее на экране в файл
###RECORD
    recordmydesktop -width 560 -height 340 && wmctrl -k on

##Изменить время для перехода жесткого диска в спящий режим
###Hard drive standby time:
!tags:Железо
    sudo hdparm -S 240 /dev/sda

##Open Office выглядит "Неродным"
###Open office looks not native
!tags:Софт
    sudo apt-get install openoffice.org-gtk

##Записать образ ISO на USB флешку с возможностью загрузиться
###Simply install from iso on usb
!tags:Софт
    sudo apt-get install unetbootin
Не забудьте перед этим отформатировать flash
    sudo mkfs.vfat /dev/sdb#
    unetbootin
!Или 9.10+
    usb-creator-gtk
[Подробннее][http://mirubuntu.ru/urok-2-zapis-obraza-na-disk-i-usb-nositel/]

##Отформатировать диск
###Format drive
Флешку, Флопик что-бы читались под Windows
    sudo mkfs.vfat /dev/sdb1

##Не работает принтер под Wine
###Wine programs use printer MS-word etc.
В программах Microsoft Word, Adobe Photoshop
Не сохраняет в pdf
!tags:Wine, Принтер
    sudo apt-get install cups-bsd
Печать в PDF из MS Office wine
    sudo apt-get install cups-bsd
    mkdir ~/PDF

##Не работает печать в PDF файлы
###PDF printer wont work
!tags:Принтер
    mkdir ~/PDF

##Настраиваить темы для KDE приложений без установки KDE
###Manage Kde Themes from gnome
!tags:Gnome,KDE
    kbuildsycoca4 & systemsettings

##Сообщения Skype через стандартную систему сообщений
###Skype libnotify (notify-osd notifications)
    [[http://thexnews.com/%D0%BA%D0%B0%D0%BA-%D0%BF%D1%80%D0%B0%D0%B2%D0%B8%D0%BB%D1%8C%D0%BD%D0%BE-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C-%D0%B2%D1%81%D0%BF%D0%BB%D1%8B%D0%B2%D0%B0%D1%8E%D1%89%D0%B8%D0%B5.html]]
    sudo apt-get install libnotify
Skype->Options->Notifications->Advanched View->Chat Message Recieved->Execute The Following Script
    notify-send "%sname" "%smessage" -i skype
(%type %sname %fname %fpath %smessage" %fsize %sskype - also supported)

##Какой софт устанавливать
###Ubuntu Soft
[[http://thexnews.com/%D1%81%D0%BE%D1%84%D1%82-%D0%B4%D0%BB%D1%8F-ubuntu-%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%8F-2.html|Софт для Ubuntu]]

##Клавиатура от Apple
###Apple Keyboard
[[http://thexnews.com/%D0%BA%D0%BB%D0%B0%D0%B2%D0%B8%D0%B0%D1%82%D1%83%D1%80%D0%B0-%D0%BE%D1%82-apple-%D0%B8-ubuntu-804.html|Клавиатура от Apple]]
    sudo gedit /etc/modprobe.d/hid_apple.conf
Append
    options hid_apple fnmode=0
then execute
    sudo update-initramfs -u
    reboot

##Установить DockBarX
###Install DockBarX
[[http://thexnews.com/док-удобная-замена-панели-задач.html|Подробнее о DockBarX]]
устанавливаем зависимости
    sudo apt-get install bzr python-gnome2-desktop python-numpy
скачиваем свежую версию
    mkdir -p ~/dockbarx && cd ~/dockbarx && bzr branch https://code.launchpad.net/~dockbar-main/dockbar/experimental && cd experimental
устанавливаем
    sudo cp dockbarx.py /usr/bin/ && sudo cp GNOME_DockBarXApplet.server /usr/lib/bonobo/servers/ && mkdir -p ~/.dockbarx && cp -R themes ~/.dockbarx/
!!!
Для XFCE устанавливаем поддержку Gnome Applets
    sudo apt-get install xfce4-xfapplet-plugin

##Установить uzbl
###Install uzbl
[[http://thexnews.com/uzbl.html|Подробнее о Uzbl]]
#
Добавляем репозитории WebKit в /etc/apt/sources.list
    deb http://ppa.launchpad.net/webkit-team/ppa/ubuntu intrepid main
    deb-src http://ppa.launchpad.net/webkit-team/ppa/ubuntu intrepid main
Устанавливаем зависимости и GIT:
    sudo apt-get update && sudo apt-get install git git-core libwebkit-dev
Скачиваем и компилируем свежую версию:
    git clone git://github.com/Dieterbe/uzbl.git
    cd uzbl
    make
    sudo make install
Копируем конфиги
    cp -r /usr/share/uzbl/examples/data/uzbl ~/.config
    cp /usr/share/uzbl/examples/config/uzbl/config ~/.config/uzbl/


##Изменять параметры загрузчика - список os.
###Grub 9.10
Как правило, комманда найде все сама
    sudo update-grub

    sudo gedit /etc/default/grub
    sudo update-grub
GRUB_DEFAULT номер оси загружаемой по дефолту

##тормозит Flash
###Flash lags
Решаем [[http://thexnews.com/flash-%d0%b2%d0%b8%d0%b4%d0%b5%d0%be-%d0%b2-ubuntu-%d0%b1%d0%b5%d0%b7-%d1%82%d0%be%d1%80%d0%bc%d0%be%d0%b7%d0%be%d0%b2.html|Тормоза Flash Видео]] (youtube,turbofilm...)
    sudo mkdir /etc/adobe
    sudo echo OverrideGPUValidation=true > /etc/adobe/mms.cfg

##Firefox 3 scroll middle button then up down
Скролл страницы как в MSword/авиосимуляторах. Ускорение зависит от расстояния между установленной средней кнопкой мыши до курсора.
    about:config
    general.autoScroll -> true

##Dolphin не замечает измениения файлов после hibernate/resume
###Dolphin won't update after hibernate-resume
    kdeinit4

##Забекапить MBR
###Backup Partition Table
Перед установкой, например винды, которая обожает сносить таблицу разделов.
    dd if=/dev/sdX of=/tmp/sda-mbr.bin bs=512 count=1
Восстановить
    dd if= sda-mbr.bin of=/dev/sdX bs=1 count=64 skip=446 seek=446

##Глюки при Hibernate-Resume
###Hibernate-Restore works vary bad
Например компьютер просыпается через раз, после Resume не работают и глючат проги, черный экран.

1.Попробуйте вынуть какую нибудь подозрительную железку. Например, USB-Bluetooth.
Если не поможет, отмонтироваить все флешки, кардридеры, камеры и проч. USB
В чем проблема поможет узнать gnome-system-log -> pm-suspend.log

2.Возможно проблема в том что 'испортился' swap. Требуется создать его заново.
    sudo swapon -s
запоминаем /dev/sdaX партиции со свапом
    blkid /dev/sdaX
или
    ls -l /dev/disk/by-uuid | grep sdaX
узнаем старый UUID
    sudo swapoff -a
    sudo /sbin/mkswap /dev/sdaX
запоминаем новый UUID
меняем старый UUID на новый в файлах:
    sudo gedit /etc/fstab
    sudo gedit /etc/initramfs-tools/conf.d/resume
обновляем init
    sudo swapon -a
    sudo update-initramfs -u

##Установить свежий DropBox
###Latest Dropbox
!tags:Soft
потому что в репозиториях, по традиции старая версия
если обновлять заранее установленный deb
    dropbox stop
    rm -r ~/.dropbox-dist/
устанавиливаем свежий DropBox
    cd ~
    wget http://www.getdropbox.com/download?plat=lnx.x86
    tar xzf dropbox-lnx.x86- ...

##Заставить процессор работать в полную силу
###Change Cpu Governor between performance powersave
На десктопах, когда потребление энергии не критично.
Что-бы процессор не скакал между сберегающей и полноценной цастотой.
    sudo chmod +s /usr/bin/cpufreq-selector
Добавьте в автозагрузку
    cpufreq-selector -g performance &
Комманды включающие другие режимы
    cpufreq-selector -g powersave &
    cpufreq-selector -g ondemand &

##Менять частоту процессора через апплет на панели
###Allow Gnome panle applet to change cpu freq
Полезно для ноутбуков
Добавьте на панель апплет "Cpu frequency scaling monitor"
По клику мыши на нем - меню с частотами и policy
Но работать не будет :). Что-бы заработало:
    sudo gedit /usr/share/polkit-1/actions/org.gnome.cpufreqselector.policy
замените
    <allow_active>auth_admin_keep</allow_active>
на
    <allow_active>yes</allow_active>

##Firefox narod.disk without CAPTCHA
!tags:Firefox,Soft
    about:config
append
    YB/3.5.1
e.g
    Firefox/3.6 YB/3.5.1

##Конвертировать pdf и png
###Convert pdf to png
!tags:Multimedia
Постранично PDF->PNG
    sudo apt-get install imagemagick
    convert infile.pdf outfile.png
С нормальным (читаемым) разрешением
    convert -density 200 infile.pdf outfile.png
#
Конвертировать несколько png в один pdf PNG->PDF
    convert 1.png 2.png 3.png outfile.pdf
или
    convert *.png outfile.pdf

Обрезая A4 в A6 (Чисто мой локальный случай :)
    convert -density 200 -crop 840x1160+400+480 book.pdf outfile.png

##Очистить немного места на жестком диске
###Free some disk space
    sudo aptitude autoclean
    sudo apt-get autoremove
    sudo apt-get clean


В экстренных случаях, когда например "not enough free disk space" можно подвинуть на другой диск какую-нибудь тяжелую папку.
С помощью [[Найти папки которые занимают много места]]
    baobab
Находим папку (/usr/src) которая занимает много места в /
И двигаем ее на другой жесткий диск (/media/archive/):
    sudo mv /usr/src /media/archive/
Делаем симлинк, что-бы все работало
    sudo ln -s /media/archive/src /usr/

Еще пример:
    sudo mv /var/cache /media/archive/space/
    sudo ln -s /media/archive/space/cache /var/

##Изменить раскладку клавиатуры
###Keyboard layout
!tags:Консоль
Из консоли, без control-center
    setxkbmap ru
Например
(Английский/Русский, переключается по Alt+Shift, Без Caps Lock, Перезагрузка иксов по Alt+Ctrl+Backspace)
    setxkbmap -layout 'en,ru' -option 'grp:alt_shift_toggle' -option 'terminate:ctrl_alt_bksp' -option 'ctrl:nocaps'

##Не запускатся пока не проверены диски
###Do not start GDM untill disks are checked
Есть у Ubuntu мерзкая привычка, во время загрузки, вместо того что-бы ждать проверки диска, запускается графичесткая оболочка, но с отмонированными дисками (Проверка идет в background).
Поскольку в этих случаях все равно система не юзабельна, это можно отключить.
    sudo gedit /etc/init/gdm.conf
Замените
    start on (filesystem and ...
На
    start on (stopped mountall EXIT_STATUS=0 and ...

##Зависло-глючит приложение в wine
###Wine reboot
!tags:wine,Soft
Например, программа пишет что уже запущена и.т.д.
Симулируем перезагрузку
    wineboot -e

##Найти папки которые занимают много места
###Disk usage analizer
    baobab

##Драйвера для eee pc
###Eee Pc Drivers
Что-бы экономить батарейку
переключать проц в сберегающий режим [[Менять частоту процессора через апплет на панели]]
Работали Хоткеи
Проверено на 1000h
[[http://www.statux.org/content?page=catalog&catagory=1&product=eeepc-acpi|Драйвера для Asus EEE]]


##Bash - Unrecognized character
Возникает файл с нереальным названием. Попытки rename cat mv приводят к
Unrecognized character \xE4 in column 9 at (eval 1) line 1.
Такое бывает когда программу пишут тупые криворукие дибилы (см. skype)
    pcmanfm
только pcmanfm умеет правильно копировать такие файлы

##Установить Wireshark
###Wireshark
Interface list пуст, интерфейсы тупо не отображаются
Можно конечно запускать с sudo, но это не есть верно
Что-бы запускать Wireshark без админских прав:
    sudo apt-get install wireshark libcap2-bin
    sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap

##Some random network commands
!tags:Сеть
    route add default gw 192.168.0.1 eth0
DNS dhcpcd eth0
    edit /etc/resolv.conf
domain localdomain
nameserver 208.67.222.222
nameserver 208.67.220.220


    ssh-keygen -t dsa
[[Putty (s60) don't wont to connect with Private key]]
    chmod 600 ~/key
    ssh-add ~/key
    ssh root@95.68.86.15 -p 2222


##Возможность подключаться по SSH
###Allow to connect via SSS
!tags:Сеть
    sudo apt-get install openssh-server
Обязательно нужно сменить порт:
    sudo gedit /etc/ssh/sshd_config
    sudo /etc/init.d/ssh reload

C ключами
    ssh-keygen -t dsa
    cat key.pub >> ~/.ssh/authorized_keys
    puttygen key -o key.ppk
    sudo gedit /etc/ssh/sshd_config
PasswordAuthentication no
    sudo /etc/init.d/ssh reload

##Тормозит воспроизведение видео
###Video lags
Может тормозить воспроизведение HD фильмов в mkv mp4
Еще один способ, запустить плеер с приоритетом повыше
    nice -n 19 mplayer /путь_к/фильму.mkv

##Подмонтировать диски ext2/ext3 под Windows 7
###Windows 7 ext2/ext3 drivers
Установить [[http://www.ext2fsd.com/|Ext2Fsd]].
C:\Program Files\Ext2Fsd\Ext2Mgr.exe второй кнопкой мыша -> "Run as Administrator"

##Запретить обновление пакета
###Restrict update of package
Новое не всегда лучшее :)
Бывают ситуации, когда правильнее остаться на стабильной версии программы, а не обновляться.
А некоторые пакеты обновляются слишком часто
Что-бы автообновления sudo apt-get upgrade не затрагивали конкретный пакет
    sudo aptitude hold <имяпакета>
    sudo -s
    echo <имяпакета> hold | dpkg --set-selections
Что-бы разрешить обновления, для данного пакета
    sudo aptitude unhold <имяпакета>
    sudo -s
    echo <имяпакета> install | dpkg --set-selections
##Putty (s60) don't wont to connect with Private key
!tags:Сеть
Когда вы хотите зайти на сервер с не Linux, приходится испльзовать Putty для Nokia или Windows
Однако указав свой ключ, получаете:
"no supported authentication methods available"
Надо прегнать ключ в формат Putty
    sudo apt-get install putty-tools
    puttygen key2 -o mykey.ppk
Где key2 - нормальный ключ, сгенерированный, например, ssh-keygen -t dsa
Полученный ключ mykey.ppk можно указывать в putty на Win или Nokia

Получить ключ  в нормальном (OpenSSH) формате из putty ppk:
    puttygen -O private-openssh Evil2.ppk -o Evil2


##Альтернативная прошивка dd-wrt на рутере тормозит
###dd-wrt wireless slow down
!tags:Сеть,Hardware
скорость 10Mbit/s (1MB-1.2MB/s) когда с дефолтной прошивкой было 16mbit/s (2MB/s)
Попробоваить поставить
    Wireless->Advanched Settings->TX Power
Например у меня появились мои законные 2Mb, когда поствил 20mW вместо 71mW
На Asus WL-520GC. Все работает отлично, и ssh, и прокси через ssh.

##Eee 1000h touchpad dont work touchpad
down work two-finger middle-click three-finger left-click

    sudo modprobe -r psmouse
    sudo modprobe psmouse proto=imps
permanent fix
    echo "options psmouse proto=imps" |sudo tee -a /etc/modprobe.d/psmouse
Later, when this bug is fixed, you can try to remove the /etc/modprobe.d/psmouse


##Неделя начиналась с понедельника
###Set week start on monday
И при этом локаль оставалась английской
    sudo gedit /usr/share/i18n/locales/en_US
Заменить 1 на 2 в строке
first_weekday  1
    sudo locale-gen
logout/login

##Opera отключить меню по ALT
###Opera disable ALT popup menu
Если у вас скрыта строка меню, то при переключении раскладки по Alt+Shift, будет выскакивать меню opera, что дико раздражает
Так мерзко бывает ведут себя и другие проги.

Фикс простой - надо просто добавить перехватчик на событие Alt+Shift в Userspace
(xorg все равно захватит нажатие, т.к. его обработчик первый)
просто и понятно правда?

можно например добиться этого добавив openbox (rc.xml секция <keyboard>) пустой shortcut
    <keybind key="A-0x32"><action name="Execute"></action></keybind>
или назначить Alt+Shift как хоткей в другом WM

##Подключить внешнюю аудиодорожку к фильму
###Video play external audio track
(SMPlayer/MPlayer звук бывает рассинхронизирован)
    vlc movie.avi --input-slave sound.ac3

Alternatively in the Qt4 (normal) interface go to:
Media >> Advanced Open File...

Select you video file. Tick "Show more options" then "Play another media synchronously..." and select the *.ac3 file.

Then when playing the video go to "Audio >> Audio Track >> Track 2" to select the second (or whichever it is) audio track.

##Gnome показывать иконки в контекстных меню
###Firefox icons in menus
Например в контекстных меню Firefox или Terminator. Очень удобно, когда в меню рядом со строкой Copy есть еще и соответсвующая иконка. Быстрее находится нужный пункт меню.
Что-бы включить надо поставить птичку:
    gconf-editor /desktop/gnome/interface/menus_have_icons
или
    gconftool -s /desktop/gnome/interface/menus_have_icons -t bool true


Также можно заодно включить иконки и на кнопках. Например красный крестик рядом на Cancel и галочка на ОК.
    gconftool -s /desktop/gnome/interface/buttons_have_icons -t bool true

##Полезные ссылки
###Useful Links
!tags:Оффтоп
То что мне может пригодиться
[[http://wobzip.org/|Online Раззиповщик]]
[[http://www.online-convert.com/|Online конвертер в разные форматы]]
[[http://pixlr.com|Online Photoshop]]
[[http://www.virustotal.com/|Online Антивирус]]
[[http://www.utils.trigger.ee/smssend.phtml?countlang=LV-RU&popup=1|Теле 2 отправить СМС]]

##Включить поддержку Wake on Lan
###Enable Wake On Lan
!tags:Сеть
[[http://en.wikipedia.org/wiki/Wake_on_lan|Wake On Lan]] полезная функция которая позволяет удаленно включить компьютер.
Держать комп включенным бывает невыгодно из за энергопотребения. А вот если возникла необходимость экстренно зайти по SSH то WOL спасает.
Также Wake On Lan порадует ленивых людей.

Можно включать компьютер например с [[http://handheld.softpedia.com/get/System-Utilities/Communications/JWakeME-5759.shtml|мобильника]]

Включить поддержку Wake on Lan для Ubuntu:
    sudo apt-get install ethtool
    cd /etc/init.d/
    sudo gedit wakeonlanconfig
Copypaste следующий текст
 #!/bin/bash
ethtool -s eth0 wol g
exit
    sudo chmod a+x wakeonlanconfig
    sudo update-rc.d -f wakeonlanconfig defaults
Проверка (ничего не выводиться - все ок)
    sudo /etc/init.d/wakeonlanconfig
Осталось включить поддержку Wake On Lan в BIOS и на рутере форварднуть какой-нибудь секретный порт на UDP 192.168.0.255:9 (broadcast:9)


WOL работает по MAC адресу!

##Не гасить экран спрашивая пароли
###do not dim screen when pronting password
То что раздражает в этих виндах - спрашивать пароль обычным окошком, не блокируя экран
gnome-control-center -> Assistive technologies -> password dialogs as normal windows


##Играть в игры sega megadrive-deramcast
###Play sega megadrive-deramcast games
    [[http://segaretro.org/Gens/GS#Download]]

##Откатиться на предыдущую версию пакета
###Fallback to previous version of package
!tags:Софт,Важно
Иногда обновление все портит. Можно вернуться на предыдущую версию пакета.
Пример - замените dockbarx на нужный пакет
Удаляем со всеми потрохами:
    sudo apt-get purge dockbarx
Смотрим доступные старые версии из кеша:
    ls /var/cache/apt/archives/ | grep dockbarx
Устанавливаем предыдущую версию
    sudo gdebi /var/cache/apt/archives/dockbarx_0.39.4-0~ppa1_all.deb
Что-бы остаться на старой версии смотрите так-же [[Запретить обновление пакета]]


##переконвертировать много ppt в pdf
###batch convert ppt to pdf
    [[http://www.arunviswanathan.com/node/59]]

##переконвертировать wmv в avi
###convert wmv to avi
как правило в интернетах ходит другая комманда для конвертации wmv в avi, с покореженным звуком.
правильно делать так:
    mencoder Ready_To_Go.wmv -ofps 23.976 -ovc lavc -oac mp3lame -o outfile.avi
конвертируя разрешение на 640x480

    mencoder Ready_To_Go.wmv -ofps 23.976 -ovc lavc -oac mp3lame -vf scale=640:480 -o outfile.avi

##gnome set normal button layout
    gconftool-2 --set "/apps/metacity/general/button_layout" --type string ":minimize,maximize,close"

##Не открывать nautilus каждый раз при новом устройстве
###gnome disable automount volumes
До Ubuntu 12.04
    gconf-editor /apps/nautilus/preferences/media_automount_open
После Ubuntu 12.04
    gsettings set org.gnome.desktop.media-handling automount false

##Gnome normal show desktop
Нормально показывать рабочий стол, а не тоглить туда обратно
    wmctrl -k on

##10.10 не работает hibernate suspend обновить ядро
###10.10 hibernate suspend dont work update kernel
необходимо обновить ядро
add to sources
    deb http://archive.ubuntu.com/ubuntu/ maverick-proposed restricted main multiverse

    sudo apt-get -t maverick install linux-image-2.6.35-23-generic* linux-headers-2.6.35-23

##Gnome dont mount volumes on startup
    gconf-editor /apps/nautilus/preferences/media_automount
    gconf-editor /apps/nautilus/preferences/media_automount_open

##Wine set font smoothing
    wget http://www.kegel.com/wine/winetricks
    chmod +x winetricks
    ./winetricks fontsmooth-rgb

##не работают какие либо кнопки на клавиатуре
###keyboard buttons dont working
например left-right стрелки
проверьте не установлены они гденибудь как хоткеи
например xfce, vlc, compiz и.т.д.

##Установить нормальный словарь без интернета
###Intstall offline dictionary
    sudo apt-get inslall goldendict

<a href="http://www.babylon.com/free-dictionaries/languages/">Словари для него</a>
<a href="http://www.babylon.com/free-dictionaries/languages/Babylon-Russian-English/1272.html">Русско-Английский</a>
<a href="http://www.babylon.com/free-dictionaries/languages/Babylon-English-Russian/922.html">Англо-Русский</a>
<a href="http://www.babylon.com/free-dictionaries/reference/dictionaries-thesauri/Russian-Latvian-Dictionary/48850.html">Русско-Латышский Russian-Latvian</a>
<a href="http://www.babylon.com/free-dictionaries/reference/dictionaries-thesauri/Latvian-Russian-Dictionary/48851.html">Латышско-Русский Latvian-Russian</a>


##Remove unused kernels
    sudo -i
    dpkg -l linux-image-* | grep ii | grep -v [a-z]-generic | grep -v `uname -r` | awk '{ print $2 }' | xargs apt-get -y purge
    update-grub

##Просыпаться из suspend c клавиатры
###Resume from suspend keyboard
    sudo -i

смотрим на каком USB у нас клавиатура. Например Bus 002 Device 004: ID 05ac:1006 Apple, Inc. Hub in Aluminum Keyboard (т.е. USB4):
    lsusb 


смотрим  с чего можно делать resume:
    cat /proc/acpi/wakeup


включаем USB4 (usb - клавиатуру из примера выше):
    echo USB4 > /proc/acpi/wakeup


или включаем PS2 клавиатуру:
    echo PS2K > /proc/acpi/wakeup


после тестов добавляем комманды в
    sudo gedit /etc/rc.local


##Virtual Box RDP

Начиная с 4.0 версии надо установить Oracle VM VirtualBox Extension Pack http://www.virtualbox.org/wiki/Downloads
    https://help.ubuntu.com/community/VirtualBox/RDP
если не работает external File->Prefences Library->Reset

##Не работает микрофон в скайпе
###Skype no microphone sound
как правило на ноутбуках
    sudo apt-get install pavucontrol
    pavucontrol
Input Devices -> All Input Devices
Поэкспеременитровать с Mute и заглушением Left или Right rfyfkjd

##Показывать температуру жестких дисков, процесоров, виделкарты
###HDD, Processor, Video temperature
    sudo -i
    echo coretemp >> /etc/modules
    apt-get install sensors-applet
    sensors-detect
 Y, Y,Y на все кроме последнего
После добавать апплет на панель gnome

##Перезагрузиться в выбранную систему
###Reboot in selected os
Edit /etc/default/grub:
    sudo gedit /etc/default/grub
and modify the "GRUB_DEFAULT=0" value (it should be on line 4) from "0" to "saved" (without the quotes) so that it looks like this:

    GRUB_DEFAULT=saved
    sudo update-grub
Now to reboot Ubuntu in Windows or some other OS, run the following command:
    sudo grub-reboot X

http://www.webupd8.org/2010/10/how-to-reboot-in-windows-from-ubuntu.html

##Скачать весь сайт wget
###Download site with wget
Наприпер чтобы сконвертить его в формат .mobi программой calibre, и читать на Kindle
    wget --mirror -p --convert-links -P ./LOCAL-DIR http://site

##Quake 2 wine вылетает под водой, или при установке openGL
###Quake 2 wine underwater - openGL
Проблема в несовместимости Quake 2 и новых драйверов Nvidia/ATI
(Квейк 2 крашиться при установке openGL даже в Windows, так что wine эмулирует баги правильно :)
Установите неоффициальный патч 3.23 quake2-3.23-win32.zip:
    http://www.bfeared.com/library/quake/archive/quakedev/kmquake2/index_files/downloads.htm

##Просто подмонтировать USB
###Simple mount USB flash
Одной коммандой. Т.е. не создавая папки, указывая тип файловой системы и.т.д. как при mount/umount.
В Ubuntu 12.04+
    udisks --mount /dev/sdb
    udisks --unmount /dev/sdb

До Ubuntu 12.04+
    exo-mount --device /dev/sdb
Будет подмонтирована в /media/USB_LABEL
При проблемах с русскими буквами - [[Установить кодировку utf8 для exo-mount ]]

Еще вариант
    exo-mount --hal-udi /org/freedesktop/Hal/devices/storage_serial_SanDisk_Sansa_Clip_8GB_8F08F5116140B6A80000000000000000_0_0
где /org/freedesktop/Hal/devices/storage_serial_SanDisk_Sansa_Clip_8GB_8F08F5116140B6A80000000000000000_0_0 достается grep'ом из 
    lshal

##Настроить  тачпад (жесты)
###Configure touchpad (gestures)
Убедиться что драйвер тачпада загружен:
    grep 'ouchpad' /proc/bus/input/devices
    synclient -l

Добавить в автозагрузку
        synclient VertEdgeScroll=0 & # выключть скролл по правому краю тачпада
        synclient TapButton1=1 &     # включить клик левой кнопкой мыши одним пальцем по тачпаду
        synclient TapButton2=2 &     # включить клик средней (колесико) кнопкой мыши двумя по тачпаду  
        synclient TapButton3=3 &	 # включить клик правой кнопкой мыши тремя пальцами по тачпаду
        synclient HorizTwoFingerScroll=1 & # включить прокручивание (скролл) двумя пальцами
        synclient CircularScrolling=1 & # включить прокручивание (скролл) водя пальцами по кругу (apple ipod very patent protected style)


##Скачать deb's
###Download debs
Не через apt, а файлом
    http://pkgs.org

##Установить кодировку utf8 для exo-mount 
###exo-mount set encoding
Русские буквы отображаются как кракозябры при монтировниии флешки usb xfce
gedit ~/.config/xfce4/mount.rc
    [vfat]
    uid=<auto>
    shortname=winnt
    iocharset=utf8
    codepage=866
    flush=true
    longnames=true
    [iso9660]
    uid=<auto>
    [udf]
    uid=<auto>
    iocharset=<auto>
    [ntfs]
    uid=<auto>
    [ntfs-3g]
    uid=<auto>
    umask=0077

via [[http://www.ylsoftware.com/news/586|http://www.ylsoftware.com/news/586]]

##Сконвертировать видео для просмотра на слабых устройствах
###Convert videos to lower quality to play weak devices
или как испортить видео, чтобы оно шло на тормознутых девайсах типа нетбуков и телефонах

    mencoder input.avi -o output.avi -ovc lavc -oac mp3lame -vf scale=480:-3 -lavcopts vcodec=mpeg4 

скрипт для всей папки
    #!/bin/bash
    INPUT=/home/graf/videos/metal/*
    OUTPUT=/home/graf/videos/mitol/
    for f in $INPUT
    do	mencoder $f -o "$OUTPUT$(basename "$f")" -ovc lavc -oac mp3lame -vf 	scale=480:-3 -lavcopts vcodec=mpeg4 
    done 

##Подконектиться по remote desktop к windows
###Connect rdp to windows machine
    rdesktop -z -a 8 123.123.123.123:3389
где
-z использовать сжатие  
-a 8 количество чветов
123.123.123.123 ip
3389 порт

##Синхронизироваться по ftp
###Ftp sync
Создайте скрипт:
    #!/bin/bash    
    HOST="thexnews.com"
    USER="dima2"
    PASS="#$OAShed6%334"
    LCD="/home/graf/projects/web/blog"
    RCD="/www/blog"
    lftp -c "set ftp:list-options -a;
    set ftp:ssl-allow off
    open ftp://$USER:$PASS@$HOST; 
    lcd $LCD;
    cd $RCD;
    mirror --reverse \
           --only-newer
           --delete \
           --verbose \"

Где:
LCD - папка на локальном компьютере
RCD - папка на ftp

Если lftp зависает на Making data connection - добавьте параметр
    set ftp:ssl-allow off

##Не работает поиск в Dolphin
###Dolphin search don't work
Пишет что-то вроде "Invalid protocol"
    sudo apt-get install kde-baseapps

##Не работает flash в firefox
###Dont work flash in firefox 
12.04 x86 x64
Установите
    https://addons.mozilla.org/en-US/firefox/addon/flash-aid/
Firefox->Tools->Flash Aid->Wizard mode

##OpenWRT изменить mac адрес сетевой карты
###OpenWRT change wlan mac adress
http://192.168.1.1/
Справа сверху кликнуть Administration
Network->Interfaces->Wlan
wan->кнопка edit
В поле -- Additional Field -- выбрать MAC-Address
Кнопка [Add]

Альтернативный метод
    uci set network.wan.macaddr="<mac_address>"
    uci commit network
    ifdown wan && ifup wan

##OpenWRT подключться по sftp и редактировать файлы через графический редактор
###OpenWRT connect router sftp edit files with graphic
    ssh root@192.168.1.1
    opkg update
    opkg install openssh-sftp-server
Теперь открываем файловый менеджер например krusader или nautilus
Коннектимся к:
    sftp://root@192.168.1.1

Для начала можно изменить ssh приветствие (например на [что-то такое](http://www.reddit.com/r/funny/comments/1gv75n/what_i_thought_hacking_was_when_i_was_young/caoes6z) :) ) Папка `sftp://root@192.168.1.1/etc/` файл `banner`.



##Ubuntu 12.04 вылетает в Login Screen
###Ubuntu 12.04 randomly crashes login screen
При этом в логах Gdk-WARNING: gnome-session: Fatal IO error 11 (Resource temporarily unavailable) on X server"
Например при работе с Sublime Text 2
Случается на nvidia + 64 битной версии
Скачайте старый драйвер
https://launchpad.net/ubuntu/precise/amd64/nvidia-current/290.10-0ubuntu2
Запретите обновление пакета nvidia-current [[Запретить обновление пакета]]

##Ubuntu 12.04 выключать компьютер без меню при нажатии на кнопку питания
###Ubuntu 12.04 shutdown poweroff on power button press without promt
Вместо текста "Do you really really want to shutdown?"
    sudo gedit /etc/acpi/powerbtn.sh
вставляем текст
/usr/sbin/pm-suspend
или
/sbin/shutdown -h now "Power button pressed"

##Firefox Вкладки приложений (App Tabs) пропадают после перезапуска
###Firefox App Tabs dissapearing after restart
Происходит это из за того что настройки App Tabs храняться в настройках сессии. Если у вас стоит Tools > Options > Privacy -> Clear History When Browser Closes -> Browsing History то и App Tabs будут очищаться.
 * Можно либо убрать птичку Browsing History (что несекьюрно)
 * Либо бекапить файл sessionstore.js (что излишне)
 * Либо просто установить плагин [App Tab Initializer][https://addons.mozilla.org/en-US/firefox/addon/app-tab-initializer] Зайти на `about:plugins` -> App Tab Initializer -> Prefences -> Grab current app tabs. Так вкладки приложений будут открываться в независимости от настроек Security.


##Sieve скрипт что-бы посылать уведомление о полученом сообщении
###Sieve script to forward email notification
Решение для [fastmail.fm][http://thexnews.com/p/1153]
#
Settings->Advanched Settings->Account->Define Rules->Forward
В новой строчке заполняем:
+ Message with
    Advanched
+ The text (список эмейлов, для которых не нужно посылать уведомление)
    not header :contains "from" ["notifications@disqus.net","action@ifttt.com"]
+ Forward to (где mail@domain.com - адрес на который посылаються уведомления)
    notify :method "mailto" :options ["mail@domain.com","From","Orig"] :message "$from$ / $subject$"
+ Forward type
    Custom
 Нажимаем [Save changes]
 Нажимаем линк [View filter source, click "Apply all changes" to save changes first (advanced users only)]
 Нажимаем [Apply all changes]
 Появиться надпись "No changes made, keeping generated script." Чтобы зааплаить изменения Идем в Settings->Rules добавляем любое правило в Forward нажимаем Save changes. Теперь это правило можно удалить.


##Usage of git
Скачать проект:
    git clone https://github.com/user/repo
    cd repo
Обновить проект:
    git pull
Волшебная комманда которая запушит все изменения (включая удаленные файлы) из текущей папки в репозиторий: 
    git add * && git commit -a -m 'commit message' && git push origin master

##Autocomplete don't work over shh
запустите bash
    bash

##Установка Seafile

Если усатовка ругается на 
    ccnet-init: No such file or directory
Настойте setup-seafile.sh [версию 1.4.5](http://seafile.googlecode.com/files/seafile-server_1.4.5_x86-64.tar.gz  ) как сказано в [инструкции](https://github.com/haiwen/seafile/wiki/Download-and-setup-seafile-server).
Это создаст необходимые конфигурационные файлы
Потом просто скачайте свежую версию, распакуйте ее в папку рядом с 1.4.5. Новая версия подхватит конфиги 1.4.5 (которые лежат на директорию выше папки в которой есть seafile.sh). 

 
##Webdav
 http://linuxsagas.wordpress.com/2008/09/09/webdav-and-fstab/

##GUI для автозапуска программ
gnome-session-properties


##Firefox иероглифы когда копируешь url

Например

    http://thexnews.com/%D1%82%D1%80%D0%B8-%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%B0-%D1%83%D1%81%D0%BA%D0%BE%D1%80%D0%B8%D1%82%D1%8C-%D0%B7%D0%B0%D0%B3%D1%80%D1%83%D0%B7%D0%BA%D1%83-%D0%B2%D0%B0%D1%88%D0%B5%D0%B3%D0%BE-%D1%81%D0%B0%D0%B9%D1%82%D0%B0.html

Вместо

    http://thexnews.com/три-способа-ускорить-загрузку-вашего-сайта.htmla


about:config
network.standard-url.escape-utf8
Установить false


##Время загрузки страницы
wget -O /dev/null http://thexnews.com/do-not-eat.html 2>&1 | grep '\([0-9.]\+ [KM]B/s\)'

##Жесткий дист
palimpsest

##Копировать установку ubuntu с HDD на SSD
http://frugaltech.happystoic.com/ssdlinux

##Настроить ubuntu оптимально для ssd
https://sites.google.com/site/easylinuxtipsproject/ssd#TOC-Avoid-quick-wear:-reduce-write-actions

##Обновить Intel SSD
###Update Intel SSD firmware without CD-ROM
Обновить прошивку Intel SSD без CD-ROM, c помощью USB флешки. Потому что, серьезно, ну кто сейчас пользуется устаревшими, ненадежными и тормознутыми CD-ROM дисками? Что за издевательство предлагать этот способ как единственный путь обновления прошивки? как Может быть еще дискету подсунуть?

Слава богу, есть современная альтернатива:

* Скачать свежую версию .iso с [сайта Intel](http://www.intel.com/go/ssdfirmware/)
* Установить и запустить в терминале
  unetbootin
* Distribution -> Select Distribution -> FreeDos
* Установить FreeDos на флешку
* Скопировать iSSDFUT.exe из .iso с [сайта Intel](http://www.intel.com/go/ssdfirmware/) в корень флешки
* Перезагрузиться с флешки в `FreeDOS Safe Mode`
* Запустить c:\iSSDFUT.exe
* Следовать инструкциям

##Перезагрузить X
  sudo restart lightdm

##Установить несколько iso на одну флешку
Например я всегда ношу с собой 8гиговую флешку с Hiren Boot CD, Backtrack Linux, Ubuntu 32bit, Ubuntu 64bit
http://www.pendrivelinux.com/multiboot-create-a-multiboot-usb-from-linux/

##Перезапустить сессию
###Restart session
Одно из преимуществ Linux над Windows - это отсутствие необходимости перегружать компьютер после каждого чиха. Даже если какаянибудь программа зависнет намертво или загадит всю память, вместо перезагрузки компьютера, достаточно выполнить гораздо более быструю:
    killall gnome-session
Что закроет все запущенные программы текущего юзера, и вернет вас к login screen

##Флещ плагин постоянно падает
###Flash plugin craches all the time in Firefox
То есть какое то время работает. А потом падает с "Adobe Flash plugin has crashed/ Send Crash Report".Обычно такое бывает после переустановки ядра/драйверов видеокарты
Чтобы починить:
    sudo gedit /etc/adobe/mms.cfg
Установить:
    OverrideGPUValidation=true
    EnableLinuxHWVideoDecode=0

##Помотреть пакеты которые отсылает устройство
Если вы как я страдаете паранойей, то можно легко довести её до панически клинической фазы. Для этого возьмите любой современный гаджет, и установите на свой рутер [OpenWRT](http://openwrt.org) (или любую другую прошивку позволяющую shell access). После чего зайдите на рутер по ssh и запустите:
    sudo tcpdump -A -i any ether host 00:00:00:00:00:00
где `00:00:00:00:00:00` mac адрес вашего гаджета. Вместо `any` можно написать ваш сетевой интерфейс (узнается в `ifconfig`) что-бы съекономить ресурсы.

Теперь вы в реальном времени можете наблюдать куда, и с какой скоростью сливаются ваши бывшие персональными данные.

Также можно записать полные пакеты в файл чтобы потом [скачать](http://thexnews.com/ubuntu/OpenWRT%20подключться%20по%20sftp%20и%20редактировать%20файлы%20через%20графический%20редактор.html) и проанализировать в программе wireshark. (Внимание файл может быть очень большим, так что лучше писать его на флешку)

    sudo tcpdump -i any ether host 00:00:00:00:00:00 -w file.dump

##pianobar блокирует звук для других приложений
При включенном pianobar, в других программах, (например vlc, gzdoom, flash player) нет звука.
    gedit ~/.libao
Вставить текст
    driver=pulse
    dev=default
Если не помогает
    driver=alsa
    dev=default

##Хоткеи не работают в полноэкранных играх
###Hotkeys and shortcuts don't work in full screen mode
Например сделать так чтобы работали медиа (кнопки громкости и управления плеером с клавиатуры) в gzdoom.
    sudo apt-get install esekeyd 
    sudo gedit /etc/esekeyd.conf
Вставте текст:
    VOLUMEUP:pactl -- set-sink-volume 0 "+2%" &
    VOLUMEDOWN:pactl -- set-sink-volume 0 "-2%" &
    MUTE:amixer set Master toggle &
Редактируйте:    
    sudo gedit /etc/default/esekeyd
Установите `START_ESEKEYD=true` and `DAEMON_OPTS="/etc/esekeyd.conf /dev/input/event4"`
Теперь можно запустить коммандой:
    sudo /etc/init.d/esekeyd start
Результат `[fail]` в данном случае - норма :). Альтернативная комманда запуска:
    sudo esekeyd /etc/esekeyd.conf /dev/input/event4
    
Если работать не будет, запустите:
    sudo keytest /dev/input/event4
После нажатия нужных кнопок, должен выводиться их код. Если этого не происходит, поменяйте `event4` на другой, например `event4`. После чего также измените `event3` на работающий в `/etc/default/esekeyd`.


