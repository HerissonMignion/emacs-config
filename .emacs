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
   '(magit go-mode eglot typescript-mode yasnippet json-mode helm-xref flycheck projectile lsp-ui lsp-mode treemacs company cmake-mode agda2-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key "\C-x\C-b" 'buffer-menu)
(tool-bar-mode 0)


;; (keymap-global-set "M-." 'xref-find-definitions)
;; (global-unset-key (kbd "M-."))

;; (add-hook 'js-mode-hook
;; 	(lambda()
;; 		(local-unset-key (kbd "M-."))))

(add-hook 'js-mode-hook
	(lambda()
		(unbind-key "M-." js-mode-map)))

;; (unbind-key "M-." js-mode-map)


;; http://xahlee.info/emacs/emacs/emacs_set_backup_into_a_directory.html
(setq make-backup-files nil)


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)







;; FROM HERE : https://www.emacswiki.org/emacs/EmacsNiftyTricks

;;(setq ((beg -1)
;;       (end -1)
;;       (prev-mid -1)))
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


(indent-tabs-mode nil)
;; (setq tab-width 4)

;; https://stackoverflow.com/questions/37105356/change-tab-width-in-emacs
(setq-default tab-width 4)
(setq-default c-default-style "k&r")
(setq-default c-basic-offset 4)


(global-set-key (kbd "M-g j") 'avy-goto-char-timer)


(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)






;; c/c++ ccls (lsp) config :
;; https://github.com/MaskRay/ccls/wiki/eglot
;; permet, en c/c++, d'avoir l'information de type pour le symbol sous le cursor. 
(defun eglot-ccls-inheritance-hierarchy (&optional derived)
  "Show inheritance hierarchy for the thing at point.
If DERIVED is non-nil (interactively, with prefix argument), show
the children of class at point."
  (interactive "P")
  (if-let* ((res (jsonrpc-request
                  (eglot--current-server-or-lose)
                  :$ccls/inheritance
                  (append (eglot--TextDocumentPositionParams)
                          `(:derived ,(if derived t :json-false))
                          '(:levels 100) '(:hierarchy t))))
            (tree (list (cons 0 res))))
      (with-help-window "*ccls inheritance*"
        (with-current-buffer standard-output
          (while tree
            (pcase-let ((`(,depth . ,node) (pop tree)))
              (cl-destructuring-bind (&key uri range) (plist-get node :location)
                (insert (make-string depth ?\ ) (plist-get node :name) "\n")
                (make-text-button (+ (point-at-bol 0) depth) (point-at-eol 0)
                                  'action `(lambda (_arg)
                                            (interactive)
                                            (find-file (eglot--uri-to-path ',uri))
                                            (goto-char (car (eglot--range-region ',range)))))
                (cl-loop for child across (plist-get node :children)
                         do (push (cons (1+ depth) child) tree)))))))
    (eglot--error "Hierarchy unavailable")))

































