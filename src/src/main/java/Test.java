import java.util.ArrayList;
import java.util.List;

public class Test {

    public static void main(String[] args) throws InterruptedException {
        DBManager manager = new DBManager();

        Poll first = manager.getPoll(1);
        System.out.println(first.getQuestions().get(1).getText());
        System.out.println(first.getQuestions().get(5).getText());
//        manager.addPoll(createGamePoll());
//        manager.addPoll(createCafePoll());

        Thread.sleep(3000); // wait for it before closing

        manager.close();
    }

    private static final QuestionType nOfMany = new QuestionType("N of Many");
    private static final QuestionType matrix = new QuestionType("Matrix");
    private static final QuestionType open = new QuestionType("Open");
    private static final QuestionType sort = new QuestionType("Sorted");

    private static Poll createDisneyPoll() {
        Poll poll = new Poll("Яка ти принцеса Дісней?", "bla-bla-bla, this is a test description");
        List<Question> qs = poll.getQuestions();

        Question q = new Question(poll, 1, "Обери риси, що для тебе найбільше притаманні:", nOfMany);
        qs.add(q);
        List<Metadata> md = q.getMetadata();
        List<Variant> vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Цілеспрямованість, рішучість, допитливість"));
        vs.add(new Variant(q, 2, "Доброта, турбота про інших "));
        vs.add(new Variant(q, 3, "Незалежність, непослушність"));
        vs.add(new Variant(q, 4, "Сила і самовпевненість, хоробрість"));


        q = new Question(poll, 2, "Твій домашній улюбленець:", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "*"));
        md.add(new Metadata(q, "open_answer.index", "6"));

        vs.add(new Variant(q, 1, "Дуже великий кіт"));
        vs.add(new Variant(q, 2, "Птахи"));
        vs.add(new Variant(q, 3, "Єнот"));
        vs.add(new Variant(q, 4, "Рибка"));
        vs.add(new Variant(q, 5, "Мій домашній улюбленець - книга"));
        vs.add(new Variant(q, 6, "Інші (відкрита відповідь)"));


