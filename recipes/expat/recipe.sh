VERSION=2.2.1
TAR=http://downloads.sourceforge.net/project/expat/expat/$VERSION/expat-$VERSION.tar.bz2

HOST=x86_64-elf-redox

function recipe_version {
    echo "$VERSION"
    skip=1
}

function recipe_update {
    echo "skipping update"
    skip=1
}

function recipe_build {
    ./configure --host=${HOST} --prefix=/
    make -j"$(nproc)"
    skip=1
}

function recipe_test {
    echo "skipping test"
    skip=1
}

function recipe_clean {
    make clean
    skip=1
}

function recipe_stage {
    dest="$(realpath $1)"
    make DESTDIR="$dest" install
    rm -rf "$1"/{lib/pkgconfig,share}
    skip=1
}
