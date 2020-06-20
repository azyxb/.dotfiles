;; .emacs
;;         ___           ___           ___           ___           ___     
;;        /\  \         /\__\         /\  \         /\  \         /\  \    
;;       /::\  \       /::|  |       /::\  \       /::\  \       /::\  \   
;;      /:/\:\  \     /:|:|  |      /:/\:\  \     /:/\:\  \     /:/\ \  \  
;;     /::\~\:\  \   /:/|:|__|__   /::\~\:\  \   /:/  \:\  \   _\:\~\ \  \ 
;;    /:/\:\ \:\__\ /:/ |::::\__\ /:/\:\ \:\__\ /:/__/ \:\__\ /\ \:\ \ \__\
;;    \:\~\:\ \/__/ \/__/~~/:/  / \/__\:\/:/  / \:\  \  \/__/ \:\ \:\ \/__/
;;     \:\ \:\__\         /:/  /       \::/  /   \:\  \        \:\ \:\__\  
;;      \:\ \/__/        /:/  /        /:/  /     \:\  \        \:\/:/  /  
;;       \:\__\         /:/  /        /:/  /       \:\__\        \::/  /   
;;        \/__/         \/__/         \/__/         \/__/         \/__/    

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d")
(load-theme 'mythe t)

;; to hide menu-bar, you can show it with M-x menu-bar-mode RET
(menu-bar-mode -1)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(fringe-mode 0 nil (fringe))
 '(global-display-line-numbers-mode t)
 '(line-number-mode nil)
 '(package-selected-packages (quote (djvu)))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "xos4 terminus" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

;;start with emacs splited
;;(defun split-my-way()
;;(interactive)
;;(split-window-right)
;;(other-window -1)
;;(eshell)
;;)

;;(call-interactively 'split-my-way)

;;;(global-set-key (kbd "<C-up>") 'shrink-window)
;;;(global-set-key (kbd "<C-down>") 'enlarge-window)
;;;(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
;;;(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'text-mode)

;;(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq make-backup-files nil)
;; to add pading
(set-window-margins (selected-window) 2 2)
(add-to-list 'default-frame-alist '(internal-border-width . 7))
;; I prefer this mode
(delete-selection-mode 1)
;; spaces
;;;(setq-default indent-tabs-mode nil)

;; information
(setq user-full-name "Ayoub Benaddi"
      user-mail-address "benaddi@protonmail.com")

