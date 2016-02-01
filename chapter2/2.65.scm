(define (union-set set1 set2)
  (list->tree (union-set-list (tree->list set1)
			      (tree->list set2))))

(define (intersection-set set1 set2)
  (list->tree (intersaction-set-list (tree->list set1)
				     (tree->list set2))))
