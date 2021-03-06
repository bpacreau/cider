(require 'nrepl-client)

(ert-deftest dict-merge ()
  (let ((input '(dict 2 4 1 2 "10" "90" "a" "b")))
    (should (equal (nrepl-dict-merge input '(dict 1 3 "10" me))
                   '(dict 2 4 1 3 "10" me "a" "b")))
    (should (equal input '(dict 2 4 1 3 "10" me "a" "b"))))
  (should (equal (nrepl-dict-merge nil '(dict 1 3 "10" me))
                 '(dict 1 3 "10" me)))
  (should (equal (nrepl-dict-merge '(dict 1 3 "10" me) nil)
                 '(dict 1 3 "10" me))))
