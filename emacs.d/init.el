(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(load-theme 'wombat)


(set-face-attribute 'default nil :height 150)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")

(require 'evil)
(evil-mode 0)
