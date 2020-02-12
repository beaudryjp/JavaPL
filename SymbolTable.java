import java.util.*;

class SymbolTable{

    private static Stack<Integer> operations = new Stack<Integer>();
    private static List<String> variables = new ArrayList<String>();
    private static int stackSize = 0;


    public static int variablesSize(){
        return variables.size();
    }
    
    public static int maxStackSize(){
        return stackSize;
    }

    public static void declare(String s){
        variables.add(s);
    }
    
    public static int findVariable(String s){
        return variables.indexOf(s);
    }
      
    public static int peek(){
        return operations.peek();
    }

    public static boolean isEmpty(){
        return operations.empty();
    }

    public static void endMethod(){
        operations = new Stack<Integer>();
        variables = new ArrayList<String>();
        stackSize = 0;
    }
    public static void push(int x){
        operations.push(x);
        if(operations.size() > stackSize)
            stackSize++;
    }

    public static Integer pop(){
        return operations.pop();
    } 
}