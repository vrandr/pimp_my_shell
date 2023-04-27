---
marp: true
paginate: true
header: '![w:200](https://cd.makandra.de/downloads/logo/makandra_word_dark_color_rgb_compact-d55d99c4.png)'
footer: 'Andreas Vöst @makandra GmbH'
theme: default
html: false
pdf: true
style: |
  :root {
    --color-fg-default: #eff;
    --color-canvas-default: #246;
  }
  section {
    background-color: #20304c;
    color: #ccd4d9;
    font-family: Roboto, sans-serif;
    font-weight: 300;
    font-size: 20px;
  }
  header {
    left: auto;
    right: 10px;
    top: 10px
  }
  a {
    color: #e61d47;
    text-decoration: underline;
  }
  img {
    background-color: transparent;
  }
  h1 {
    color: #e61d47;
    font-size: 40px;
  }
  h2 {
    color: #e61d47;
    font-size: 30px;
  }
  code {
    color: SlateGray;
  }

---

# Pimp My Shell

1. Slides and Vagrant-VM
1. Bash Command Line Editing
1. Useful tools
1. Zsh
1. asdf
1. Starship
1. Modern alternatives
1. Web services
1. Links

---

## Slides and Vagrant-VM

Find the slides and a preconfigured Vagrant-VM at: https://github.com/vrandr/pimp_my_shell

---

## Bash Command Line Editing

```shell
# Clear screen
# <CTRL + L>

# Beginning of the line
# <CTRL + A>

# End o the line
# <CTRL + E>

# Cancel command
# <CTRL + C>

# EOF (exit)
# <CTRL + D>
```
---

## Bash Command Line Editing

```shell
# Print last argument
# <ALT + .>

# Delete last word
# <ALT + BACKSPACE>

# Execute last command
# !!
sudo !!

# Search history
# <CTRL + R>
```

---

## Useful tools

### lesspipe

```shell
less /etc/fstab
sudo dmesg
sudo dmesg | less
```

- Preprocessor for `less`
- Enabled by default
- Add `eval $(lesspipe)` to your `.bashrc` if it's missing
- Support for archives, images, pdf documents
- Extendable

---

## Useful tools

### glow

- Beautiful markdown viewer

---

## Zsh

### Basic setup

```shell
chsh -s /usr/bin/zsh
curl -L https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc -o "$HOME/.zshrc"
source ~/.zshrc
```

---

## Zsh

### Autocorrect

```shell
# Autocd
/usr/local/bin

# Autocorrect
/etd
dc /home
ls /usr/share/doc/zsh/NEWS.d<TAB>

```

---

## Zsh

### Completion

```shell
# Completion
systemctl s<TAB>
systemctl --t<TAB>
systemctl --type<TAB>

# Compare with bash
bash --login
systemctl s<TAB>
systemctl --t<TAB>
systemctl --type<TAB>
exit
```

---

## Zsh

### Completion

```shell
# Alias completion
alias sc=systemctl
sc s<TAB>

# Compare with bash
bash --login
alias sc=systemctl
sc s<TAB>
exit
```

---

## Zsh

### Help

```shell
# Get help
systemctl --type <ALT + h>
<q>

# Also works with aliases
sc <ALT + h>
<q>
```
---

## Zsh

### Home and hashes

```shell
# Go to the home directory of a user
cd ~vagrant
cd ~root
cd ~
cd

# Hashes
cd ~log
cd ~doc

# Create new hashes
hash -d demo=$HOME/demo
cd ~demo

# All hashes
hash -d
```

---

## Zsh

### Aliases

```shell
# Aliases
alias curls

# Suffix aliases
alias -s
alias -s crt='command openssl x509 -text -noout -in '
alias -s pem='command openssl x509 -text -noout -in '
alias -s md='command glow -p'

/etc/ssl/certs/Amazon_Root_CA_4.pem
~/demo/capistrano-opscomplete/README.md
```

---

## asdf

- `asdf` is a version manager
- Like `rbenv` but with support for many applications through plugins
- `asdf plugin list-all`
- Uses a `.tools-version` by default
- Be aware which asdf plugins you install

---

## Starship

- Fancy prompt
- Support for bash, zsh, fish, Powershell
- Many, many plugins

---

## Starship

### Install with asdf

