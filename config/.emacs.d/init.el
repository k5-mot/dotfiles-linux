;;;
;;; Package Manager
;;; https://qiita.com/sijiaoh/items/057b682dd29fbbdadd52
;;;
(require 'package)
(setq package-user-dir "~/.cache/emacs/package/elpa/")
(setq package-archives
  '(("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")
    ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
    t
    (if (or (assoc package package-archive-contents) no-refresh)
      (if (boundp 'package-selected-packages)
        ;; Record this as a package the user installed explicitly
        (package-install package nil)
        (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))
(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
    (require-package package min-version no-refresh)
    (error
      (message "Couldn't install optional package `%s': %S" package err)
      nil)))


;;;
;;; General Configuration
;;;
;; 言語環境の設定
(set-language-environment "Japanese")
;; 文字コードの設定
(prefer-coding-system 'utf-8)
;; ファイル名の文字コードの設定
; (set-file-name-coding-system 'utf-8)
;; キーボードの文字コードの設定
; (set-keyboard-coding-system 'utf-8)
;; ターミナルの文字コードの設定
; (set-terminal-coding-system 'utf-8)
;; スタートアップ画面を表示しないようにする
(setq initial-scratch-message nil)
;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)
;; splash screenを無効にする
(setq inhibit-splash-screen t)
;; バックアップファイル(*.~)を作る
(setq make-backup-files t)
;; バックアップディレクトリを設定
(setq backup-directory-alist '((".*" . "~/.cache/emacs/backup")))
;; 自動保存ファイル(*.#*)を作る
(setq auto-save-default t)
;; 自動保存ディレクトリを設定
(setq auto-save-file-name-transforms '(("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "~/.cache/emacs/autosave/\\2" t)))
;; 自動保存リストファイルを設定
(setq auto-save-list-file-prefix "~/.cache/emacs/auto-save-list")
;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)
;; 改行コードを表示する
; (setq eol-mnemonic-dos "(CRLF)")
; (setq eol-mnemonic-mac "(CR)")
; (setq eol-mnemonic-unix "(LF)")
;; エラー音をならなくする
(setq ring-bell-function 'ignore)
;; タブインデントのサイズ
(setq default-tab-width 2)
;; タイトルにフルパス表示
(setq frame-title-format "%f")
;; スクロールは 1 行ごと
(setq mouse-wheel-scroll-amount '(5
  ((shift) . 1)
  ((control) . 20)
))
;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)
;; スクロールのステップ量
; (setq scroll-conservatively 1)
(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 1)
;; スクロールのマージン
(setq scroll-margin 5)
;; ページスクロールの重複設定
(setq next-screen-context-lines 5)
;; ページスクロールのカーソル位置の設定
(setq scroll-preserve-screen-position t)
;; "yes or no" の選択を "y or n" にする
(defalias 'yes-or-no-p 'y-or-n-p)
;; バックグラウンドの透過率の設定
; (add-to-list 'default-frame-alist '(alpha . (0.9 0.9)))
;; メニューバーを非表示
(if (not window-system) (menu-bar-mode -1))
;; ツールバーを非表示
(if (not window-system) (tool-bar-mode -1))
;; ステータスバーに行数・列数を表示
(line-number-mode t)
(column-number-mode t)
;; 時間も表示
(display-time)
;; 行数を表示する
(global-linum-mode t)
(setq linum-format "%3d ")
;; カーソルの点滅をやめる
(blink-cursor-mode 0)
;; 現在いる行を目立たせる
; (global-hi-line-mode)
;; 対応する括弧をハイライト
(show-paren-mode t)
;; 画面内に対応する括弧がある場合は括弧だけを、ない場合は括弧で囲まれた部分をハイライト
(setq show-paren-style 'mixed)
;; リージョンのハイライト
(transient-mark-mode t)
;; スペース、タブなどを可視化する
; (global-whitespace-mode 1)
;; シフト＋矢印で範囲選択
; (setq pc-select-selection-keys-only t)
; (pc-selection-mode 1)
;; C-kで行全体を削除する
(setq kill-whole-line t)


;;;
;;; Package Configuration
;;;

;; テーマを設定する
;(load-theme 'manoj-dark t)
;; モードラインのカスタム
; (require 'moody)
; (setq x-underline-at-descent-line t)
; (moody-replace-mode-line-buffer-identification)
; (moody-replace-vc-mode)
