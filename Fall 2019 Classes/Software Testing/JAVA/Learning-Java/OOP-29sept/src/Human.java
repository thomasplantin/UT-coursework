public class Human {

    private String name;
    private int age;
    private int heightInInches;
    private String eyeColor;

    public void speak() {
        System.out.println("Hello my name is: " + name + ".");
        System.out.println("I am " + age + " years old.");
        System.out.println("I am " + heightInInches + " inches tall.");
        System.out.println("My eyes are " + eyeColor + ".");
    }

    public void createHuman(String name, int age, int heightInInches, String eyeColor) {
        this.name = name;
        this.age = age;
        this.heightInInches = heightInInches;
        this.eyeColor = eyeColor;
    }

    public String getName() {
        return name;
    }

}
