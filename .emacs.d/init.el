(unless (and (>= emacs-major-version 29)
             (= emacs-minor-version 3))
 (error "This config requires Emacs 29.3"))


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

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; evil

(setq evil-undo-system 'undo-redo)
(setq evil-want-keybinding nil)

(straight-use-package 'evil-collection)
(require 'evil)
(evil-mode 1)
(require 'evil-collection)
(evil-collection-init) 

;; corfu

(straight-use-package 'corfu)

(require 'corfu)

(global-corfu-mode)
(add-hook 'eshell-mode-hook (lambda () (corfu-mode -1)))

(setq corfu-auto t)
(setq corfu-auto-delay 0)
(setq corfu-auto-prefix 1)
(setq global-corfu-minibuffer nil) ;; disable corfu in evil command line

;; magit

(straight-use-package 'magit)

(require 'magit)

;; dracula
(straight-use-package 'dracula-theme)

(load-theme 'dracula t)
(set-face-attribute 'default nil
                    :background "black")

;; path completion
(setq read-file-name-completion-ignore-case t)
(setq eshell-cmpl-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;; tweak eglot

(setq eldoc-echo-area-use-multiline-p nil)

;; backups

(setq backup-directory-alist
      '(("." . "~/.emacs.d/backups")))

(setq version-control t    
      kept-new-versions 10
      kept-old-versions 2
      delete-old-versions t)

(setq enable-recursive-minibuffers t) ; fix bottom bar getting stuck
