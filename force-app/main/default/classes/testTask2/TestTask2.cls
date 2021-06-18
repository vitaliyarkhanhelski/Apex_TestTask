public with sharing class TestTask2 {

    static Integer minPositive;
    static Integer minPositiveCounter;
    static Integer minNegative;
    static Integer minNegativeCounter;
    
    public static List<Integer> provideResult (List<Integer> numbers) {
        minPositive = 0;
        minPositiveCounter = 0;
        minNegative = 0;
        minNegativeCounter = 0;
        if (numbers == null || numbers.isEmpty()) {
            return null;
        }
        for(Integer i : numbers) {
            if (i == 0) {
                return new List<Integer>{0};
            }
            if (populateFirstValues(i)) {
                continue;
            }
            if (i > 0) {
                populateValue(i, true);
            }
            else {
                populateValue(i, false);
            }
        }
        return prepareResultList();
    }

    private static Boolean populateFirstValues(Integer i) {
        if (minPositiveCounter == 0 && i > 0) {
            minPositive = i;
            minPositiveCounter++;
            return true;
        }
        if (minNegativeCounter == 0 && i < 0) {
            minNegative = i;
            minNegativeCounter++;
            return true;
        }
        return false;
    }

    private static void populateValue(Integer i, Boolean isPositive) {
        if (isPositive) {
            populatePositive(i);
        } else {
            populateNegative(i);
        }
    }

    private static void populatePositive(Integer i) {
        if (i == minPositive) {
            minPositiveCounter++;
        }
        if (i < minPositive) {
            minPositive = i;
            minPositiveCounter = 1;
        }
    }

    private static void populateNegative(Integer i) {
        if (i == minNegative) {
            minNegativeCounter++;
        }
        if (i > minNegative) {
            minNegative = i;
            minNegativeCounter = 1;
        }
    }

    private static List<Integer> prepareResultList() {
        List<Integer> positiveResult = new List<Integer>();
        for(Integer i = 0; i < minPositiveCounter; i++) {
            positiveResult.add(minPositive);
        }
        List<Integer> negativeResult = new List<Integer>();
        for(Integer i = 0; i < minNegativeCounter; i++) {
            negativeResult.add(minNegative);
        }
        List<Integer> result = new List<Integer>(positiveResult);
        result.addAll(negativeResult);
        return result;
    }
}