```shell
asdf plugin add starship
asdf install starship latest
asdf global starship latest
starship --version

# Enable in .zshrc.local
prompt off
eval "$(starship init zsh)"
```
---

## Starship

### Read only directory

```shell
# Notice the little lock icon
cd /etc
```

---

## Starship

### Exit code

```shell
touch /etc/fstab
starship toggle status
touch /etc/fstab
starship config
```

---

## Starship

### git + ruby

```shell
cd
cd demo
cd capistrano-opscomplete

# git directory shown as root directory
# branch
# language and version shows
```

---

## Starship

### git + ruby

```shell
git checkout -b foobar
touch foo

# view commit with TUI tool
tig
```
---

## Starship

### Plugin settings

```shell
starship config
```

```
[username]
format = '[$user]($style)'
style_root = 'red bold'
style_user = 'blue bold'

[hostname]
format="[@$hostname]($style) "
style="bold dimmed white"
```
---

## Modern alternatives

### htop (apt) + btop (apt)

- Resource monitors
- Colorful alternatives for `top`
- `btop` available since Ubuntu 22.04

```shell
top
htop
# full flex mode
btop
```

---

## Modern alternatives

### bat (apt)

- `cat` alternative
- With syntax highlighting

```shell
batcat /etc/fstab
batcat ~/demo/capistrano-opscomplete/Rakefile
# doesnt break the original functionality
batcat /etc/fstab /etc/fstab > doubletab
cat doubletab
```
---

## Modern alternatives

### exa (apt, asdf)

- `ls` replacement
- All the colors
- Alternative: `lsd`

```shell
exa
exa -l
exa --long --icons
llv
exa --long --header --inode --links --blocks --group --time-style=long-iso
```

---

## Modern alternatives

### ncdu (apt)

- `du` ncurses interfaces

```shell
ncdu --color dark -x /
# sort by name: n
# sort by size: s
# delete: d
```

---

## Modern alternatives

### ripgrep (apt)

- Faster, feature-richer grep
- Respects `.gitignore` by default
- `ag` aka the silversearcher is also a valid alternative

```shell
# grep
grep -R branch
rg branch

# no need for `-r` or `-R`
rg managed

# grep features
rg -A2 managed
rg -B2 managed
```

---

## Modern alternatives

### ripgrep (apt)

```shell
# file name only
rg -l manage

# sorting
rg manage --sort path

# smartcase
rg -S managed
rg -S Managed

# type filter
rg -S managed -t ruby
rg -S managed -T ruby
```

---

## Modern alternatives

### fd-find (apt)

- `find` replacement
- For some reasons the binary is installed in `/usr/lib/cargo/bin/`
- Respects `.gitignore` by default
- Colorful output

```shell
find -type d
alias fd=/usr/lib/cargo/bin/fd

fd

# Type
find -type d
fd -t d
fd --type file
```

---

## Modern alternatives

### fd-find (apt)

```shell
# Extension
fd -e rb

# Smartcase by default
fd readme

# Time based
fd . /etc --changed-within=1d
fd . /etc --changed-before=1d

# Execute commands
fd -e rb -x rm -v
```

---

## Web services

- Cloud services for your terminal

### translate-shell

```shell
trans en:de "The quick brown fox jumps over the lazy dog."
trans de:en "Franz jagt im komplett verwahrlosten Taxi quer durch Bayern."
trans -d beer
```

---

## Web services

### ChatGPT

```shell
export OPENAI_API_KEY=$API_KEY
python3 chatgpt-cli/chatgpt.py
[0] >>> How would I write a BASH script that outputs a tiny ascii-cat?
```

---

## Links

- [Slides and Vagrant-VM](https://github.com/vrandr/pimp_my_shell)
- Arch Wiki: [Core utils alternatives](https://wiki.archlinux.org/title/Core_utilities#Alternatives), [Zsh](https://wiki.archlinux.org/title/Zsh)
- [asdf](https://asdf-vm.com/)
- [Moderne Kommandozeilen Werkzeuge Talks](https://media.ccc.de/search/?q=Kommandozeilenwerkzeuge) von @leyrer
- [Oh My Zsh!](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [makandra](https://makandra.de): Wir entwickeln und betreiben anspruchsvolle Webanwendungen
