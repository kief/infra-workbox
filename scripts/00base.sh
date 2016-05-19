set -ux

apk update && apk upgrade

source /etc/os-release

cat << EOF > /etc/motd

$NAME $VERSION_ID Infrastructure Workbox

Built for use with Vagrant using:
   <https://github.com/kief/infra-workbox>

See the Alpine Wiki for how-to guides and
general information about administrating 
Alpine systems and development.
See <http://wiki.alpinelinux.org>

EOF


