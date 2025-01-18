import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:susma/database/firebase_instances.dart';
import 'package:susma/main/auth/models/account_metadata.dart';

final accountMetadataRef =
    firestore.collection('account_metadata').withConverter<AccountMetadata>(
          fromFirestore: (snapshot, _) =>
              AccountMetadata.fromJson(snapshot.data()!),
          toFirestore: (accountMetadata, _) => accountMetadata.toJson(),
        );

Stream<QuerySnapshot<Object?>> getAccountMetadataRefByUID(String uid) {
  Stream<QuerySnapshot<Map<String, dynamic>>> documentStream = FirebaseFirestore
      .instance
      .collection('account_metadata')
      .where('uid', isEqualTo: uid)
      .snapshots();
  return documentStream;
}

Stream<QuerySnapshot<Object?>> getSubscriptionRefByUID(String uid) {
  Stream<QuerySnapshot<Map<String, dynamic>>> documentStream = FirebaseFirestore
      .instance
      .collection('subscriptions')
      .orderBy("renewalDate", descending: true)
      .where("account_uid", isEqualTo: uid)
      .limit(5)
      .snapshots();
  return documentStream;
}
