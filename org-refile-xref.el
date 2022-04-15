(require 'org-refile)
;; make org-*-goto-last-stored behave well with xref stack
(defun org-refile-xref-goto-last-stored-xref-push-advice (&rest args)
  (xref-push-marker-stack))
(advice-add #'org-refile-goto-last-stored :before #'org-refile-xref-goto-last-stored-xref-push-advice)
(advice-add #'org-capture-goto-last-stored :before #'org-refile-xref-goto-last-stored-xref-push-advice)

(defun org-refile-xref-remove-advice ()
  (interactive)
  (advice-remove #'org-refile-goto-last-stored #'org-refile-xref-goto-last-stored-xref-push-advice)
  (advice-remove #'org-capture-goto-last-stored #'org-refile-xref-goto-last-stored-xref-push-advice))

(provide 'org-refile-xref)
