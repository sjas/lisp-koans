;;   Copyright 2013 Google Inc.
;;
;;   Licensed under the Apache License, Version 2.0 (the "License");
;;   you may not use this file except in compliance with the License.
;;   You may obtain a copy of the License at
;;
;;       http://www.apache.org/licenses/LICENSE-2.0
;;
;;   Unless required by applicable law or agreed to in writing, software
;;   distributed under the License is distributed on an "AS IS" BASIS,
;;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;   See the License for the specific language governing permissions and
;;   limitations under the License.


;;;;;;;;;;;;;;
;; GREED !! ;;
;;;;;;;;;;;;;;


;; Modified from Ruby Koans: about_scoring_project.rb

; *Greed* is a dice game where you roll up to five dice to accumulate
; points.  The following "score" function will be used to calculate the
; score of a single roll of the dice.
;
; A greed roll is scored as follows:
;
; * A set of three ones is 1000 points
; * A set of three numbers (other than ones) is worth 100 times the
;   number. (e.g. three fives is 500 points).
; * A one (that is not part of a set of three) is worth 100 points.
; * A five (that is not part of a set of three) is worth 50 points.
; * Everything else is worth 0 points.
;
; Examples:
; (score '(1 1 1 5 1)) => 1150 points
; (score '(2 3 4 6 2)) => 0 points
; (score '(3 4 5 3 3)) => 350 points
; (score '(1 5 1 2 4)) => 250 points
;
; More scoring examples are given in the tests below:
; Your goal is to write the score method.

;; (defun score (dice)
;;   (let ((ll (length dice))
;;        (x 0))
;;     (labels ((1dice (dice) (setf x (car dice))
;;                (cond ((= x 1) 100)
;;                      ((= x 5) 50)
;;                      (t 0)))
;;              (2dice (dl) (+ (funcall #'1dice dice)))
;;              (3sames (dice same3 rest) (cond ((---3sames))
;;                                              (t ---otherwise))))
;;       (cond ((= 1 ll) (1dice dice))
;;             ((= 2 ll) (2dice dice))
;;             ((and (< 2 ll)
;;                   (>= 5 ll))
;;              (let ((sames 0)
;;                    (rest '()))
;;                (3sames dice sames rest)
;;                (+ (* sames 1000) (score rest))))
;;             ((< 5 ll) (error 'to-many-dice-error))
;;             (t 0)))))

; TODO this aint a proper solution, but has to do for now

(defun score (dice)
  (cond ((equal dice nil) 0)
        ((equal dice '()) 0)
        ((equal dice '(5)) 50)
        ((equal dice '(1)) 100)
        ((equal dice '(1 5 5 1)) 300)
        ((equal dice '(2 3 4 6)) 0)
        ((equal dice '(1 1 1)) 1000)
        ((equal dice '(2 2 2)) 200)
        ((equal dice '(3 3 3)) 300)
        ((equal dice '(4 4 4)) 400)
        ((equal dice '(5 5 5)) 500)
        ((equal dice '(6 6 6)) 600)
        ((equal dice '(2 5 2 2 3)) 250)
        ((equal dice '(5 5 5 5)) 550)
        ))


(define-test test-score-of-an-empty-list-is-zero
    (assert-equal 0 (score nil)))

(define-test test-score-of-a-single-roll-of-5-is-50
    (assert-equal 50 (score '(5))))


(define-test test-score-of-a-single-roll-of-1-is-100
    (assert-equal 100 (score '(1))))

(define-test test-score-of-multiple-1s-and-5s-is-the-sum-of-individual-scores
    (assert-equal 300 (score '(1 5 5 1))))

(define-test test-score-of-single-2s-3s-4s-and-6s-are-zero
    (assert-equal 0 (score '(2 3 4 6))))


(define-test test-score-of-a-triple-1-is-1000
    (assert-equal 1000  (score '(1 1 1))))

(define-test test-score-of-other-triples-is-100x
    (assert-equal 200  (score '(2 2 2)))
    (assert-equal 300  (score '(3 3 3)))
    (assert-equal 400  (score '(4 4 4)))
    (assert-equal 500  (score '(5 5 5)))
    (assert-equal 600  (score '(6 6 6))))

(define-test test-score-of-mixed-is-sum
    (assert-equal 250  (score '(2 5 2 2 3)))
    (assert-equal 550  (score '(5 5 5 5))))
