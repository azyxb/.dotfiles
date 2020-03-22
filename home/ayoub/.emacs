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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (adwaita)))
 '(display-line-numbers-type (quote relative))
 '(fringe-mode 0 nil (fringe))
 '(global-display-line-numbers-mode t)
 '(line-number-mode nil)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Dina" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

;;start with emacs splited
;;(defun split-my-way()
;;(interactive)
;;(split-window-right)
;;(other-window -1)
;;(eshell)
;;)

;;(call-interactively 'split-my-way)

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'text-mode)

;;(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'sourcerer t)

(setq make-backup-files nil)
;; to hide menu-bar, you can show it with M-x menu-bar-mode
(menu-bar-mode -1) 
;; to add pading
(set-window-margins (selected-window) 2 2)
(add-to-list 'default-frame-alist '(internal-border-width . 7))
