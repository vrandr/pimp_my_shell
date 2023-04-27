#!/bin/bash

if [[ ${EUID} == 0 ]]; then
    echo "Installing software"
    apt-get update
    # build dependencies
    apt-get install -y build-essential golang libreadline-dev libzip-dev
    # lesspipe
    apt-get install -y imagemagick poppler-utils
    # tools
    apt-get install -y bat btop duf exa fd-find figlet fzf gron httpie jq lolcat ncdu prettyping qrencode ripgrep tig translate-shell zsh zsh-autosuggestions zsh-syntax-highlighting
    snap install glow slides yq
    # shellcheck disable=SC2016
    printf '#!/bin/sh\n\nmessage="Pimp\n      My\n               Shell"\n\nfiglet "${message}" | lolcat -a -t -s 60\n' >>/usr/local/bin/intro
    # shellcheck disable=SC2016
    printf '#!/bin/sh\n\nURL=https://github.com/vrandr/pimp_my_shell\n(figlet -f slant "Slides and Vagrant-VM" && qrencode "$URL" -t UTF8i  && echo "    $URL" && echo) | lolcat\n' >>/usr/local/bin/outro
    chmod 0755 /usr/local/bin/intro /usr/local/bin/outro
else
    echo "Downloading assets"
    mkdir "${HOME}/demo"
    cd "${HOME}/demo" || echo "Failed to create demo directory" >&2
    git clone https://github.com/makandra/capistrano-opscomplete.git
    curl -L 'https://github.com/makandra/capistrano-opscomplete/tarball/master' -o "${HOME}/demo/capistrano-opscomplete.tar.gz"
    curl -L 'https://en.wikipedia.org/api/rest_v1/page/pdf/Ruby_(programming_language)' -o "${HOME}/demo/Ruby_(programming_language).pdf"
    curl -LO 'https://cd.makandra.de/downloads/logo/makandra_word_light_color_rgb_whitespace-16d3ba60.png'
    curl -LO 'http://de.archive.ubuntu.com/ubuntu/pool/universe/c/cowsay/cowsay_3.03+dfsg2-8_all.deb'
    echo "Cloning zdharma-continuum/fast-syntax-highlighting"
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
    echo "Cloning zdharma-continuum/zinit"
    git clone https://github.com/zdharma-continuum/zinit.git ~/.zsh/zinit
    echo "Setup ChatGPT CLI"
    git clone https://github.com/marcolardera/chatgpt-cli ~/demo/chatgpt-cli
    # You probably don't want to break system packages on your system
    pip3 install -r ~/demo/chatgpt-cli/requirements.txt --break-system-packages
    echo "Setup ASDF"
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
    echo "legacy_version_file = yes" >>~/.asdfrc
    # shellcheck disable=SC1091
    source "${HOME}/.asdf/asdf.sh"
    asdf plugin add ruby
    echo "Installing git-delta"
    asdf plugin add delta
    asdf install delta latest
    asdf global delta latest
    echo "Installing q"
    go install -ldflags="-s -w -X main.version=release" github.com/natesales/q@latest
    echo "Installing worlde-cli"
    go install pkg.nimblebun.works/wordle-cli@latest
    echo "Finished"
fi
