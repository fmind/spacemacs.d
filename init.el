;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Configuration layers declaration."
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
   dotspacemacs-enable-lazy-installation nil
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation nil
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path `("~/.spacemacs.d/")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '((auto-completion :variables
                      ;; tips
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage nil
                      ;; keys
                      auto-completion-tab-key-behavior nil
                      auto-completion-return-key-behavior nil
                      ;; snippets
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets")
     (clojure :variables
              clojure-enable-fancify-symbols t)
     csv
     emacs-lisp
     deft
     git
     github
     html
     ;; ipython-notebook
     markdown
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-projectile-file "~/Notes/TODO.org")
     plantuml
     (python :variables
             python-test-runner 'pytest)
     racket
     restclient
     search-engine
     (shell :variables
            shell-default-height 30
            shell-default-shell 'eshell
            shell-default-full-span nil
            shell-protect-eshell-prompt t
            shell-default-position 'bottom)
     (spell-checking :variables
                     spell-checking-enable-by-default nil
                     spell-checking-enable-auto-dictionary t)
     sql
     (syntax-checking :variables
                      syntax-checking-enable-tooltips t
                      syntax-checking-enable-by-default t)
     (version-control :variables
                      version-control-global-margin t
                      version-control-diff-tool 'diff-hl)
   vinegar)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(atomic-chrome conda disk-usage)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(auto-compile)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization function."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 10
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style '(hybrid :variables
                                       hybrid-mode-default-state 'normal
                                       hybrid-mode-enable-hjkl-bindings t
                                       hybrid-mode-enable-evilified-state t)
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; Example for 5 recent files and 7 projects: '((recents . 5) (projects . 7))
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; (default nil)
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 10)
                                (bookmarks . 10))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(tsdh-light
                         tsdh-dark
                         monokai
                         leuven)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 15
                               :width normal
                               :weight normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ";"
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m"
   dotspacemacs-major-mode-emacs-leader-key "M-;"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "fmind"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
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
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative 'relative
                               :size-limit-kb 1000
                               :disabled-for-modes dired-mode doc-view-mode pdf-view-mode)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code."
  (setq vc-follow-symlinks t)
  (setq exec-path-from-shell-check-startup-files nil))

(defun dotspacemacs/user-config ()
  "Configuration function for user code."
  (use-package atomic-chrome
    :defer t
    :init
    (progn
      (atomic-chrome-start-server)
      (setq atomic-chrome-buffer-open-style 'frame
            atomic-chrome-default-major-mode 'org-mode
            atomic-chrome-url-major-mode-alist '(("github\\.com" . gfm-mode)
                                                 ("localhost" . python-mode)))))
  (progn ;; clojure
    (setq cider-save-file-on-load t
          cider-repl-use-pretty-printing t
          cider-repl-display-help-banner nil
          cider-repl-history-file "~/.cider.log"
          cider-show-error-buffer 'except-in-repl
          cider-repl-pop-to-buffer-on-connect 'display-only)
    (spacemacs/set-leader-keys-for-major-mode 'clojure-mode
      "a" 'cider-restart
      ";" 'cider-load-buffer
      "n" 'cider-repl-set-ns))
  (use-package conda
    :defer t
    :init
    (progn
      (conda-env-initialize-interactive-shells)
      (conda-env-autoactivate-mode t)
      (conda-env-initialize-eshell)))
  (progn ;; deft
    (setq deft-directory "~/Notes/"
          deft-extensions '("org")))
  (progn ;; disk-usage
    (spacemacs/set-leader-keys "af" 'disk-usage))
  (progn ;; emacs
    (setq scroll-margin 10)
    (global-company-mode t)
    (global-hl-line-mode -1)
    (global-visual-line-mode t)
    (defun kill-buffer-and-window ()
      "Kill the buffer with window."
      (interactive)
      (kill-this-buffer)
      (delete-window))
    (spacemacs/set-leader-keys
      "wq" 'kill-buffer-and-window)
    (add-hook 'focus-out-hook (lambda () (save-some-buffers t))))
  (progn ;; evil
    (define-key evil-normal-state-map "gl" 'spacemacs/evil-search-clear-highlight))
  (progn ;; eww
    (setq browse-url-browser-function 'eww-browse-url
          eww-search-prefix "https://duckduckgo.com/lite?q=")
    (spacemacs/set-leader-keys "." 'eww)
    (evil-define-key 'normal eww-mode-map
      "O" 'eww
      "R" 'eww-reload
      "Q" 'quit-window
      "F" 'ace-link-eww
      "D" 'eww-download
      "P" 'eww-readable
      "S" 'eww-view-source
      "C" 'url-cookie-list
      "H" 'eww-back-url
      "L" 'eww-forward-url
      "U" 'eww-up-url
      "T" 'eww-top-url
      "]" 'eww-next-url
      "[" 'eww-previous-url
      "Y" 'eww-copy-page-url
      "I" 'eww-browse-with-external-browser))
  ;; (progn ;; ipython-notebook
  ;;   (spacemacs/set-leader-keys
  ;;     "ay" 'ein:notebooklist-login
  ;;     "ar" 'python-start-or-switch-repl)
  ;;   (spacemacs/set-leader-keys-for-major-mode 'ein:notebook-multilang-mode-map
  ;;     "s" 'ein:notebook-save-notebook-command) ;; fix a bug in master version
  ;;   (evil-define-key 'hybrid ein:notebook-multilang-mode-map
  ;;     (kbd "<C-return>") 'ein:worksheet-execute-cell
  ;;     (kbd "<S-return>") 'ein:worksheet-execute-cell-and-goto-next))
  (progn ;; ispell
    (setq ispell-dictionnary "en,fr"
          ispell-program-name "hunspell"
          ispell-hunspell-dict-paths-alist '(("en" "~/.spacemacs.d/dicts/en.aff")
                                              "fr" "~/.spacemacs.d/dicts/fr.aff")))
  (progn ;; mac
    (setq mac-command-modifier 'control))
  (progn ;; magit
    (setq magit-repository-directories '(("~/Projects/" . 1))
          magit-repolist-columns '(("Name" 20 magit-repolist-column-ident ())
                                   ("Branch" 10 magit-repolist-column-branch ())
                                   ("Version" 12 magit-repolist-column-version ())
                                   ("D" 1 magit-repolist-column-dirty ())
                                   ("L<U" 3 magit-repolist-column-unpulled-from-upstream ((:right-align t)))
                                   ("L>U" 3 magit-repolist-column-unpushed-to-upstream ((:right-align t)))
                                   ("Path" 99 magit-repolist-column-path ())))
    (defun magit-kill-all-buffers ()
      "Kill all alive magit buffers."
      (interactive)
      (kill-matching-buffers "^magit: " nil t)
      (kill-matching-buffers "^magit-process: " nil t)
      (kill-matching-buffers "^\\*Magit Repositories\\*$" nil t))
    (defun magit-fetch-all-repositories ()
      "Fetch known repository with magit."
      (interactive)
      (dolist (repo (magit-list-repos))
        (let ((default-directory repo))
          (magit-fetch-all (magit-fetch-arguments)))))
    (spacemacs/set-leader-keys
      "gq" 'magit-kill-all-buffers
      "gj" 'magit-list-repositories
      "ga" 'magit-fetch-all-repositories))
  (progn ;; proced
    (spacemacs/set-leader-keys "at" 'proced)
    (add-hook 'proced-mode-hook (lambda nil (proced-toggle-auto-update 1))))
  (progn ;; projectile
    (setq projectile-switch-project-action 'projectile-dired))
  (progn ;; prompt
    (fset 'yes-or-no-p 'y-or-n-p))
  (progn ;; python
    (setq python-shell-interpreter "ipython")
    (spacemacs/set-leader-keys-for-major-mode 'python-mode
      ";" 'python-shell-send-buffer))
  (progn ;; racket
    (evil-set-initial-state 'racket-repl-mode 'insert)
    (spacemacs/set-leader-keys-for-major-mode 'racket-mode
      ";" 'racket-run
      ":" 'racket-run-and-switch-to-repl))
  (progn ;; search-engine
    (engine-mode t)
    (defengine thesaurus "https://thesaurus.com/browse/%s")
    (defengine duckduckgo "https://duckduckgo.com/lite?kl=us-en&q=%s")
    (defengine google "https://www.google.com/search?hl=en&gl=en&q=%s")
    (spacemacs/set-leader-keys
      "su" 'engine/search-github
      "so" 'engine/search-google
      "sd" 'engine/search-thesaurus
      "sw" 'engine/search-wikipedia
      "s;" 'engine/search-duckduckgo
      "sn" 'engine/search-stack-overflow))
  (progn ;; shell
    (setq eshell-banner-message ""
          eshell-prompt-function (lambda nil
                                   (concat
                                    (propertize (user-login-name) 'face `(:foreground "red"))
                                    (propertize " at " 'face `(:foreground "black"))
                                    (propertize (system-name) 'face `(:foreground "green"))
                                    (propertize " in " 'face `(:foreground "black"))
                                    (propertize (if (string= (eshell/pwd) (getenv "HOME"))
                                                    "~" (eshell/basename (eshell/pwd)))
                                                'face `(:foreground "royal blue"))
                                    (propertize " λ "'face `(:foreground "black")))))
    (evil-set-initial-state 'eshell-mode 'insert)
    (spacemacs/set-leader-keys
      "`" 'ielm
      "as" 'spacemacs/shell-pop-ansi-term))
  (progn ;; spacemacs
    (setq spacemacs-layouts-directory "~/.spacemacs.d/layouts/")
    (defun switch-to-messages-buffer ()
      (interactive)
      (switch-to-buffer "*Messages*"))
    (spacemacs/set-leader-keys
      "b!" 'switch-to-messages-buffer
      "=" 'spacemacs/workspaces-transient-state/body))
  (progn ;; yasnippet
    (setq yas-snippet-dirs '("~/.spacemacs.d/snippets"))
    (spacemacs/set-leader-keys
      "ir" 'yas-reload-all
      "is" 'yas/visit-snippet-file)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ein polymode deferred anaphora sql-indent restclient-helm ob-restclient ob-http csv-mode company-restclient restclient know-your-http-well yapfify xterm-color ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit stickyfunc-enhance srefactor spaceline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters racket-mode pyvenv pytest pyenv-mode py-isort pug-mode popwin plantuml-mode pip-requirements persp-mode pdf-tools pcre2el pbcopy paradox ox-reveal ox-gfm osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum live-py-mode linum-relative link-hint launchctl indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elisp-slime-nav dumb-jump disk-usage diminish diff-hl deft define-word cython-mode conda company-web company-statistics company-quickhelp company-anaconda column-enforce-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile atomic-chrome aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
