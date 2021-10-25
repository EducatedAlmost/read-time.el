;;; read-time.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 AlmostEducated
;;
;; Author: AlmostEducated <https://github.com/dare>
;; Maintainer: AlmostEducated <EducatedAlmost@gmail.com>
;; Created: October 25, 2021
;; Modified: October 25, 2021
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/dare/read-time
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defgroup read-time nil
  "Calculates the time needed to read something."
  :group 'help)

(defcustom read-time-words-per-sec 5
  "Your reading speed in words per second."
  :group 'read-time
  :tag "Reading speed, words per second"
  :type 'number)

(defun read-time (from to &optional words-per-sec)
  "Calculates the time required to read FROM point TO point, at speed WORDS-PER-SEC."
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (point-min) (point-max))))
  (let* ((words (count-words from to))
         (speed (or words-per-sec read-time-words-per-sec 5))
         (secs (/ words speed)))
    (message (format-seconds "%H %M %z%S" secs))))

(provide 'read-time)

;;; read-time.el ends here