        q = new Question(poll, 3, "Ви дивились наступні фільми Disney?", matrix);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "matrix.row_answers.min", "1"));
        md.add(new Metadata(q, "matrix.row_answers.max", "1"));
        md.add(new Metadata(q, "matrix.rows", "10"));
        md.add(new Metadata(q, "matrix.columns", "3"));

        List<Variant> rows = new ArrayList<>();
        List<Variant> columns = new ArrayList<>();

        rows.add(new Variant(q, 1, "Tangled"));
        rows.add(new Variant(q, 2, "Frozen"));
        rows.add(new Variant(q, 3, "Pocahontas"));
        rows.add(new Variant(q, 4, "Mulan"));
        rows.add(new Variant(q, 5, "Brave"));
        rows.add(new Variant(q, 6, "Cinderella"));
        rows.add(new Variant(q, 7, "Sleeping Beauty"));
        rows.add(new Variant(q, 8, "The Little Mermaid"));
        rows.add(new Variant(q, 9, "Beauty and the Beast"));
        rows.add(new Variant(q, 10, "Aladdin"));

        columns.add(new Variant(q, 11, "Так"));
        columns.add(new Variant(q, 12, "Ні, але подивлюсь"));
        columns.add(new Variant(q, 13, "Ні"));

        addMatrix(q, vs, rows, columns);


        q = new Question(poll, 4, "Що тебе притягує?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Море, океан"));
        vs.add(new Variant(q, 2, "Пустеля"));
        vs.add(new Variant(q, 3, "Ліс"));


        q = new Question(poll, 5, "Яку частину світу обереш?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "*"));

        vs.add(new Variant(q, 1, "Європа"));
        vs.add(new Variant(q, 2, "Америка"));
        vs.add(new Variant(q, 3, "Східні країни"));
        vs.add(new Variant(q, 4, "Там, де є море"));


        q = new Question(poll, 6, "Мені подобається:", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Руде, вогняного кольору волосся"));
        vs.add(new Variant(q, 2, "Світле або ж русяве волосся"));
        vs.add(new Variant(q, 3, "Темний , насичено чорний колір волосся"));


        q = new Question(poll, 7, "Який твій стиль одягу?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Бальні вишукані і пишні сукні"));
        vs.add(new Variant(q, 2, "Східні наряди (брюки, топ)"));
        vs.add(new Variant(q, 3, "Прості, але  довгі сукні"));


        q = new Question(poll, 8, "Твоє життя ...", open);
        qs.add(q);


        q = new Question(poll, 9, "Твоя сильна сторона:", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Я круто танцюю"));
        vs.add(new Variant(q, 2, "Я неймовірно співаю "));
        vs.add(new Variant(q, 3, "Я хороша господиня "));
        vs.add(new Variant(q, 4, "Я красунька, але тільки до 12 ночі"));
        vs.add(new Variant(q, 5, "Я читаю 24/7 , бібліотека - моя сила"));
        vs.add(new Variant(q, 6, "Я можу довго спати"));
        vs.add(new Variant(q, 7, "Я вмію полювати"));
        vs.add(new Variant(q, 8, "Я і природа - одне ціле"));
        vs.add(new Variant(q, 9, "Я маю чарівне волосся"));


        q = new Question(poll, 10, "Вкажіть вашу стать:", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Чоловіча"));
        vs.add(new Variant(q, 2, "Жіноча"));


        return poll;
    }

    private static Poll createCafePoll() {
        Poll poll = new Poll("Оцінка кафе", "bla-bla-bla, this is a test description");
        List<Question> qs = poll.getQuestions();

        Question q = new Question(poll, 1, "Як часто ви відвідуєте кафе?", nOfMany);
        qs.add(q);
        List<Metadata> md = q.getMetadata();
        List<Variant> vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Щодня"));
        vs.add(new Variant(q, 2, "Декілька разів на тиждень"));
        vs.add(new Variant(q, 3, "Раз в тиждень"));
        vs.add(new Variant(q, 4, "Декілька разів на місяць"));
        vs.add(new Variant(q, 5, "Раз в місяць"));
        vs.add(new Variant(q, 6, "Декілька разів на рік"));
        vs.add(new Variant(q, 7, "Вперше"));


        q = new Question(poll, 2, "Зазначте настільки ви згодні з наступними висловлюваннями?", matrix);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "matrix.row_answers.min", "1"));
        md.add(new Metadata(q, "matrix.row_answers.max", "1"));
        md.add(new Metadata(q, "matrix.rows", "5"));
        md.add(new Metadata(q, "matrix.columns", "4"));

        List<Variant> rows = new ArrayList<>();
        List<Variant> columns = new ArrayList<>();

        rows.add(new Variant(q, 1, "Закуски були поданні відмінно"));
        rows.add(new Variant(q, 2, "Закуски були якісні і смачні"));
        rows.add(new Variant(q, 3, "Ціна була приваблива"));
        rows.add(new Variant(q, 4, "Інтер'єр кафе був приємним"));
        rows.add(new Variant(q, 5, "WiFi підключення достатньо швидке і якісне"));

        columns.add(new Variant(q, 6, "Повністю погоджуюсь"));
        columns.add(new Variant(q, 7, "Погоджуюсь"));
        columns.add(new Variant(q, 8, "Непогоджуюсь"));
        columns.add(new Variant(q, 9, "Зовсім непогоджуюсь"));

        addMatrix(q, vs, rows, columns);


        q = new Question(poll, 3, "Відсортуйте від найкращого до найгіршого", sort);
        qs.add(q);
        vs = q.getVariants();

        List<Variant> toSort = new ArrayList<>();
        toSort.add(new Variant(q, 1, "Інтер'єр"));
        toSort.add(new Variant(q, 2, "Обслуговування"));
        toSort.add(new Variant(q, 3, "Смак страв"));
        toSort.add(new Variant(q, 4, "Смак напоїв"));
        toSort.add(new Variant(q, 5, "Чистота у вбиральні"));
        toSort.add(new Variant(q, 6, "Місце розташування закладу"));
        addMatrix(q, vs, toSort, toSort);
//        addMatrix(q, vs, toSort, toSort.stream()
//                .map(v -> new Variant(v.getQuestion(), v.getIndex(), ""))
//                .collect(Collectors.toList()));


        q = new Question(poll, 4, "Оцініть наше кафе", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "1"));
        vs.add(new Variant(q, 2, "2"));
        vs.add(new Variant(q, 3, "3"));
        vs.add(new Variant(q, 4, "4"));
        vs.add(new Variant(q, 5, "5"));


        q = new Question(poll, 5, "Чи порекомендували б ви наше кафе?", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Так"));
        vs.add(new Variant(q, 2, "Ні"));


        q = new Question(poll, 6, "Вкажіть вашу стать:", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "Чоловіча"));
        vs.add(new Variant(q, 2, "Жіноча"));


        q = new Question(poll, 7, "Вкажіть вашу вікову групу:", nOfMany);
        qs.add(q);
        md = q.getMetadata();
        vs = q.getVariants();

        md.add(new Metadata(q, "n_of_many.min", "1"));
        md.add(new Metadata(q, "n_of_many.max", "1"));

        vs.add(new Variant(q, 1, "<20"));
        vs.add(new Variant(q, 2, "21-30"));
        vs.add(new Variant(q, 3, "31-40"));
        vs.add(new Variant(q, 4, "41-50"));
        vs.add(new Variant(q, 5, "51-60"));
        vs.add(new Variant(q, 6, "60+"));

        return poll;
    }

    private static void addMatrix(Question q, List<Variant> vs, List<Variant> rows, List<Variant> columns) {
        vs.addAll(rows);
        if(columns != rows) {
            vs.addAll(columns);
        }
        for(Variant row : rows) {
            for(Variant column : columns) {
                Variant v = new Variant(q, 0, "");
                row.setLink1(v);
                column.setLink1(v);
                v.setLink1(row);
                v.setLink2(column);
                vs.add(v);
            }
        }
    }
}
