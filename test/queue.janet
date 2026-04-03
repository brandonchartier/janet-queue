(import ../queue)

(def *queue* (queue/new))

(queue/enqueue *queue* "a")
(assert (deep= *queue* @{:size 1 :tail @{:data "a"} :head @{:data "a"}}))

(queue/enqueue *queue* "b")
(assert (deep= *queue* @{:size 2 :tail @{:data "b"} :head @{:data "a" :next @{:data "b"}}}))

(queue/enqueue *queue* "c")
(assert (deep= *queue* @{:size 3 :tail @{:data "c"} :head @{:data "a" :next @{:data "b" :next @{:data "c"}}}}))

(def a (queue/dequeue *queue*))
(assert (deep= a "a"))
(assert (deep= *queue* @{:size 2 :tail @{:data "c"} :head @{:data "b" :next @{:data "c"}}}))

(def b (queue/dequeue *queue*))
(assert (deep= b "b"))
(assert (deep= *queue* @{:size 1 :tail @{:data "c"} :head @{:data "c"}}))

(def c (queue/dequeue *queue*))
(assert (deep= c "c"))
(assert (deep= *queue* @{:size 0}))

(def d (queue/dequeue *queue*))
(assert (deep= d nil))
(assert (deep= *queue* @{:size 0}))

# peek
(def q (queue/new))
(assert (nil? (queue/peek q)) "peek empty")
(queue/enqueue q "x")
(assert (= "x" (queue/peek q)) "peek returns head")
(assert (= "x" (queue/peek q)) "peek does not remove")

# empty?
(assert (not (queue/empty? q)) "not empty after enqueue")
(queue/dequeue q)
(assert (queue/empty? q) "empty after dequeue")

# size
(def q2 (queue/new))
(assert (= 0 (queue/size q2)) "size empty")
(queue/enqueue q2 "a")
(assert (= 1 (queue/size q2)) "size after enqueue")

# from
(def q3 (queue/from ["x" "y" "z"]))
(assert (= 3 (queue/size q3)) "from size")
(assert (= "x" (queue/dequeue q3)) "from order first")
(assert (= "y" (queue/dequeue q3)) "from order second")
(assert (= "z" (queue/dequeue q3)) "from order third")

(print "All tests passed.")
