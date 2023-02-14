public class CodingChallenge {
    private Map<Integer, List<Integer>> adjList = new Map<Integer, List<Integer>>();
    public void connect (Integer source, Integer target) {
        List<Integer> currList = adjList.get(source);
        if(currList != null && currList.size() > 0) {
            currList.add(target);
        } else {
            List<Integer> listTarget = new List<Integer>{target};
        	adjList.put(source, listTarget); 
        }
    }
    
    public Boolean isConnected (Integer source, Integer target) {      
        List<Integer> queue = new List<Integer>();
        List<Integer> visited = new List<Integer>();
        queue.add(source);
        while (queue.size() > 0) {
            Integer lastIndex = queue.size() - 1;
            Integer start = queue[lastIndex];
            queue.remove(lastIndex);
            if(start == target) {
                return true;
            }
            for (Integer key : adjList.keySet()) {
                List<Integer> listTarget = adjList.get(key);
                
                for(Integer value: listTarget) {
                    if (visited.contains(value)) {
                        continue;
                    }
                    Integer queueValue = (start == key) ? value : key;
                    if (((start == key) || (start == value)) && !queue.contains(queueValue)) {
                        queue.add(queueValue);
                    }
                }
            }
            
            visited.add(start);
        }
        return false;
    }
}