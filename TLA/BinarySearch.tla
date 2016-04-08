--------------------------- MODULE BinarySearch2 ---------------------------
EXTENDS Integers, Sequences, TLC
CONSTANT N

Values == 0..N

isSorted(x) == \A i, j \in DOMAIN x : i <= j => x[i] <= x[j]
sortedSeq(s) == {x \in Seq(s) : isSorted(x) }
sortedSeqN(s, n) == UNION { {x \in [1..i -> s] : isSorted(x)} : i \in 0..n }

(*
--algorithm BinarySearch2 {
    variable retVal = "", index = -1;
    
    procedure BinarySearch2P (a, lst)
    variables low = 1, high = 1, mid = -1; 
    {
        begin: assert(/\ low \in DOMAIN lst
                      /\ high \in DOMAIN lst
                      /\ \/ mid = -1
                         \/ mid \in DOMAIN lst);
        low := 1 || high := Len(lst);
        main: while (low <= high) {
            mid := (low + high) \div 2;
            if (lst[mid] = a) {
                retVal := "success";
                index := mid;
                success: return;
            };
            branch: if (a < lst[mid]) {
                with (newHigh = mid - 1) {
                    assert(newHigh < high);
                    high := newHigh;
                };
            } else {
                with (newLow = mid + 1) {
                    assert(newLow > low);
                    low := newLow;
                };
            };
        };
        retVal := "failure";
        index := -1;
        assert(/\ retVal \in {"success", "failure"}
               /\ retVal = "success" <=> (index \in DOMAIN lst /\ lst[index] = a)
               /\ retVal = "failure" <=> \A i \in DOMAIN lst : lst[i] /= a);
        return;
    }
    {
        init: with(aInit \in Values, lstInit \in sortedSeqN(Values, N)) {
            if (Len(lstInit) = 0) {
                retVal := "failure";
            } else {
                call BinarySearch2P(aInit, lstInit);
            };
        };
    }
}
*)

=============================================================================