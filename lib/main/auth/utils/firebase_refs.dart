import 'package:susma/database/firebase_instances.dart';
import 'package:susma/main/auth/models/user_metadata.dart';

final accountMetadataRef =
    firestore.collection('account_metadata').withConverter<AccountMetadata>(
          fromFirestore: (snapshot, _) =>
              AccountMetadata.fromJson(snapshot.data()!),
          toFirestore: (accountMetadata, _) => accountMetadata.toJson(),
        );
