let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501,E126,E127,E128'

NeoBundle "Glench/Vim-Jinja2-Syntax"

NeoBundleLazy "davidhalter/jedi-vim", {
  \ "autoload": {
  \   "filetypes": ["python", "python3"]
  \ }}

let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#popup_select_first = 0
    let g:jedi#popup_on_dot = 0
    setlocal completeopt-=preview
    if has("mac") || has("unix")
        let g:jedi#completions_command = "<C-p>"
    endif
endfunction

NeoBundleLazy "jmcantrell/vim-virtualenv", {
  \ "autoload": {
  \   "filetypes": ["python", "python3"]
  \ }}
