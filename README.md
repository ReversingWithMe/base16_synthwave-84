# Base16 Synthwave (inspired by Robb Owen's themes)

Based on: https://github.com/chriskempson/base16
    and https://github.com/chriskempson/base16-shell
    and https://github.com/chriskempson/base16-vim

- You probably want to copy base16-synthwave-84.sh to:
    - HERE: ~/.config/base16-shell/scripts/

- You probably want to copy base16-synthwave.vim to:
    - HERE: ~/.config/nvim/plugged/base16-vim/colors/          (if using vim-plug)
    - OR: ~/.local/share/nvim/site/pack/packer/start/base16-vim/colors/   (packer)
    - OR: ~/.local/share/nvim/lazy/base16-vim/colors/        (lazy.nvim)

# Debugging

In Neovim if you encounter unexpected color of tokens, try :Inspect while hovering over the node.

Token priority for coloring is stacked with toggled one last. This is color coded so the color of the token
should match the one being visualized in nvim. You may have to edit the .vim file to correct this for expected
behavior. Please submit a issue if the .vim file should be updated. Lower priority is used for selecting which term to
use in highlight, while also only matching on terms which registered highlights in the .vim file.

e.g.,

a priority 100 for something .vim doesn't register, and a priority 125 that the .vim does, the priority 125 will be used.
