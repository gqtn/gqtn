#!/bin/bash

# Script to install `asdf`
# According to https://asdf-vm.com/guide/getting-started.html

preparing(){
	if [ ! -d "$HOME/.bin" ]; then
		mkdir $HOME/.bin
	fi

	if ! grep -q '$HOME/.bin' "$HOME/.bashrc"; then
		echo 'export PATH=$PATH:$HOME/.bin' >> $HOME/.bashrc || return 1
	fi

	if ! grep -q '$HOME/.asdf' "$HOME/.bashrc"; then
		echo 'export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"' >> $HOME/.bashrc || return 1
	fi

	return 0
}

download(){
	
	local file="https://github.com/asdf-vm/asdf/releases/download/v0.16.5/asdf-v0.16.5-linux-amd64.tar.gz"
	local filename="asdf.tar.gz"

	dir=$(mktemp -d) || { echo "Failed to create a temporary directory"; return 1; }
	
	
	if ! wget -q "$file" -O "$dir/$filename"; then
		echo "Download failed"
		rm -rf "$dir"
		return 1
	fi


	if ! tar xf "$dir/$filename" -C "$dir/"; then
		echo "Extraction failed"
		rm -rf "$dir"
		return 1
	fi


    	if [ -f "$dir/asdf" ]; then
        	mv "$dir/asdf" "$HOME/.bin/" || { echo "Move failed"; rm -rf "$DIR"; return 1; }
    	else
        	echo -e "\nSomething is wrong: asdf binary not found.\n"
        	rm -rf "$dir"
        	return 1
    	fi	


	rm -rf "$dir"
   	return 0
}

if preparing; then
    echo -e "\nFirst step OK!\n"
else
    echo -e "\nFirst step failed!\n"
    exit 1
fi

if download; then
    echo -e "\nInstalled\n"
else
    echo -e "\nInstallation failed\n"
    exit 1
fi

