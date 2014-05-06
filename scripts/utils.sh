function apt-install {
    for pkg in $@; do
        echo "Installing package $pkg..."
        apt-get install -yq $pkg
    done
}
