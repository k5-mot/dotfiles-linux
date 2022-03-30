;;;
;;; Emacs Configurations
;;;   $HOME/.emacs.d/init.el
;;;

;; Add various config files.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/conf")

;; Package Manager
(load "package-manager")

;; General Settings
(load "general")

(defun window-split-vertical-to-horizontal ()
  (interactive)
  (let ((nw (window-buffer (next-window))))
    (delete-other-windows)
    (split-window-horizontally)
    (set-window-buffer (next-window) nw)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (atom-one-dark-theme gnu-elpa-keyring-update auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
