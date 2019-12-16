import javax.persistence.*;

@Entity
@Table(name = "alternatives")
public class Alternative {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @ManyToOne
    @JoinColumn(name = "variant", nullable = false)
    private Variant variant;

    @ManyToOne
    @JoinColumn(name = "answer", nullable = false)
    private Answer answer;

    @Column
    private String note;

    public Alternative() {}

    public Alternative(Variant variant, Answer answer, String note) {
        this.variant = variant;
        this.answer = answer;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Variant getVariant() {
        return variant;
    }

    public void setVariant(Variant variant) {
        this.variant = variant;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
