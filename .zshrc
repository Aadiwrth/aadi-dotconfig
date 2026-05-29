fastfetch() {
    THEME=$(find ~/.config/fastfetch/themes -name "*.jsonc" | shuf -n 1)
    /usr/bin/fastfetch -c "$THEME"
}
source ~/.config/zshrc/rc
export PATH="$HOME/.local/bin:$PATH"

