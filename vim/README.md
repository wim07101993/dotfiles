# Vim

Scripts to configure the Vim editor.

# Vim-plug

We use the Vim-plug plugin manager.

Extra plugins can be installed within the `PLUGINS` section of the `.vimrc` 
file.

# Commands

| Command        | Action                          |
|----------------|---------------------------------|
| `:w`           | save                            |
| `:x`           | save and close                  |
| `:reg`         | show registers                  |
| `:PlugUpdate`  | updates all plugins of vim-plug |
| `:PlugUpdate`  | updates all plugins of vim-plug |
| `:DartFmt`     | formats current dart-code       |

# Dart

| Command        | Action                          |
|----------------|---------------------------------|
| `:DartFmt`     | formats current dart-code       |

# Markdown

| Command        | Action                                      |
|----------------|---------------------------------------------|
| `:TableFormat` | formats current markdown table              |
| `:Toc`         | show table of contents                      |
| `:Toch`        | show table of contents in horizontal window |
| `:InsertToc`   | insert table of contents                    |

# File-tree

| Command           | Action                  |
|-------------------|-------------------------|
| `:NERDTree`       | open file-tree          |
| `:NERDTreeFocus`  | focus on file-tree      |
| `:NERDTreeToggle` | toggle the file-tree    |
| `:NERDTreeFind`   | find a file in the tree |

# Keymap

## Navigational mode

Add amount as prefix before cursor movement command to repeat it.

| Keys    | Action                             |
|---------|------------------------------------|
| F3      | open file tree                     |
| CTRL-s  | save file                          |
| yy      | yank line                          |
| yy      | yank line                          |
| yw      | copy from cursor until end of word |
| yiw     | copy entire word                   |
| gd      | move to local declaration          |
| gD      | move to global declaration         |
| CTRL-ww | go-to next split                   |

### Visual

| Keys   | Action                      |
|--------|-----------------------------|
| v      | start character visual mode |
| V      | start line visual mode      |
| CTRL-V | start block visual mode     |

### Vertical

| Keys   | Action                                   |
|--------|------------------------------------------|
| j      | move up                                  |
| k      | move down                                |
| H      | move to top of screen                    |
| M      | move to middle of screen                 |
| L      | move to bottom of screen                 |
| CTRL-b | move up 1 screen                         |
| CTRL-u | move up 1/2 screen                       |
| CTRL-y | move up 1 line                           |
| CTRL-e | move down 1 line                         |
| CTRL-d | move down 1/2 screen                     |
| CTRL-f | move down 1 screen                       |
| gg     | move to top of document                  |
| G      | move to bottom of document               |
| xG     | move to line x                           |
| }      | jump to next paragraph/function/bloc     |
| {      | jump to previous paragraph/function/bloc |
| zz     | center cursor on screen by moving doc    |

### Horizontal

| Keys | Action                                      |
|------|---------------------------------------------|
| h    | move left                                   |
| l    | move right                                  |
| w    | jump to beginning of word                   |
| e    | jump to end of word                         |
| b    | jump back to beginning word                 |
| 0    | jump to start of line                       |
| ^    | jump to first non-blank char of line        |
| $    | jump to end of line                         |
| g_   | jump to last non-blank char of line         |
| fx   | jump to next character x                    |
| tx   | jump before next character x                |
| Fx   | jump to previous character x                |
| Tx   | jump before previous character x            |
| ;    | repeat previous f, t, F or T jump           |
| ,    | repeat previous f, t, F or T jump backwards |

### Editing

| Keys        | Action                                           |
|-------------|--------------------------------------------------|
| SHIFT-ENTER | add line below                                   |
| o           | insert below                                     |
| O           | insert above                                     |
| i           | insert before                                    |
| I           | insert at beginning of line                      |
| a           | insert after                                     |
| A           | insert at end of line                            |
| r           | replace single char                              |
| R           | enter replacement mode                           |
| J           | join current and next line with space between    |
| gJ          | join current and next line wihtout space between |
| cc          | remove line and enter insert mode                |
| dd          | remove line and don't enter insert mode          |
| C           | remove until end of line and enter insert mode   |
| x           | remove char                                      |
| X           | remove until end of line                         |
| u           | undo                                             |
| CTRL-r      | redo                                             |
| .           | repeate latst command                            |

## Insert mode

| Keys   | Action           |
|--------|------------------|
| jj     | exit insert mode |
| ESCAPE | exit insert mode |

## Visual mode

| Keys   | Action                       |
|--------|------------------------------|
| o      | move to other end of area    |
| O      | move to other corner of area |
| w      | mark until next word         |
| iw     | mark entire word             |
| ab     | mark bloc with ()            |
| aB     | mark bloc with {}            |
| at     | mark bloc wiht &lt;&gt;      |
| ESCAPE | exit visual  mode            |
| &gt;   | shift right                  |
| &lt;   | shift left                   |
| y      | yank                         |
| d      | delete                       |
| ~      | switch case                  |
| u      | change to lowercase          |
| U      | change to uppercase          |

## Registers

| Keys | Action                       |
|------|------------------------------|
| "xy  | yank into register x         |
| "xp  | paste from register x        |
| "+y  | yank into system clipboard   |
| "+p  | paste from system clipboasrd |

