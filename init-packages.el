;; File: init-packages.el
;; Installs any needed packages (usually only on first run).
;; Code adapted from prelude.el setup.

;; Required for running this code.
(require 'cl)
(require 'package)

;; Add the Melpa repository to the list of package sources
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Initialise the package system.
(package-initialize)

;; Define what packages are required from package.el.
(defvar required-packages
  '(graphene multiple-cursors)
  "A list of packages to ensure are installed at launch.")

(defun required-packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (required-packages-installed-p)
  ;; Prevent auto-save-list while installing.
  (setq auto-save-list-file-name nil)
  
  ;; Check for new packages (package versions)
  (message "%s" "Updating package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; Install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'init-packages)