colorscheme ron
colorscheme retrobox
set relativenumber
set number
set splitbelow
set splitright

set tabstop=2
set shiftwidth=2
set softtabstop=2
set ignorecase
set smartcase
set clipboard=unnamedplus
set cursorline
au   BufEnter *   execute ":lcd " . expand("%:p:h") 
