#!/urs/bin/zsh
url='https://docs.docker.com/desktop/release-notes/'

var=`curl $url | xmllint --html --xpath '//a/@href' -  2> /dev/null | grep 'zst' | head -1 `

url_download=$(echo $var | sed 's/href="//g' - | sed 's/"//g' -)

wget $url_download -O /tmp/docker-desktop.pkg.tar.zst

sudo pacman -U /tmp/docker-desktop.pkg.tar.zst --noconfirm

unlink /tmp/docker-desktop.pkg.tar.zst
