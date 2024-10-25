;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(javascript
     html
     asciidoc
     ocaml
     haskell
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      )
     ;; better-defaults
     emacs-lisp
     git
     ;; helm
     ;; lsp
     ;; markdown
     multiple-cursors
     org
     (shell :variables
            ;; shell-default-shell 'ansi-term
            ;; shell-default-height 30
            shell-default-term-shell "/bin/zsh"
            shell-default-position 'bottom)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     ;; ivy
     (ivy :variables ivy-initial-inputs-alist nil)
     ;; auto-completion

     ;; fzf
     ;; pdf
     treemacs


     evil-snipe
     ;; (julia :variables julia-backend 'lsp)
     julia
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      org-super-agenda
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  ;; (exec-path-from-shell-initialize)
  ;; (when (memq window-system '(mac ns x))
  ;;   (exec-path-from-shell-initialize)
  ;;   (exec-path-from-shell-initialize))
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."


(defun get-effective-indentation ()
  "Get the column of the first non-whitespace character on the current line."
  (save-excursion
    (if (line-empty-p)
      10000
      (progn
        (back-to-indentation)
        (current-column))
      )))

(defun line-empty-p ()
  "Check if the current line is empty or contains only whitespace."
  (save-excursion
    (beginning-of-line)
    (looking-at "^\\s-*$")))

(defun evil-move-to-indent-helper (fwd)
  "Move until we see a line with the same or lesser indentation. Exception: if
the next line has the same indentation, then instead of always moving one line,
we move to the last line in the run of lines of this indentation."
  (let* ((start-indent (get-effective-indentation))
         (mv (if fwd #'forward-line #'forward-line-backwards))
         (start-point (point)))
    (evil-set-jump)
    (if (= (save-excursion (funcall mv 1) (get-effective-indentation))
           start-indent)
      ; Action 1: go to end of run of same indentation
      (while (= (save-excursion (funcall mv 1) (get-effective-indentation))
                start-indent)
        (funcall mv 1))
      ; Else, go to first line with <= indentation
      (progn
        (while (> (save-excursion (funcall mv 1) (get-effective-indentation))
                   start-indent)
          (funcall mv 1))
        (funcall mv 1)))
    (back-to-indentation)))

(defun evil-move-to-indent-out-helper (fwd)
  "Move until we see a line with lesser indentation."
  (let* ((start-indent (get-effective-indentation))
         (mv (if fwd #'forward-line #'forward-line-backwards))
         (start-point (point)))
    (if (= start-indent 0)
      (evil-move-to-indent-helper fwd)
      (progn
        (evil-set-jump)
        (while (>= (save-excursion (funcall mv 1) (get-effective-indentation))
                    start-indent)
          (funcall mv 1))
        (funcall mv 1)
        (back-to-indentation)))))

(defun forward-line-backwards (&optional n)
  "Move N lines backwards (negative N moves forwards)."
  (forward-line (- (or n 1))))

(evil-define-motion evil-jump-down (count)
  "Move to the next line with same or less indentation, or skip a run of
equally-indented lines."
  :type line
  :jump t
  (evil-move-to-indent-helper t))

(evil-define-motion evil-jump-up (count)
  "Move to the previous line with same or less indentation, or skip a run of
equally-indented lines."
  :type line
  :jump t
  (evil-move-to-indent-helper nil))

(evil-define-motion evil-jump-down-out (count)
  "Move to the next line with less indentation."
  :type line
  :jump t
  (evil-move-to-indent-out-helper t))

(evil-define-motion evil-jump-up-out (count)
  "Move to the previous line with less indentation."
  :type line
  :jump t
  (evil-move-to-indent-out-helper nil))

(define-key evil-motion-state-map (kbd "S-<down>") 'evil-jump-down)
(define-key evil-motion-state-map (kbd "S-<up>") 'evil-jump-up)

(define-key evil-motion-state-map (kbd "g j") 'evil-jump-down-out)
(define-key evil-motion-state-map (kbd "g k") 'evil-jump-up-out)









(defun my/magit-status-default ()
  "Open magit-status, defaulting to $REPO if not in a git repository"
  (interactive)
  (if (magit-git-repo-p default-directory)
      (magit-status)
    (magit-status (getenv "REPO"))))

(spacemacs/set-leader-keys "gs" 'my/magit-status-default)


; non-resumable version
; (spacemacs/set-leader-keys "od"
  ; (lambda ()
    ; (interactive)
    ; (let* ((original-buffer (current-buffer))
           ; (original-point (point))
           ; (default-directory
             ; (if (vc-git-root default-directory)
                 ; default-directory
               ; (getenv "REPO")))
           ; (default-directory (or default-directory "~")))
      ; (magit-diff-working-tree "HEAD~1")
      ; (magit-section-show-level-4-all)
      ; (let ((selection
             ; (unwind-protect
                 ; (progn
                   ; (condition-case nil
                       ; (progn
                         ; (swiper "+ ")
                         ; (car kill-ring))
                     ; (quit
                      ; (switch-to-buffer original-buffer)
                      ; (goto-char original-point)
                      ; (keyboard-quit))))))
            ; (line-pos (- (line-number-at-pos (point))
                        ; (line-number-at-pos (window-start)))))
        ; (when selection  ; only proceed if we didn't quit
          ; (call-interactively #'magit-diff-visit-worktree-file)
          ; (recenter line-pos))))))

; resumable version
(let ((last-diff-buffer nil))

  (defun my/diff-search ()
    (interactive)
    (let* ((original-buffer (current-buffer))
           (original-point (point))
           (default-directory
             (if (vc-git-root default-directory)
                 default-directory
               (getenv "REPO")))
           (default-directory (or default-directory "~")))
      (magit-diff-working-tree "HEAD~1")
      (magit-section-show-level-4-all)
      (goto-char (point-min))  ; Start at the top
      (setq last-diff-buffer (current-buffer))
      (let ((selection
             (unwind-protect
                 (progn
                   (condition-case nil
                       (progn
                         (swiper "\\+ ")
                         (car kill-ring))
                     (quit
                      (switch-to-buffer original-buffer)
                      (goto-char original-point)
                      (keyboard-quit))))))
            (line-pos (- (line-number-at-pos (point))
                        (line-number-at-pos (window-start)))))
        (when selection  ; only proceed if we didn't quit
          (call-interactively #'magit-diff-visit-worktree-file)
          (recenter line-pos)))))

  (defun my/resume-diff-search ()
    (interactive)
    (if (not last-diff-buffer)
        (my/diff-search)
      (let* ((original-buffer (current-buffer))
             (original-point (point)))
        (switch-to-buffer last-diff-buffer)
        (let ((selection
               (unwind-protect
                   (progn
                     (condition-case nil
                         (progn
                           (ivy-resume 'swiper)
                           (car kill-ring))
                       (quit
                        (switch-to-buffer original-buffer)
                        (goto-char original-point)
                        (keyboard-quit))))))
              (line-pos (- (line-number-at-pos (point))
                          (line-number-at-pos (window-start)))))
          (when selection
            (call-interactively #'magit-diff-visit-worktree-file)
            (recenter line-pos))))))

  (spacemacs/set-leader-keys "od" #'my/diff-search)
  (spacemacs/set-leader-keys "ol" #'my/resume-diff-search))













  ;; (add-hook 'prog-mode-hook 'linum-on)
  ;; (add-hook 'coq-mode-hook #'opam-switch-mode)
  ;; (add-hook 'tuareg-mode-hook #'opam-switch-mode)
  (add-hook 'tuareg-mode-hook
            (lambda()
              (electric-indent-mode 0)
              ))
  (setq tab-always-indent t)
  (custom-set-faces
   '(merlin-eldoc-occurrences-face ((t :background "#243a4a" :bold t)))
   )

  (use-package opam-switch-mode
    :ensure t
    :hook
    ((coq-mode tuareg-mode) . opam-switch-mode))
  (let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
    (setenv "PATH" path)
    (setq exec-path
          (append
           (split-string-and-unquote path ":")
           exec-path)))
  (use-package ocamlformat
    :custom (ocamlformat-enable 'enable-outside-detected-project)
    :hook (before-save . ocamlformat-before-save)
    )


  ;; (setq auto-completion-return-key-behavior nil)

  (getenv "PATH")
  (setenv "PATH"
          (concat
           "/Library/TeX/texbin" ":"

           (getenv "PATH")))
  
  ; (setq spacemacs-yank-indent-threshold 0)
  ;; (global-visual-line-mode t)
  (spacemacs/toggle-visual-line-navigation-globally-on)
  
  (spaceline-toggle-minor-modes-off)
  (defun run-script ()
    (interactive)
    (save-buffer)
    ;; (message "%s" (eshell-command-result "make"))
    (async-shell-command "make")
    (spacemacs/alternate-window)

    )
  (spacemacs/set-leader-keys "om" 'run-script)
  (setq scroll-margin 8)
  (setq doc-view-resolution 200)
  (define-key evil-motion-state-map (kbd "C-S-o") 'evil-jump-forward)
  (define-key evil-normal-state-map (kbd "C-S-o") 'evil-jump-forward)
  (define-key evil-insert-state-map (kbd "C-S-o") 'evil-jump-forward)
  (defun stop-using-minibuffer () "kill minibuffer"
         (when
             (and (>= (recursion-depth) 1) (active-minibuffer-window))
           (abort-recursive-edit)))

  (setq dotspacemacs-mode-line-unicode-symbols nil)
  ;; (setq ediff-window-setup-function 'ediff-setup-windows-default)
  (setq org-tags-column 0)
  (setq org-agenda-tags-column 0)

  ;; ORG MODE REMOVE EXTRA LINE FROM AGENDA
  (defun remove-agenda-header ()
    (save-excursion
      (goto-char (point-min))
      (let ((case-fold-search nil))
        (while (re-search-forward "Global list of TODO items of type: ALL" nil t)
          (delete-region (line-beginning-position) 
                         (1+ (line-end-position))))))) ; Include the newline character
  (defun remove-horizontal-line ()
    (save-excursion
      (goto-char (point-min))
      (let ((case-fold-search nil))
        (while (re-search-forward "─+" nil t)
          (delete-region (line-beginning-position) 
                         (1+ (line-end-position))))))) ; Include the newline character
  (defun remove-day-agenda-lines ()
    (save-excursion
      (goto-char (point-min))
      (let ((case-fold-search nil))
        (while (re-search-forward "^Day-agenda.*" nil t)
          (delete-region (line-beginning-position) 
                         (1+ (line-end-position))))))) ; Include the newline character

  ;; (add-hook 'org-agenda-finalize-hook 'remove-agenda-header)
  (add-hook 'org-agenda-finalize-hook 'remove-horizontal-line)
  ;; (add-hook 'org-agenda-finalize-hook 'remove-day-agenda-lines)

  
  ;; ORG MODE SETUP
  (setq org-agenda-window-setup 'current-window)
  (setq org-agenda-restore-windows-after-quit nil)
  (with-eval-after-load "org"
    (define-key org-mode-map (kbd "C-RET") 'org-insert-heading-respect-content))
  (setq org-adapt-indentation t)
  (setq org-priority-highest ?A)
  (setq org-default-priority ?B)
  (setq org-priority-lowest ?D)
  (setq org-deadline-warning-days 7)
  (setq org-priority-start-cycle-with-default nil)
  ;; (setq org-priority-low)
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "HOT(h)"
           "FROZEN(f)"
           "|"
           "DONE(d)"
           "CANCELED(c)"
           )))

  ;; ORG MODE -- APPEARANCE
  (setq org-hide-emphasis-markers t)
  (setq org-todo-keyword-faces
        '(
          ("HOT" . "white")
          ("FROZEN" . "#33b5bd")
          ("CANCELED" . "gray45")))
  (custom-set-faces
   '(org-imminent-deadline ((t :foreground "#ff628b" :bold t)))
   '(org-upcoming-distant-deadline ((t :foreground "default")))
   '(org-todo ((t :foreground "darkgray" :background "unspecified")))
   '(org-done ((t :foreground "SeaGreen3")))
   '(org-agenda-done ((t :foreground "gray45")))
   '(org-todo-HOT ((t :weight utra-bold)))
   '(org-priority ((t :foreground "blue")))
   )
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
   )
  (setq org-priority-faces '((?A . (:foreground "orchid1"))
                             (?B . (:foreground "mediumpurple2"))
                             (?C . (:foreground "mediumpurple2"))
                             (?D . (:foreground "slateblue3"))))

  ;; ORG MODE - ORDER TODOS WITH [SPC a g o]
  (defun todo-to-int (todo)
    (cl-position
     todo
     '(nil "HOT" "TODO" "FROZEN" "DONE" "CANCELED")
     :test 'equal))
  (defun my/org-sort-key ()
    (let* ((todo (org-entry-get (point) "TODO"))
           (todo-int (if todo (todo-to-int todo) 999))
           (priority
            ;; We don't do (org-entry-get (point) "PRIORITY") because we want to
            ;; be able to detect when priority is unset
            (nth 3 (org-heading-components)))
           (priority-float
            ;; Slightly prioritize unprioritized to get them to be
            (if priority priority (- org-default-priority 0.5))))
      (format "%03d %05.1f" todo-int priority-float)))

  (defun my/org-sort-entries ()
    (interactive)
    (org-sort-entries nil ?f #'my/org-sort-key))

  (defun my/sort-todos-file ()
    (interactive)
    (org-map-entries
     '(org-sort-entries nil ?f #'my/org-sort-key)
     t 'file)
    )
  (spacemacs/set-leader-keys "ago" #'my/sort-todos-file)
  (global-unset-key (kbd "s-t"))

  (setq org-agenda-start-on-weekday nil)

  ;; ORG MODE - GO TO MY AGENDA WITH [SPC a g s]
  (defun my-agenda ()
    (interactive)
    (org-agenda nil "n"))
  (spacemacs/set-leader-keys "ags" 'my-agenda)

  (defun random-cmp (a b)
    (cond
     ((< (random) (random)) -1)
     (t 1)))


  (defun org-agenda-compare-by-created (a b)
    "Compare two org agenda items A and B by their CREATED property.
   Items without a CREATED property are considered older."
    (let* ((a-created (or (org-entry-get (get-text-property 0 'org-marker a) "CREATED") ""))
           (b-created (or (org-entry-get (get-text-property 0 'org-marker b) "CREATED") "")))
      (cond
       ((and (string-empty-p a-created)
             (string-empty-p b-created)) 0) ; both have no CREATED property, consider them equal
       ((string-empty-p a-created) -1) ; A has no CREATED, consider it older
       ((string-empty-p b-created) 1) ; B has no CREATED, consider it older
       ((string< a-created b-created) -1)
       ((string= a-created b-created) 0)
       (t 1)))) ; otherwise compare by CREATED property

  (defun my-random-canceled-items (limit)
    (let ((all-canceled-items (org-agenda-get-day-entries
                               (org-agenda-files) (current-time) :todo '("CANCELED"))))
      (when (> (length all-canceled-items) limit)
        (setq all-canceled-items (cl-subseq all-canceled-items 0 limit)))
      (shuffle-vector all-canceled-items)))

  
  (setq org-agenda-custom-commands
      '(
        ("x" "Agenda, all TODOs, randomized x"
        (
        (agenda "" ((org-agenda-span 'day)))
        (alltodo ""
                  ((org-agenda-max-entries 5)
                  ;; (org-agenda-cmp-user-defined 'random-cmp)))
                  (org-agenda-cmp-user-defined 'org-agenda-compare-by-created)))
        (alltodo "")
        ;; (alltodo #1#
        ;;          ((org-agenda-cmp-user-defined #'org-random-cmp)))
        ))
        ("n" "Superagenda"
         (
          (agenda "" ((org-agenda-span 'day)))
          (alltodo ""
                    ((org-agenda-overriding-header "") ; Random
                     (org-agenda-skip-function '(org-agenda-skip-entry-if 'nottodo '("FROZEN")))
                     (org-agenda-max-entries 2)
                     (org-agenda-cmp-user-defined 'random-cmp)))
          (alltodo ""
                   ((org-agenda-overriding-header "") ; Most neglected
                    (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo '("FROZEN")))
                     (org-agenda-max-entries 5)
                    (org-agenda-cmp-user-defined 'org-agenda-compare-by-created)))
          (alltodo "" ((org-agenda-overriding-header "")
                    (org-super-agenda-groups
                     '(
                       (:name none :todo "HOT")
                       ; Most important
                       (:name none :and (:priority "A" :deadline nil :not (:todo "FROZEN")))
                       (:name none :and (:priority "A" :not (:todo "FROZEN")))
                       ; Unassigned
                       (:name none :and (:not (:priority<= "A") :deadline nil :not (:todo "FROZEN")))
                       (:name none :and (:not (:priority<= "A") :not (:todo "FROZEN")))
                       (:name none :and (:priority "B" :deadline nil :not (:todo "FROZEN")))
                       (:name none :and (:priority "B" :not (:todo "FROZEN")))
                       ; Important
                       (:name none :and (:priority "C" :deadline nil :not (:todo "FROZEN")))
                       (:name none :and (:priority "C" :not (:todo "FROZEN")))
                       ; Less important
                       (:name none :and (:priority "D" :deadline nil :not (:todo "FROZEN")))
                       (:name none :and (:priority "D" :not (:todo "FROZEN")))
                       ; FROZEN
                       (:name none :todo "FROZEN")
                       ))))))))



                       ;; (:name "Random Canceled Tasks"
                       ;;    :todo "CANCELED"
                       ;;    :transformer (my-random-canceled-items 5))
                       ;; ;
                       ;; (:name "Frozen" :todo "FROZEN")

  (org-super-agenda-mode)

  ;; ORG MODE - automatically insert CREATED to TODOS
  (require 'org-expiry)
  ;; (setq org-treat-insert-todo-heading-as-state-change t)
  ;; (org-expiry-insinuate) (setq org-expiry-inactive-timestamps t)


  (defun my-insert-inactive-created-timestamp ()
    "Insert a CREATED property with an inactive timestamp."
    (interactive)
    (let ((created-string (format-time-string "[%Y-%m-%d %a %H:%M]")))
      (org-set-property "CREATED" created-string)))

  (advice-add 'org-insert-todo-heading :after
              (lambda (&rest args) (my-insert-inactive-created-timestamp)))
  ;; (advice-add 'org-insert-todo-heading :after
  ;;             (lambda (&rest args) (org-expiry-insert-created)))
  ;; (advice-add 'org-insert-heading :after #'org-expiry-insert-created)

  ;; ORG MODE - HOT FILES
  (spacemacs/set-leader-keys "agt"
    (lambda() (interactive)(find-file "~/Dropbox/org/todo.org")))

  (spacemacs/set-leader-keys "agg"
    (lambda() (interactive)(find-file "~/Dropbox/org/goals.org")))
  (spacemacs/set-leader-keys "agn"
    (lambda() (interactive)
    (find-file "~/Dropbox/org/todo.org")
    (beginning-of-buffer)
    (evil-org-org-insert-todo-heading-respect-content-below)))
  (spacemacs/set-leader-keys "agd"
    (lambda() (interactive)(find-file "~/Dropbox/org/done.org")))
  (spacemacs/set-leader-keys "agi"
    (lambda() (interactive)(find-file "~/Dropbox/org/inbox.org")))

  ;; ORG MODE - ORDER MY AGENDA
  (defun my-org-sort-todo-state (a b)
    (let ((state-a (get-text-property 14 'todo-state a))
          (state-b (get-text-property 14 'todo-state b)))
      (cond ((and (string= state-a "HOT")
                  (not (string= state-b "HOT"))) -1)
            ((and (not (string= state-a "HOT"))
                  (string= state-b "HOT")) 1)
            (t nil))))
  (setq org-agenda-cmp-user-defined 'my-org-sort-todo-state)

  (setq org-agenda-sorting-strategy
        '(
          (agenda
           ;; my additions
           user-defined-up
           ;; end my additions
           habit-down
           time-up priority-down category-keep)
          (todo user-defined-up priority-down category-keep)
          (tags priority-down category-keep)
          (search category-keep))
        )
  (defun my-yank-org-link (text)
    (if (derived-mode-p 'org-mode)
        (insert text)
      (string-match org-bracket-link-regexp text)
      (insert (substring text (match-beginning 1) (match-end 1)))))

  (defun my-org-retrieve-url-from-point ()
    (interactive)
    (let* ((link-info (assoc :link (org-context)))
           (text (when link-info
                   ;; org-context seems to return nil if the current element
                   ;; starts at buffer-start or ends at buffer-end
                   (buffer-substring-no-properties (or (cadr link-info) (point-min))
                                                   (or (caddr link-info) (point-max))))))
      (if (not text)
          (error "Not in org link")
        (add-text-properties 0 (length text) '(yank-handler (my-yank-org-link)) text)
        (kill-new text))))
  (defun farynaio/org-link-copy (&optional arg)
    "Extract URL from org-mode link and add it to kill ring."
    (interactive "P")
    (let* ((link (org-element-lineage (org-element-context) '(link) t))
           (type (org-element-property :type link))
           (url (org-element-property :path link))
           (url (concat type ":" url)))
      (kill-new url)
      (message (concat "Copied URL: " url))))

  ;; (define-key org-mode-map (kbd "C-x C-l") 'farynaio/org-link-copy)
  ;; (org-super-agenda)
(let ((org-super-agenda-groups
       '(;; Each group has an implicit boolean OR operator between its selectors.
         (:name "Today"  ; Optionally specify section name
                :time-grid t  ; Items that appear on the time grid
                :todo "TODAY")  ; Items that have this TODO keyword
         (:name "Important"
                ;; Single arguments given alone
                :tag "bills"
                :priority "A")
         ;; Set order of multiple groups at once
         (:order-multi (2 (:name "Shopping in town"
                                 ;; Boolean AND group matches items that match all subgroups
                                 :and (:tag "shopping" :tag "@town"))
                          (:name "Food-related"
                                 ;; Multiple args given in list with implicit OR
                                 :tag ("food" "dinner"))
                          (:name "Personal"
                                 :habit t
                                 :tag "personal")
                          (:name "Space-related (non-moon-or-planet-related)"
                                 ;; Regexps match case-insensitively on the entire entry
                                 :and (:regexp ("space" "NASA")
                                               ;; Boolean NOT also has implicit OR between selectors
                                               :not (:regexp "moon" :tag "planet")))))
         ;; Groups supply their own section names when none are given
         (:todo "WAITING" :order 8)  ; Set order of this section
         (:todo ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING")
                ;; Show this group at the end of the agenda (since it has the
                ;; highest number). If you specified this group last, items
                ;; with these todo keywords that e.g. have priority A would be
                ;; displayed in that group instead, because items are grouped
                ;; out in the order the groups are listed.
                :order 9)
         (:priority<= "B"
                      ;; Show this section after "Today" and "Important", because
                      ;; their order is unspecified, defaulting to 0. Sections
                      ;; are displayed lowest-number-first.
                      :order 1)
         ;; After the last group, the agenda will display items that didn't
         ;; match any of these groups, with the default order position of 99
         )))
  (org-agenda nil "a"))

)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/Dropbox/org/goals.org" "/Users/rtjoa/Dropbox/org/tag_hierarchy.org" "/Users/rtjoa/Dropbox/org/class.org" "/Users/rtjoa/Dropbox/org/inbox.org" "/Users/rtjoa/Dropbox/org/todo.org"))
 '(package-selected-packages
   '(import-js grizzl js-doc js2-refactor multiple-cursors livid-mode nodejs-repl npm-mode skewer-mode js2-mode tern opam-switch-mode org-super-agenda dap-mode lsp-docker bui ron-mode rustic rust-mode toml-mode flycheck-pos-tip pos-tip julia-repl lsp-ivy lsp-julia julia-mode lsp-origami origami lsp-treemacs lsp-ui add-node-modules-path company-web web-completion-data counsel-css emmet-mode helm-css-scss impatient-mode simple-httpd prettier-js pug-mode sass-mode haml-mode scss-mode slim-mode tagedit web-beautify web-mode evil-org gnuplot htmlize org-cliplink org-contrib org-download org-mime org-pomodoro alert log4e gntp org-present org-category-capture org-rich-yank orgit-forge orgit adoc-mode dune flycheck-ocaml merlin-company merlin-eldoc merlin-iedit merlin ocamlformat ocp-indent utop tuareg caml forge yaml ghub closql emacsql treepy git-link git-messenger git-modes git-timemachine gitignore-templates smeargle treemacs-magit magit magit-section git-commit with-editor transient ac-ispell auto-yasnippet fuzzy ivy-yasnippet yasnippet-snippets evil-snipe helm wfnames helm-core exec-path-from-shell esh-help eshell-prompt-extras eshell-z multi-term multi-vterm shell-pop terminal-here vterm xterm-color fzf pdf-view-restore tablist counsel-projectile ivy-avy ivy-hydra ivy-purpose ivy-xref smex wgrep pdf-tools attrap cmm-mode company-cabal counsel-gtags counsel swiper ivy dante lcr company eldoc xref flycheck-haskell ggtags haskell-snippets yasnippet helm-gtags helm-hoogle hindent hlint-refactor lsp-haskell haskell-mode lsp-mode markdown-mode ws-butler writeroom-mode winum which-key volatile-highlights vim-powerline vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org term-cursor symon symbol-overlay string-inflection string-edit spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline-all-the-icons space-doc restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless multi-line macrostep lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-descbinds helm-ag google-translate golden-ratio font-lock+ flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-ediff evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t)
 '(org-agenda-done ((t :foreground "gray45")))
 '(org-done ((t :foreground "SeaGreen3")))
 '(org-imminent-deadline ((t :foreground "#ff628b" :bold t)))
 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 '(org-priority ((t :foreground "blue")))
 '(org-todo ((t :foreground "darkgray" :background "unspecified")))
 '(org-todo-HOT ((t :weight utra-bold)))
 '(org-upcoming-deadline ((t :foreground "mediumpurple2" :bold t)))
 '(org-upcoming-distant-deadline ((t :foreground "default"))))
)
