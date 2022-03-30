;;;
;;; Package Manager
;;;

;; Use package.el
(require 'package)

;; Load package archives via HTTP
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages") t)

;; Initialize package.el
(package-initialize)

;; Get package updates.
(unless package-archive-contents (package-refresh-contents)) 

;; Package list
(defvar install-package-list
  '(auto-complete
    fuzzy
    popup
    pos-tip
    zenburn-theme
    spaceline)
  "Packages to be already installed")
;; atom-one-dark-theme

;; Install package if not be installed
(dolist (pkg install-package-list)
  (unless (package-installed-p pkg)
    (package-install pkg)))


;;;
;;; Package Configuration
;;; 

;; saveplace
;; カーソル位置の保存
(require 'saveplace)
(save-place-mode 1)

;; linum
;; 左側に行番号表示をする
(require 'linum)
(global-linum-mode t)
(setq linum-format "%3d ")
;; line number を分かりやすくする
(set-face-attribute 'linum nil
  :foreground "#a9a9a9"
  :background "#404040"
  :height 0.9)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)          ;; 曖昧マッチ
(setq ac-delay 0.05)
(setq ac-auto-show-menu 0.05)

;; 
(require 'spaceline-config)
(spaceline-spacemacs-theme)
