public class MainClass {
    public static void run() {
        CodingChallenge program = new CodingChallenge();
        
        program.connect(1, 2);
        program.connect(20, 3);
        program.connect(1, 8);
        program.connect(9, 8);
        program.connect(10, 8);

        program.connect(2, 6);
        program.connect(6, 9);
        program.connect(10, 12);

        // Boolean isConnected = program.isConnected(2, 8);
        // System.debug('Is Connected: ' + isConnected);
        // System.assertEquals(true, isConnected);

        Boolean isConnected = program.isConnected(10, 9);
        System.debug('Is Connected: ' + isConnected);
        System.assertEquals(true, isConnected);
        System.debug('Test Circle CI');
    }
}