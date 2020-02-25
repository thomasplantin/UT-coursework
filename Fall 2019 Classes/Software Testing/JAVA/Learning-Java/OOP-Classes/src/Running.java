public class Running {

    public static void main(String[] args) {
        Character characterA = new Character();
        Character characterB = new Character();
        System.out.println("The initial name is " + characterA.getName());
        characterA.setName("Thomas");
        System.out.println("The modified name is " + characterA.getName());
        characterB.setName("David");
        System.out.println(characterB.getName());

    }

}
