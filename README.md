# WindowGrab.vim

A window swapper copied from [WindowSwap.vim by wesQ3][1], but with modified UX
that is better for my workflow.

Like WindowSwap, this plugin's purpose is to help with arbirary window swaps
that preserve your layout. However, WindowSwap only handles swaps; often what
I want to do is *move* a window. This is useful in situations where I am diving
through many files and finally find a file that is important; I want to be able
to move the file I found to a better place in my layout.

All credit to [wesQ3][1] and [sgriffin][2] for the core implementation.

## How To Use

1. Navigate to the window you'd like to move or swap
2. Press `<leader>c` to grab the file

#### To Swap

3. Navigate to the window you'd like to swap with
4. Press `<leader>c` again

#### To Move the Window

3. Navigate to the space you'd like to move the window to
4. Press `<leader>v` (this will open the file in the new location and close the
  old window)

## Key Bindings

Defaults:
* Grab or swap a window with `<leader>c`
* Move the grabbed window instead with `<leader>v`

Customize the commands to your liking by dropping this in your `.vimrc` and
changing the mappings:

```VimL
let g:windowgrab_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>c :call WindowSwap#DoWindowGrab()<CR>
nnoremap <silent> <leader>v :call WindowSwap#MoveWindow()<CR>
```

## Installation

This plugin follows the standard runtime path structure, and as such it can be
installed with a variety of plugin managers:

* [Vundle][11]: `Plugin 'azirbel/vim-windowgrab'`
* [Pathogen][12]: `git clone https://github.com/azirbel/vim-windowgrab ~/.vim/bundle/vim-windowgrab`
* [NeoBundle][13]: `NeoBundle 'azirbel/vim-windowgrab'`
* [VAM][14]: `call vam#ActivateAddons([ 'azirbel/vim-windowgrab' ])`
* manual: Copy all of the files into your `~/.vim` directory

[1]: https://github.com/azirbel/vim-windowswap
[2]: http://stackoverflow.com/q/2586984/77782
[11]: https://github.com/gmarik/vundle
[12]: https://github.com/tpope/vim-pathogen
[13]: https://github.com/Shougo/neobundle.vim
[14]: https://github.com/MarcWeber/vim-addon-manager
