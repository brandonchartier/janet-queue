(defn- node [data]
  @{:data data
    :next nil})

(defn new []
  @{:head nil
    :tail nil
    :size 0})

(defn enqueue [queue data]
  (let [n (node data)]
    (update queue :size inc)
    (if (nil? (queue :tail))
      (do
        (put queue :head n)
        (put queue :tail n))
      (do
        (put-in queue [:tail :next] n)
        (put queue :tail n)))
    (queue :size)))

(defn dequeue [queue]
  (when-let [head (queue :head)]
    (update queue :size dec)
    (put queue :head (head :next))
    (when (zero? (queue :size))
      (put queue :tail nil))
    (head :data)))

(defn peek [queue]
  (when-let [head (queue :head)]
    (head :data)))

(defn empty? [queue]
  (zero? (queue :size)))

(defn size [queue]
  (queue :size))

(defn from [items]
  (let [q (new)]
    (each item items
      (enqueue q item))
    q))
