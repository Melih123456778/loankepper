import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String? id;
  String? comment;

  CommentModel({this.id, this.comment});

  factory CommentModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CommentModel(
      id: snapshot.id,
      comment: snapshot["comment"],
    );
  }
}
