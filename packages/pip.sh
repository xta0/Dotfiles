# check if pip3 installed
if ! foobar_loc="$(type -p "pip3")" || [ -z "$foobar_loc" ]; then
  brew install pip3
fi

packages = ( request )

pip3 install "${packages[@]}"