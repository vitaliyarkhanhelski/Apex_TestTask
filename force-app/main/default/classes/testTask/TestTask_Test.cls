@isTest
private class TestTask_Test {

     @isTest 
     static void testZero() {
        List<Integer> numbers = new List<Integer>{0};
        System.assertEquals(new List<Integer>{0}, TestTask.provideResult(numbers));
        System.assert(TestTask.provideResult(numbers).size() == 1);
     }

     @isTest 
     static void test1() {
        List<Integer> numbers = new List<Integer>{1, 1, 2, 3, 5, 1, 6, 7, 8, -2, -3, -5, 1, -6, -7, -8, -2};
        System.assertEquals(new List<Integer>{1, 1, 1, 1, -2, -2}, TestTask.provideResult(numbers));
     }

     @isTest 
     static void test2() {
        List<Integer> numbers = new List<Integer>{-150, -100, -100, 120,- 120, 150, 130, 120, -100, 140, 120};
        System.assertEquals(new List<Integer>{120, 120, 120, -100, -100, -100}, TestTask.provideResult(numbers));
     }

     @isTest 
     static void test3() {
        List<Integer> numbers = new List<Integer>{-123, 100, 99, 3, -102, 150, 130, 120, -103, 55, 55, 3};
        System.assertEquals(new List<Integer>{3, 3, -102}, TestTask.provideResult(numbers));
        System.assertEquals(3, TestTask.provideResult(numbers).size());
     }

     @isTest 
     static void test4() {
        List<Integer> numbers = new List<Integer>{1, -2, 2, -50, 1, -60, 3, -80, 1, 4, -3, -3, -3, -3, 1, -2, 5, 1, 6, 9};
        System.assertEquals(new List<Integer>{1, 1, 1, 1, 1, -2, -2}, TestTask.provideResult(numbers));
     }

     @isTest
     static void testEmpty() {
        List<Integer> numbers = new List<Integer>();
        System.assertEquals(null, TestTask.provideResult(numbers));
     }

     @isTest
     static void testNull() {
        System.assertEquals(null, TestTask.provideResult(null));
     }
     
}
