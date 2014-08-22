import groovy.transform.Memoized
import groovy.transform.TailRecursive

class LongestCollatzSequence {

    public static void main(String[] args) {
        def start = System.nanoTime()

        def longestCollatzSequence
        longestCollatzSequence = { Long startingNumber = 1, Long currentNumber = 1, Map longestSequence = [:] ->
            if (startingNumber == 1000000) {
                println "SUCCESS: Longest sequence starts with is ${longestSequence.number} and has length of ${longestSequence.length}"
                println "Sequence: ${longestSequence.sequence}"
                println "Time taken: ${(System.nanoTime() - start) / 1000000000} seconds"
                return
            }

            if (startingNumber % 50000 == 0) {
                println "INFO: Current number: $startingNumber"
                println "INFO: Longest sequence so far starts with ${longestSequence.number} and has length of ${longestSequence.length}"
                println "INFO: Heap size: ${Runtime.runtime.freeMemory() / (1024 * 1024)} MB"
                println ''
            }

            def sequence = calculateSequence(currentNumber)
            if (sequence.size() > longestSequence.length) {
                longestSequence.length = sequence.size()
                longestSequence.number = startingNumber
                longestSequence.sequence = sequence
            }

            trampoline(startingNumber + 1, startingNumber + 1, longestSequence)
        }.trampoline()

        longestCollatzSequence()
    }

    @TailRecursive
    @Memoized(maxCacheSize = 100000)
    private static List calculateSequence(Long currentNumber, List cache = []) {
        cache << currentNumber
        if (currentNumber != 1) {
            def nextNumber = currentNumber % 2 == 0 ? (currentNumber / 2) : (3 * currentNumber + 1)
            calculateSequence(nextNumber as Long, cache)
        } else {
            cache
        }
    }
}
