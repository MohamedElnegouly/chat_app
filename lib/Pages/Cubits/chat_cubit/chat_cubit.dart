import 'package:bloc/bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessageCollections);
  List<Message> messagesList = [];
  void sendMessage({required String message, required String email}) {
    messages.add({
      kmessage: message,
      kcreatedAt: DateTime.now(),
      'id': email,
    });
  }

  void getMessage() {
    messages.orderBy(kcreatedAt, descending: true).snapshots().listen(
      (event) {
        messagesList.clear();
        for (var doc in event.docs) {
          messagesList.add(Message.fromjson(doc));
        }
        emit(ChatSuccess(messages: messagesList));
      },
    );
  }
}
