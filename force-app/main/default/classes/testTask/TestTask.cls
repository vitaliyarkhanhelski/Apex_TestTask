public with sharing class TestTask {

    static Map<Integer, List<Integer>> positives;
    static Map<Integer, List<Integer>> negatives;
    
    public static List<Integer> provideResult (List<Integer> numbers) {
        positives = new Map<Integer, List<Integer>>();
        negatives = new Map<Integer, List<Integer>>();
        if (numbers == null || numbers.isEmpty()) {
            return null;
        }
        for(Integer i : numbers) {
            if (i == 0) {
                return new List<Integer>{0};
            }
            if (checkIfMapsAreEmpty(i)) {
                continue;
            }
            if (i > 0) {
                populateValuesToMap(i, true);
            }
            else {
                populateValuesToMap(i, false);
            }
        }
        return prepareResultList();
    }

    private static Boolean checkIfMapsAreEmpty(Integer i) {
        if (positives.isEmpty() && i > 0) {
            positives.put(i, new List<Integer>{i});
            return true;
        }
        if (negatives.isEmpty() && i < 0) {
            negatives.put(i, new List<Integer>{i});
            return true;
        }
        return false;
    }

    private static void populateValuesToMap(Integer i, Boolean isPositive) {
        if (isPositive) {
            populatePositiveMap(i);
        } else {
            populateNegativeMap(i);
        }
    }

    private static void populatePositiveMap(Integer i) {
        Integer currentNumber = new List<Integer>(positives.keySet())[0];
        if (i == currentNumber) {
            List<Integer> temp = positives.get(i);
            temp.add(i);
            positives.put(i, temp);
        }
        if (i < currentNumber) {
            positives = new Map<Integer, List<Integer>>();
            positives.put(i, new List<Integer>{i});
        }
    }

    private static void populateNegativeMap(Integer i) {
        Integer currentNumber = new List<Integer>(negatives.keySet())[0];
        if (i == currentNumber) {
            List<Integer> temp = negatives.get(i);
            temp.add(i);
            negatives.put(i, temp);
        }
        if (i > currentNumber) {
            negatives = new Map<Integer, List<Integer>>();
            negatives.put(i, new List<Integer>{i});
        }
    }

    private static List<Integer> prepareResultList() {
        Integer positive =  !positives.keySet().isEmpty() ? new List<Integer> ( positives.keySet() ) [0] : null;
        Integer negative =  !negatives.keySet().isEmpty() ? new List<Integer> ( negatives.keySet() ) [0] : null;
        List<Integer> positiveResult = positive != null ? positives.get(positive) : new List<Integer>();
        List<Integer> negativeResult = negative != null ? negatives.get(negative) : new List<Integer>();
        List<Integer> result = new List<Integer>(positiveResult);
        result.addAll(negativeResult);
        return result;
    }
}
