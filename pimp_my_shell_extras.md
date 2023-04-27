# Pimp My Shell

## Extras

---

## Zsh plugins

### Autosuggestions

```shell
apt install zsh-autosuggestions

# Enable in .zshrc.local
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey "\e[Z" autosuggest-accept  # <SHIFT + TAB>

/
# /etc/ssl/certs/Amazon_Root_CA_4.pem
/<SHIFT + TAB>
```

---

## Zsh plugins

### Syntax highlighting

Two plugins:

- zsh-syntax-highlighting (via APT)
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) (manual)


```shell
ls -lh "/etc/ssl/certs/"
[[ "$a" == "1" && "$b" == "2" ]] || echo "foo"
```

---

## Zsh plugins

### I want more

- [Oh My Zsh!](https://github.com/ohmyzsh/ohmyzsh/wiki)
  - Framework with many many plugins, themes, etc.
  - Little bit bloated for my taste
  - You can also only use some parts like the [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) aliases plugin
- [zinit](https://github.com/zdharma-continuum/zinit)
  - Plugin manager for zsh

---

## Starship

### git + ruby

```shell
gcb foobar
touch foo
grbi HEAD~10
# drop and edit some commits

# commit and rebasing status is shown
vim foo
ga README.md foo
grbc

# view commit with TUI tool
tig
```

---

## Modern alternatives

### duf (apt, asdf) + jq (apt)

- `df` alternative

```shell
# show on Ubuntu 20.04
df -h

duf
duf --only local
duf --json
```

---

## Modern alternatives

### jq (apt) and gron (apt)

- Process JSON data
- Alternative: `fx`

```shell
# jq
duf --json  | jq
duf --json  | jq '.[]'
duf --json  | jq '.[] | { device, mount_point, total, free }'
duf --json  | jq '.[] | select(.fs_type == "tmpfs") | { mount_point, total, free }'

# gron
duf --json | gron
duf --json | gron | grep "device\|total\|free"
duf --json | gron | grep "device\|total\|free" | gron -ungron
```

---

## Modern alternatives

### git-delta (asdf)

- Syntax-highlighting pager for git, diff, and grep output
- `diff` alternative

```shell
# move content
vim README.md

gd
gsh fced48e

# enable delta
vim ~/.gitconfig

# show differences
gd
gsh fced48e
```

---

## Modern alternatives

### fzf (apt)

- Fuzzy finder

```shell
# Interactive grep
sudo dmesg
sudo dmesg | fzf
sudo dmesg | fzf -m
```

---

## Modern alternatives

### fzf (apt)

```shell
# Enable in .zshrc.local
vim ~/.zshrc.local

# Search through files
ls /etc/**<TAB>
amazon
cd ~/demo
vim <CTRL+T>

# Replace history function
<CTRL+R>
```

---

## Modern alternatives

### q dns client (go)

- Nice `dig` replacement
- Colorful
- Supports many protocols (DNS over TLS, DNS over HTTPS, ...)

```shell
dig www.makandra.de
dig AAAA www.makandra.de
dig +short AAAA www.makandra.de
q www.makandra.de
q makandra.de
q makandra.de @1.1.1.1
q www.makandra.de --format json
q www.makandra.de --format yaml
```

---

## Modern alternatives

### yq (apt)

- The `jq` for `YAML` data
- Yo  can also replace data in `yaml` files

```shell
q AAAA www.makandra.de --format yaml | yq'
q AAAA www.makandra.de --format yaml | yq '.answers[].aaaa'
```

---

## Modern alternatives

### prettyping (apt)

- `ping`++
- Useful if you restart devices

```shell
ping 1.1.1.1
prettyping 1.1.1.1
```

---

## Web services

- Cloud services for `curl` or `httpie` (apt)

### cheat sheet

```shell
curl cheat.sh
curls cheat.sh/btrfs
curls cheat.sh/btrfs~snapshot
```

### wttr

```
curls wttr.in
curls wttr.in/Augsburg
```
