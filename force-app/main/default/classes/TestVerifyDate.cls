@isTest
private class TestVerifyDate {
    @isTest static void testCheckDates() {
        Date date1 = date.today();
        Date date2 = date1.addDays(29);
        //if date2 is within the next 30 days of date1, use date2.
        Date t = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date2, t);
    }
    
    @isTest static void testDateOver() {
        Date date3 = date.today();
        Date date4 = date3.addDays(31);
        //Otherwise use the end of the month
        Date s = VerifyDate.CheckDates(date3,date4);
        Date t = date3.addDays(4);
        //System.debug('s=' + s);
        //System.debug('t=' + t);
        System.assertEquals(t, s);
    }
}