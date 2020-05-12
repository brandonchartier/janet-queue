# Janet Queue

`jpm install https://github.com/brandonchartier/janet-queue`

---

```
(import queue)

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
```
