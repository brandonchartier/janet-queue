# Janet Queue

A queue data structure for Janet.

`jpm install https://github.com/brandonchartier/janet-queue`

---

```janet
(import queue)

(def q (queue/new))

(queue/enqueue q "a")
(queue/enqueue q "b")
(queue/enqueue q "c")

(queue/peek q)     # "a"
(queue/empty? q)   # false

(queue/dequeue q)  # "a"
(queue/dequeue q)  # "b"
(queue/dequeue q)  # "c"
(queue/dequeue q)  # nil

(queue/empty? q)   # true
```

## License

GPL-3.0
