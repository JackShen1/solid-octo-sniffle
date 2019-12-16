import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "variants")
public class Variant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column(name = "vindex")
    private int index;

    @Column
    private String text;

    @ManyToOne
    @JoinColumn(name = "question", nullable = false)
    private Question question;

    @OneToOne
    @JoinColumn(name = "link1")
    private Variant link1;

    @OneToOne(mappedBy = "link1")
    private Variant otherLink1;

    @OneToOne
    @JoinColumn(name = "link2")
    private Variant link2;

    @OneToOne(mappedBy = "link2")
    private Variant otherLink2;

    @OneToMany(mappedBy = "variant")
    private List<Alternative> alternatives;

    public Variant() {}

    public Variant(Question question, int index, String text) {
        this.question = question;
        this.index = index;
        this.text = text;
        this.alternatives = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Variant getLink1() {
        return link1;
    }

    public void setLink1(Variant link1) {
        this.link1 = link1;
    }

    public Variant getOtherLink1() {
        return otherLink1;
    }

    public void setOtherLink1(Variant otherLink1) {
        this.otherLink1 = otherLink1;
    }

    public Variant getLink2() {
        return link2;
    }

    public void setLink2(Variant link2) {
        this.link2 = link2;
    }

    public Variant getOtherLink2() {
        return otherLink2;
    }

    public void setOtherLink2(Variant otherLink2) {
        this.otherLink2 = otherLink2;
    }

    public List<Alternative> getAlternatives() {
        return alternatives;
    }

    public void setAlternatives(List<Alternative> alternatives) {
        this.alternatives = alternatives;
    }
}
