(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)


(set-face-attribute 'default nil :height 150)
 

;; keybindings
(global-set-key (kbd "C-c o") #'ff-find-other-file)
(global-set-key (kbd "C-c p") #'compile)

;; default theme fallback
(load-theme 'tango-dark)

(set-face-attribute 'default nil
                    :foreground "white")

(show-paren-mode 1)

(set-face-attribute 'show-paren-match nil
                    :background "grey30"
                    :foreground nil
                    :weight 'bold)

;; packages stuff

(setq custom-file "~/.emacs.d/custom.el")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

(setq evil-undo-system 'undo-redo)
(setq evil-want-keybinding nil)

(require 'evil)
(evil-mode 1)


(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))

(require 'evil-collection)
(evil-collection-init) 

;; corfu

(unless (package-installed-p 'corfu)
  (package-install 'corfu))

(require 'corfu)
(global-corfu-mode)

(setq corfu-auto t)
(setq corfu-auto-delay 0)
(setq corfu-auto-prefix 1)
(setq global-corfu-minibuffer nil) ;; disable corfu in evil command line

;; magit

(unless (package-installed-p 'magit)
  (package-install 'magit))

(require 'magit)

;; dracula
(unless (package-installed-p 'dracula-theme)
  (package-install 'dracula-theme))

(load-theme 'dracula t)
(set-face-attribute 'default nil
                    :background "black")

;; path completion
(setq read-file-name-completion-ignore-case t)
(setq eshell-cmpl-ignore-case t)
