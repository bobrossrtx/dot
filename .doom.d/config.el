;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Owen Boreham"
      user-mail-address "owenkadeboreham@gmail.com")

(setq kill-whole-line t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers 'relative)
(setq display-line-numbers-type t)

(setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-nord)

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 16)
      doom-big-font (font-spec :family "FiraCod  Nerd Font" :size 26))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(doom-dashboard-banner :inherit default)
  '(doom-dashboard-loaded :inherit default))

(setq auto-save-default t
      make-backup-files t)

;; Customize the window on startup
(setq initial-frame-alist '((top . 1) (left . 1) (width . 114) (height . 32)))

(plist-put! +ligatures-extra-symbols
  :and           nil
  :or            nil
  :for           nil
  :not           nil
  :true          nil
  :false         nil
  :int           nil
  :float         nil
  :str           nil
  :bool          nil
  :list          nil
)

(let ((ligatures-to-disable '(:true :false :int :float :str :bool :list :and :or :for :not)))
  (dolist (sym ligatures-to-disable)
    (plist-put! +ligatures-extra-symbols sym nil)))

(setq doom-modeline-enable-word-count t)

(setq confirm-kill-emacs nil)

(after! auth-source
  (setq auth-sources (nreverse auth-sources)))

(let ((alternatives '("splashes/doom/doom-emacs-bw-light.svg"
                      "splashes/doom/doom-emacs-flugo-slant_out_purple-small.png"
                      "splashes/doom/doom-emacs-flugo-slant_out_bw-small.png")))
(setq fancy-splash-image
        (concat doom-private-dir "splash/doom/"
                (nth (random (length alternatives)) alternatives))))

(setq +doom-dashboard-menu-sections (cl-subseq +doom-dashboard-menu-sections 0 2))

(add-hook! 'org-mode-hook #'mixed-pitch-mode)
(add-hook! 'org-mode-hook #'solaire-mode)
(setq mixed-pitch-variable-pitch-cursor nil)

(setq erc-server "irc.libera.chat"
      erc-nick "bobrossrtx"
      erc-user-full-name "Owen Boreham"
      erc-track-shorten-start 8
      erc-autojoin-channels-alist '(("irc-libera.chat" "#linux" "#emacs" "#systemcrafters"))
      erc-kill-buffer-on-part t
      erc-auto-query 'bury)

(load  "~/.ercpass")
(require 'erc-services)
(erc-services-mode 1)

(setq erc-prompt-for-nickserv-password nil)
(setq erc-nickserv-identify-mode 'autodetec )
(setq erc-nickserv-passwords
      '((libera  (("bobrossrtx" . ,libera-bobrossrtx-pass)))))

(use-package! zig-mode
  :hook ((zig-mode . lsp-deferred))
  :custom (zig-format-on-save nil)
  :config
  (after! lsp-mode
    (add-to-list 'lsp-language-id-configuration '(zig-mode . "zig"))
    (lsp-register-client
      (make-lsp-client
        :new-connection (lsp-stdio-connection "<path to zls>")
        :major-modes '(zig-mode)
        :server-id 'zls))))

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))

;; Elfeed
(require 'elfeed-goodies)
(elfeed-goodies/setup)
(setq elfeed-goodies/entry-pane-size 0.5)
(setq elfeed-feeds
      '(
        ;; programming
        ("https://news.ycombinator.com/rss" hacker)
        ("https://www.heise.de/developer/rss/news-atom.xml" heise)
        ("https://www.reddit.com/r/programming.rss" programming)
        ("https://www.reddit.com/r/emacs.rss" emacs)

        ;; programming languages
        ("https://www.reddit.com/r/golang.rss" golang)
        ("https://www.reddit.com/r/javascript.rss" javascript)
        ("https://www.reddit.com/r/typescript.rss" typescript)
        ("https://www.reddit.com/r/clojure.rss" clojure)
        ("https://www.reddit.com/r/python.rss" python)
))
(setq-default elfeed-search-filter "@2-days-ago +unread")
(setq-default elfeed-search-title-max-width 100)
(setq-default elfeed-search-title-min-width 100)
