(require 'org)
      ;; make org-*-goto-last-stored behave well with xref stack
      (defun my-org-refile-goto-last-stored-xref-push-advice (&rest args)
        (xref-push-marker-stack))
      (advice-add #'org-refile-goto-last-stored :before #'my-org-refile-goto-last-stored-xref-push-advice)
      (advice-add #'org-capture-goto-last-stored :before #'my-org-refile-goto-last-stored-xref-push-advice)
