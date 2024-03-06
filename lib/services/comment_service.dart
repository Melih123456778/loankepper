import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/comment.dart';

class CommentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //veri ekleme fonksiyonu
  Future<CommentModel> addStatus(String comment) async {
    var ref = _firestore.collection("Comments");
    var documentRef = await ref.add({
      'comment': comment,
    });

    return CommentModel(
      id: documentRef.id,
      comment: comment,
    );
  }
}
