import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "questions")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @ManyToOne
    @JoinColumn(name = "poll", nullable = false)
    private Poll poll;

    @Column(name = "qindex")
    private int index;

    @Column(name = "qtext")
    private String text;

    @ManyToOne
    @JoinColumn(name = "type", nullable = false)
    private QuestionType type;

    @OneToMany(mappedBy = "question")
    private List<Metadata> metadata;

    @OneToMany(mappedBy = "question")
    private List<Variant> variants;

    public Question() {}

    public Question(Poll poll, int index, String text, QuestionType type) {
        this.poll = poll;
        this.index = index;
        this.text = text;
        this.type = type;
        this.variants = new ArrayList<>();
        this.metadata = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Poll getPoll() {
        return poll;
    }

    public void setPoll(Poll poll) {
        this.poll = poll;
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

    public QuestionType getType() {
        return type;
    }

    public void setType(QuestionType type) {
        this.type = type;
    }

    public List<Metadata> getMetadata() {
        return metadata;
    }

    public void setMetadata(List<Metadata> metadata) {
        this.metadata = metadata;
    }

    public List<Variant> getVariants() {
        return variants;
    }

    public void setVariants(List<Variant> variants) {
        this.variants = variants;
    }
}
