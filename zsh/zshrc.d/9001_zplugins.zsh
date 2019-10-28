# zsh plugins

zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait as"completion" lucid
zplugin snippet OMZ::plugins/docker/_docker

zplugin ice wait as"completion" lucid
zplugin snippet OMZ::plugins/docker-compose/_docker-compose

zplugin ice wait as"completion" lucid
zplugin snippet OMZ::plugins/kubectl/kubectl.plugin.zsh

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting