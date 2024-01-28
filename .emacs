(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(deeper-blue))
 '(ispell-dictionary nil)
 '(org-agenda-files nil)
 '(package-selected-packages '(company eglot cmake-mode agda2-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key "\C-x\C-b" 'buffer-menu)
(tool-bar-mode 0)


; (keymap-global-set "M-." 'xref-find-definitions)
; (global-unset-key (kbd "M-."))

; (add-hook 'js-mode-hook
; 	(lambda()
; 		(local-unset-key (kbd "M-."))))

(add-hook 'js-mode-hook
	(lambda()
		(unbind-key "M-." js-mode-map)))

; (unbind-key "M-." js-mode-map)


; http://xahlee.info/emacs/emacs/emacs_set_backup_into_a_directory.html
(setq make-backup-files nil)




