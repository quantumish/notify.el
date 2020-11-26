(setq notif-stack '())

(defun create-text-notif (string)
  (setq notif-stack (cons (+ (length notif-stack) 1) notif-stack))
  (defun temp-poshandler (_info)
    '(-15 . (+ 15 (* 90 (car notif-stack)))))
  (when (posframe-workable-p)
    (posframe-show (concat "notif" (number-to-string (car notif-stack)))
                 :string string
                 :poshandler 'temp-poshandler
                 :height 4
                 :left-fringe 3
                 :right-fringe 3
                 :width 50
                 :timeout 10
                 :min-width 50
                 :min-height 4
                 :internal-border-color "black"
                 :internal-border-width 1))
  )
  
    
(create-text-notif "test")
