(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(modus-vivendi))
 '(ispell-dictionary nil)
 '(org-agenda-files nil)
 '(package-selected-packages
   '(eglot typescript-mode yasnippet json-mode helm-xref flycheck projectile lsp-ui lsp-mode treemacs company cmake-mode agda2-mode)))
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


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)







;; FROM HERE : https://www.emacswiki.org/emacs/EmacsNiftyTricks

;(setq ((beg -1)
;       (end -1)
;       (prev-mid -1)))
(setq beg -1)
(setq end -1)
(setq prev-mid -1)

(defun backward-binary ()
  (interactive)
  (if (/= prev-mid (point)) 
      (setq beg -1 end -1)
    (setq end prev-mid))
  (if (< beg 0) (setq beg (line-beginning-position)
		      end (point)))
  (setq prev-mid (/ (+ beg end) 2))
  (goto-char prev-mid))

(defun forward-binary ()
  (interactive)
  (if (/= prev-mid (point))
      (setq beg -1 end -1)
    (setq beg prev-mid))
  (if (< end 0) (setq beg (point)
		      end (line-end-position)))
  (setq prev-mid (/ (+ beg end ) 2))
  (goto-char prev-mid))


(global-set-key "\C-c\C-h" 'backward-binary)
(global-set-key "\C-c\C-l" 'forward-binary)


(setq inhibit-startup-message t)


































