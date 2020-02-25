package pset3;

import org.apache.bcel.Repository;
import org.apache.bcel.classfile.JavaClass;
import org.apache.bcel.classfile.Method;
import org.apache.bcel.generic.*;

import java.util.EnumMap;

public class GraphGenerator {
    public CFG createCFG(String className) throws ClassNotFoundException {
        CFG cfg = new CFG();
        JavaClass jc = Repository.lookupClass(className);
        ClassGen cg = new ClassGen(jc);
        ConstantPoolGen cpg = cg.getConstantPool();
        for (Method m: cg.getMethods()) {
            MethodGen mg = new MethodGen(m, cg.getClassName(), cpg);
            InstructionList il = mg.getInstructionList();
            InstructionHandle[] handles = il.getInstructionHandles();
            for (InstructionHandle ih: handles) {
                int position = ih.getPosition();
                cfg.addNode(position, m, jc);
                Instruction inst = ih.getInstruction();
                // your code goes here
                if(inst instanceof BranchInstruction) {
                    // If it's a branching instruction, then add two edges: -one to target, -one to next pos
                    cfg.addEdge(position, ((BranchInstruction)inst).getTarget().getPosition(), m, jc);
                    cfg.addEdge(position, ih.getNext().getPosition(), m, jc);
                }
                else if(inst instanceof ReturnInstruction) {
                    // If it's a return instruction, then add a dummy edge (in this case: -1)
                    cfg.addEdge(position, -1, m, jc);
                }
                else {
                    // If it's any other instruction, add an edge to the next position
                    cfg.addEdge(position, ih.getNext().getPosition(), m, jc);
                }
            }
        }
        return cfg;
    }

    public CFG createCFGWithMethodInvocation(String className) throws ClassNotFoundException {
        // your code goes here
        CFG cfg = new CFG();
        JavaClass jc = Repository.lookupClass(className);
        ClassGen cg = new ClassGen(jc);
        ConstantPoolGen cpg = cg.getConstantPool();
        for (Method m: cg.getMethods()) {
            MethodGen mg = new MethodGen(m, cg.getClassName(), cpg);
            InstructionList il = mg.getInstructionList();
            InstructionHandle[] handles = il.getInstructionHandles();
            for (InstructionHandle ih: handles) {
                int position = ih.getPosition();
                cfg.addNode(position, m, jc);
                Instruction inst = ih.getInstruction();
                // your code goes here
                if(inst instanceof INVOKESTATIC) {
                    Method[] methodArr = cg.getMethods();
                    String invokingMethodName = ((INVOKESTATIC)inst).getMethodName(cpg);
                    Method invokingMethod = null;
                    for(Method i : methodArr) {
                        if(i.getName().equals(invokingMethodName)) {
                            invokingMethod = i;
                            break;
                        }
                    }
                    cfg.addEdge(position, m, jc, 0, invokingMethod, jc);
                }
                else if(inst instanceof BranchInstruction) {
                    // If it's a branching instruction, then add two edges: -one to target, -one to next pos
                    cfg.addEdge(position, ((BranchInstruction)inst).getTarget().getPosition(), m, jc);
                    cfg.addEdge(position, ih.getNext().getPosition(), m, jc);
                }
                else if(inst instanceof ReturnInstruction) {
                    // If it's a return instruction, then add a dummy edge (in this case: -1)
                    cfg.addEdge(position, -1, m, jc);
                }
                else {
                    // If it's any other instruction, add an edge to the next position
                    cfg.addEdge(position, ih.getNext().getPosition(), m, jc);
                }
            }
        }
        return cfg;
    }

    public static void main(String[] a) throws ClassNotFoundException {
        GraphGenerator gg = new GraphGenerator();
        CFG cfg_1 = gg.createCFG("pset3.C"); // example invocation of createCFG
        CFG cfg_2 = gg.createCFGWithMethodInvocation("pset3.D"); // example invocation of createCFGWithMethodInovcation
        System.out.println(cfg_1);
        System.out.println(cfg_2);
    }
}