import java.util.function.Function;

public class StreamDemo1 {
	public static void main(String[] args) {
		/*List<String> list = Arrays.asList("진달래","개나리","코스모스","백합","진달래","코스모스");
		list.forEach(System.out::println);*/
		
		Student s1 = new Student("김철수", 24);
		Student s2 = new Student("한지민", 31);
		//Function<Student, Integer> f1 = Student::getAge;
				//System.out.println(f1.apply(s1));
				//List<Student> list = Arrays.asList(s1, s2, s3);
				//list.forEach(System.out::println);
	}
}

class Student{
	private String name;
	private int age;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Student [name=" + name + ", age=" + age + "]";
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Student(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
}