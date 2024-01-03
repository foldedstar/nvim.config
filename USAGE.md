# Getting started

## Linux/MacOs

Make a backup of your current Neovim files

- required

```bash
mv ~/.config/nvim{,.bak}
```

- optional but recommended

```bash
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

Clone the repo

```bash
git clone https://github.com/foldedstar/nvim.config ~/.config/nvim
```

## Windows

Make a backup of your current Neovim files

- required

```bash
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
```

- optional but recommended

```bash
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

Clone the repo

```bash
git clone https://github.com/foldedstar/nvim.config $env:LOCALAPPDATA\nvim
```
