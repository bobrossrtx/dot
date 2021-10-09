let g:startify_bookmarks = [
    \ { 'c': '~/.config/i3/config' },
    \ { 'z': '~/.zshrc' },
    \ { 'v': '~/.config/nvim/init.vim' }
    \ ]

let g:startify_lists = [
    \ { 'header': ['  Bookmarks'],      'type': 'bookmarks' },
    \ { 'header': ['  MRU'],            'type': 'files' },
    \ { 'header': ['  MRU'. getcwd()],  'type': 'dir' },
    \ ]

let g:startify_fortune_use_unicode = 1
nmap <c-n> :Startify<CR>
