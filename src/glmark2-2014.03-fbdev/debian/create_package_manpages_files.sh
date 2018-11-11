#!/bin/sh

set -e

create_manpages_file()
{
    local binary=$1

    echo "debian/tmp/usr/share/man/man1/${binary}.1" > debian/${binary}.manpages
}

get_variant_binaries()
{
    grep 'Package:' debian/control | sed -e '/glmark2-data/d' -e 's/Package: //'
}

for binary in $(get_variant_binaries);
do
    create_manpages_file $binary
done
