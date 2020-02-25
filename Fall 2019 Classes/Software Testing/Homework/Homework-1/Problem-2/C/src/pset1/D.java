package pset1;

public class D extends C {
    int g;

    public D(int f, int g) {
        super(f);
        this.g = g;
    }

    @Override
    public boolean equals(Object o) {
// assume this method is implemented for you
        if(o == this) {
            return true;
        }

        if(!(o instanceof D)) {
            return false;
        }

        D d = (D)o;
        return this.hashCode() == ((D) o).hashCode();
    }

    @Override
    public int hashCode() {
// assume this method is implemented for you
        return f * g;
    }
}
