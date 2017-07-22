# focus.vim

## What is this?
This plug in aims to focus the current window to the maximum possible and restores window configuration.

## Functions
- ArchiveWindowConfiguration()
Stores current window configuration.

- FocusCurrentWindow()
Makes the current active window take the biggest display real estate possible.

- RestoreArchivedWindowConfig()
Restores window configuration to the archived configuration.

- ArchiveAndFocusCurrentWindow()
This is basically calling ArchiveWindowConfiguration() + FocusCurrentWindow()

## Commands Mapping
```vim
:FocusArchive "ArchiveWindowConfiguration()
:FocusFocus "FocusCurrentWindow()
:FocusArchiveFocus "ArchiveAndFocusCurrentWindow()
:FocusRestore "RestoreArchivedWindowConfig()
```

## Installation
With plug.vim, do this
```vim
Plug 'stdint/focus.vim'
```

