(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("0c49a9e22e333f260126e4a48539a7ad6e8209ddda13c0310c8811094295b3a3" "0c16196dfb88938657f746026375595581bfb1a4388dbc6d3bc321f4d2b30609" "7ca8dd5a4960f9c2a528751b1eb3765489d0010cd63a43fbecd43babbf07ce6d" "7cbae9092a2138833ec757bd7547111bc29daf10cec8013f1b51d359ba547c99" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; thenmes
;; atome theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/atom-one-dark-theme/")
;;(load-theme 'atom-one-dark)
;;(load-theme 'wombat)
(load-theme 'manoj-dark)

;; evil mode
(add-to-list 'load-path "~/.emacs.d/evil") ;;no need with 24
(require 'evil)
(evil-mode 1)

(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l")   'windmove-right)
(global-set-key (kbd "C-c k")   'windmove-up)
(global-set-key (kbd "C-c j")   'windmove-down)
(global-set-key (kbd "C-c \\")  'kill-buffer)

;; hide menu bar
(menu-bar-mode -1)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
