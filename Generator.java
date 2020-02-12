public class Generator{

    public static final String LT      = "iflt";
    public static final String LTOREQ  = "ifle";
    public static final String GT      = "ifgt";
    public static final String GTOREQ  = "ifge";
    public static final String EQ      = "ifeq";
    public static final String NOTEQ   = "ifne";
    public static final String PLUS    = "iadd";
    public static final String MINUS   = "isub";
    public static final String MUL     = "imul";
    public static final String DIV     = "idiv";
    public static final String MINU    = "MINU";
    public static final int AND     = 7;
    public static final int OR      = 8;
    public static final int NOT     = 9;
    public static int numTempVars   = -1;
    public static int numLabels     = -1;

    public static String newTempVar(){
        numTempVars++;
        return "t" + numTempVars;
    }

    public static String newLabel(){
        numLabels++;
        return "L" + numLabels;
    }

    public static void label(String label){
        System.out.println(label + ":");
    }

    public static void gotoLabel(String label){
        System.out.println("\tgoto " + label);
    }

    public static void print(String value){
        System.out.println("\tprint " + value);
    }

    public static void halt(){
        System.out.println("\thalt");
    }

    public static void error(){
        System.out.println("\terror");
    }

    public static void assignment(String var){
        System.out.println("\tdup");
        SymbolTable.push(SymbolTable.peek());
        System.out.println("\tistore " + SymbolTable.findVariable(var));
        SymbolTable.pop();
    }

    public static void varNotDeclared(String variable){
        System.out.println("\t# variable " + variable + " not declared.");
        error();
        halt();
        System.exit(0);
    }

    public static void varDeclared(String variable){
        System.out.println("\t# variable " + variable + " has been declared already.");
        error();
        halt();
        System.exit(0);
    }

    public static void arithmetic(String op){
        switch(op){
            case MUL:
            case DIV:
            case PLUS:
            case MINUS:
                System.out.println("\t" + op);
                break;
            case MINU:
                System.out.println("\tsipush -1");
                SymbolTable.push(-1);
                System.out.println("\timul");
                break;
        }
    }

    public static Tag condition(String cond){
        Tag result = new Tag(newLabel(), newLabel());
        System.out.println("\tisub");
        SymbolTable.pop();
        System.out.println("\t" + cond + " " + result.getT());
        System.out.println("\tgoto " + result.getF());
        return result;
    }

    public static Tag operator(int cond, Tag c1, Tag c2){
        Tag result = c2;
        switch(cond){
            case NOT:
                result = new Tag(c1.getF(), c1.getT());
                break;
            case AND:
                label(c1.getF()); 
                gotoLabel(c2.getT());
                break;
            case OR:
                label(c1.getT()); 
                gotoLabel(c2.getF());
                break;
            default:
                break;
        }
        return result;
    }

}