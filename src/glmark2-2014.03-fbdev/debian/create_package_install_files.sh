#!/bin/sh

set -e

create_install_file()
{
    local binary=$1

    echo "usr/bin/$binary" > debian/${binary}.install
}

get_variant_binaries()
{
    grep 'Package:' debian/control | sed -e '/glmark2-data/d' -e 's/Package: //'
}

for binary in $(get_variant_binaries);
do
    create_install_file $binary
done
