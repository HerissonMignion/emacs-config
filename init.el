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
   '(org-roam lsp-java lua-mode ccls php-mode ac-html-angular magit go-mode eglot typescript-mode yasnippet json-mode helm-xref flycheck projectile lsp-ui lsp-mode treemacs company cmake-mode agda2-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)



(use-package org-roam
  :ensure t)
(use-package company
  :ensure t)
(use-package magit
  :ensure t)
(use-package org-roam
  :ensure t)
(use-package typescript-mode
  :ensure t)
(use-package yasnippet
  :ensure t)






(global-set-key "\C-x\C-b" 'buffer-menu)
(tool-bar-mode 0)

;; (global-display-line-numbers-mode)

;; (keymap-global-set "M-." 'xref-find-definitions)
;; (global-unset-key (kbd "M-."))

;; (add-hook 'js-mode-hook
;; 	(lambda()
;; 		(local-unset-key (kbd "M-."))))

(add-hook 'js-mode-hook
	(lambda ()
		(unbind-key "M-." js-mode-map)))

;; (unbind-key "M-." js-mode-map)


;; http://xahlee.info/emacs/emacs/emacs_set_backup_into_a_directory.html
(setq make-backup-files nil)







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


;; TODO pour améliorer le support pour typescript.
;; https://redgreenrepeat.com/2018/05/04/typescript-in-emacs/


(setq dired-kill-when-opening-new-dired-buffer t)



;; scroller le buffer, et non le point, shortcut.
;; https://stackoverflow.com/questions/8993183/emacs-scroll-buffer-not-point
(global-set-key "\M-n" "\C-u4\C-v")
(global-set-key "\M-p" "\C-u4\M-v")



(tab-bar-mode)

(electric-pair-mode)

(global-company-mode)







;; ;; ajout à load-path les dossiers dans le dossier "charles"
;; (dolist (name (directory-files (concat user-emacs-directory "/charles")))
;;   (unless (or (equal name ".") (equal name ".."))
;;     ;;(print (concat user-emacs-directory "charles/" name))
;;     (add-to-list 'load-path (concat user-emacs-directory "charles/" name))
;;     )
;;   )






;; c/c++ ccls (lsp) config :
;; https://github.com/MaskRay/ccls/wiki/eglot
;; permet, en c/c++, d'avoir l'information de type pour le symbol sous le cursor.

;; (defun eglot-ccls-inheritance-hierarchy (&optional derived)
;;   "Show inheritance hierarchy for the thing at point.
;; If DERIVED is non-nil (interactively, with prefix argument), show
;; the children of class at point."
;;   (interactive "P")
;;   (if-let* ((res (jsonrpc-request
;;                   (eglot--current-server-or-lose)
;;                   :$ccls/inheritance
;;                   (append (eglot--TextDocumentPositionParams)
;;                           `(:derived ,(if derived t :json-false))
;;                           '(:levels 100) '(:hierarchy t))))
;;             (tree (list (cons 0 res))))
;;       (with-help-window "*ccls inheritance*"
;;         (with-current-buffer standard-output
;;           (while tree
;;             (pcase-let ((`(,depth . ,node) (pop tree)))
;;               (cl-destructuring-bind (&key uri range) (plist-get node :location)
;;                 (insert (make-string depth ?\ ) (plist-get node :name) "\n")
;;                 (make-text-button (+ (point-at-bol 0) depth) (point-at-eol 0)
;;                                   'action `(lambda (_arg)
;;                                             (interactive)
;;                                             (find-file (eglot--uri-to-path ',uri))
;;                                             (goto-char (car (eglot--range-region ',range)))))
;;                 (cl-loop for child across (plist-get node :children)
;;                          do (push (cons (1+ depth) child) tree)))))))
;;     (eglot--error "Hierarchy unavailable")))








;; je suis la section "Setting up Org-roam" du manuel info.
;; (make-directory "~/org-roam")

(setq org-roam-directory (file-truename "~/org-roam"))

;; (org-roam-db-autosync-enable)

;; to build the cache manually, run "M-x org-roam-db-sync"
(org-roam-db-autosync-mode)



(global-set-key (kbd "<f9> f") #'org-roam-node-find)
(global-set-key (kbd "<f9> i") #'org-roam-node-insert)
(global-set-key (kbd "<f9> c") #'org-roam-capture)








;; ;; TESTS

;; (load-file (concat user-emacs-directory "/charlestests.el"))




















