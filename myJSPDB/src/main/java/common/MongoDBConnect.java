package common;

import org.bson.Document;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
public class MongoDBConnect {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String uri = "mongodb://localhost:27017";
		MongoClient mc = MongoClients.create(uri);
		MongoDatabase db = mc.getDatabase("local");
		
		db.createCollection("myCollection"); // 컬렉션 생성
		MongoCollection<Document> col = db.getCollection("myCollection"); // 컬렉션 가져오기
		Document document = new Document("name", "홍길동"); // 다큐먼트 생성
		document.append("age", 30); // 필드 추가
		document.append("gender", "남자"); // 필드 추가
		col.insertOne(document); //컬렉션에 다큐먼트 추가
		document = new Document("name", "신사임당");
		document.append("age", 45);
		document.append("gender", "여자");
		col.insertOne(document);
		
		FindIterable<Document> docs = col.find(); // 컬렉션 조회
		for(Document doc : docs) {
			System.out.println(doc.toJson());
		}
	}

}
