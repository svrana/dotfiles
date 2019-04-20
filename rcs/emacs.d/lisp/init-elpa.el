(require 'package)

;;; Standard package repositories
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))

;(setq package-pinned-packages '((gtags . "marmalade"))

;; Don't do this, because we already did it (in init.el)
(setq package-enable-at-startup nil)

(provide 'init-elpa)
