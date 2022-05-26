# PasteSorcerer.vim

You can now paste regardless of how it is Yanked. Yanked Entire Line, and now wanted to paste it inline, then no worries, PasteSorcerer.vim got your back.

## Demo

![1](https://user-images.githubusercontent.com/69670983/170453177-5536fa0f-7982-41af-8a09-0eefc4b4adcf.gif)
![2](https://user-images.githubusercontent.com/69670983/170453408-d3506e3d-9e83-4499-86c5-fdaa980f6b15.gif)

## Features

1. Paste Yanked Lines inline.
2. Paste Yanked Words on a new line.
3. Paste without any Leading/Trailing whitespace.

## Installation

-   Vim plug -
    `Plug 'svban/PasteSorcerer.vim'`
-   or install it, just like you would any vim-plugin.

## Usage

-   You need to set these bindings, these are examples.

    ```
    nnoremap gp <Plug>PSInLinep
    nnoremap gP <Plug>PSInLineP

    nnoremap <leader>gp <Plug>PSNewLinep
    nnoremap <leader>gP <Plug>PSNewLineP

    nnoremap <localleader>gp <Plug>PSNoWSp
    nnoremap <localleader>gP <Plug>PSNoWSP
    ```
