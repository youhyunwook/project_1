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
		
		db.createCollection("myCollection"); // �÷��� ����
		MongoCollection<Document> col = db.getCollection("myCollection"); // �÷��� ��������
		Document document = new Document("name", "ȫ�浿"); // ��ť��Ʈ ����
		document.append("age", 30); // �ʵ� �߰�
		document.append("gender", "����"); // �ʵ� �߰�
		col.insertOne(document); //�÷��ǿ� ��ť��Ʈ �߰�
		document = new Document("name", "�Ż��Ӵ�");
		document.append("age", 45);
		document.append("gender", "����");
		col.insertOne(document);
		
		FindIterable<Document> docs = col.find(); // �÷��� ��ȸ
		for(Document doc : docs) {
			System.out.println(doc.toJson());
		}
	}

}
