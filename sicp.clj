;1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;1.3
(defn sum_2_large_sqs [a b c]
  (def maxes (filter (fn [x] (not (= (apply min [a b c]) x))) [a b c]))
  (+ (* (first maxes) (first maxes)) (* (second maxes) (second maxes))))

;1.7

(defn abs [value]
    (if (> value 0)
      value
      (- value)
    )
  )

(defn sqrts [guess x]
    (if (< (abs (- (* guess guess) x)) 0.01)
      guess
      (sqrts (/ (+ guess (/ x guess)) 2) x)
    )
  )

(defn sqrt [x] (sqrts 1.0 x))


;1.8
(defn cubert [x] (cuberts 1.0 x))

(defn cuberts [guess x]
  (if (< (abs (- (* guess guess guess) x)) 0.01)
    guess
    (cuberts (/ (+ (/ x (* guess guess)) (* guess 2)) 3) x)))

;1.11
(defn func [n]
  (if (< n 3)
    n
    (+ (func (- n 1)) (func (* (- n 2) 2)) (func (* (- n 3) 3)))))

;1.16
(defn square [x] (* x x))

(defn expn [a b n]
  (cond (= n 1) a
        (even? n) (expn (* a (square b)) b (/ n 2))
        :else (expn (* a b) b (- n 1))))

(defn exp [b n] (expn 1 b n))

;1.17
(defn doubl [x] (* x 2))
(defn halve [x] (/ x 2))

(defn multi [a b]
  (cond (= b 0) 0
        :else (+ (doubl a) (multi a (- b 2)))))

;1.18

(defn mult [sum a b]
  (cond (= b 0) sum
        (even? b) (mult sum (doubl a) (halve b))
        :else (mult (+ sum a) a (- b 1))))

(defn multpn [a b] (mult 0 a b))


;1.30
(defn sum [term a nex b]
  (if (> a b) 0
    (+ (term a) (sum term (nex a) nex b))))

;(defn square [x] (* x x))
;(defn cube [x] (* x x x))
;(defn incr [x] (inc x))


;1.31
(defn product [term a nex b]
  (if (> a b) 1
    (* (term a) (product term (nex a) nex b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;2.1
(defn abs [x]
  (if (< x 0) (- x)
  x))

(defn make-rat [n d]
  (if (< (* n d) 0)
  (list (- (abs n)) (abs d))
  (list (abs n) (abs d))))

(defn numer [x]
  (first x))

(defn denom [x]
  (second x))

;2.2
(defn make-point [x y]
  (list x y))

(defn x-point [p]
  (first p))

(defn y-point [p]
  (second p))

(defn midpoint-segment [p1 p2]
  (list
   (float (/ (+ (x-point p1) (x-point p2)) 2))
   (float (/ (+ (y-point p1) (y-point p2)) 2))))





































