;; -*- lexical-binding: t; -*-
;;Org: Hide Leading Stars
(defun org-mode-remove-stars ()
  (font-lock-add-keywords
   nil
   '(("^\\*+ "
      (0
       (prog1 nil
         (put-text-property (match-beginning 0) (match-end 0)
                            'invisible t)))))))

(add-hook 'org-mode-hook #'org-mode-remove-stars)

;;Org Normalize Headers Size
(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)

(setq org-html-validation-link nil)
(setq org-startup-indented nil)

;; Capture - Simple
(setq in-file "~/docs/brain/in.org")
(setq org-capture-templates
      '(

        ("s" "Simple" entry (file in-file)
         "* %^{Title}\n- Saved: %T\n%?")

        ("f" "File ref" entry (file in-file)
         "* %^{Title}\n- Saved: %T\n- File: %a\n%?")

        ("m" "Mail" entry (file in-file)
         "* %^{Title}
\t- Saved: %T
\t- File: %a
\t- From: %:from
\t%?")

        ))

(setq org-refile-targets
      '(("~/docs/brain/in.org" :maxlevel . 1)
        ("~/docs/brain/next.org" :maxlevel . 1)
        ("~/docs/brain/projects.org" :maxlevel . 2)
        ("~/docs/brain/someday.org" :maxlevel . 1)
        ("~/docs/brain/reference.org" :maxlevel . 1)
        ("~/docs/brain/waiting.org" :maxlevel . 1)))
(setq org-refile-use-outline-path 'file)


(provide 'org)
;;; org ends here
