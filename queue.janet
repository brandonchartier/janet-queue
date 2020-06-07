(defn- node [data]
  @{:data data
    :next nil})

(defn new []
  @{:head nil
    :last nil
    :size 0})

(defn enqueue [queue data]
  (let [n (node data)]
    (update queue :size inc)
    (if (nil? (queue :last))
      (do
        (put queue :head n)
        (put queue :last n))
      (do
        (put-in queue [:last :next] n)
        (put queue :last n)))
    (queue :size)))

(defn dequeue [queue]
  (when-let [head (queue :head)]
    (update queue :size dec)
    (put queue :head (get-in queue [:head :next]))
    (when (zero? (queue :size))
      (put queue :last nil))
    (head :data)))
