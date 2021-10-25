;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Owen Boreham"
      user-mail-address "owenkadeboreham@gmail.com")

(setq kill-whole-line t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers 'relative)

(setq auto-save-default t
      make-backup-files t)

(setq confirm-kill-emacs nil)

(after! auth-source
  (setq auth-sources (nreverse auth-sources)))

(setq +doom-dashboard-menu-sections (cl-subseq +doom-dashboard-menu-sections 0 4))

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 14))

(add-hook! 'org-mode-hook #'mixed-pitch-mode)
(add-hook! 'org-mode-hook #'solaire-mode)
(setq mixed-pitch-variable-pitch-cursor nil)

(setq doom-theme 'doom-gruvbox)

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
