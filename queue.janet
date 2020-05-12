(defn- node [data]
  @{:data data
    :next nil})

(defn new []
  @{:head nil
    :tail nil
    :size 0})

(defn queue-empty? [queue]
  (= (queue :size) 0))

(defn enqueue [queue data]
  (let [n (node data)]
    (if (nil? (queue :tail))
      (do
        (put queue :head n)
        (put queue :tail n))
      (do
        (put-in queue [:tail :next] n)
        (put queue :tail n)))
    (update queue :size inc)))

(defn dequeue [queue]
  (when-let [head (queue :head)]
    (put queue :head (get-in queue [:head :next]))
    (update queue :size dec)
    (when (queue-empty? queue)
      (put queue :tail nil))
    (head :data)))
