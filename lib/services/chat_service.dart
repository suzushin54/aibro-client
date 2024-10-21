import 'package:grpc/grpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aibro_client/proto_aibro_v1/aibro.pbgrpc.dart';
import 'dart:async';

final chatServiceProvider = Provider<ChatService>((ref) {
  return ChatService();
});

final chatStreamProvider = StreamProvider.autoDispose<ChatStreamResponse>((ref) {
  final chatService = ref.watch(chatServiceProvider);
  return chatService.chatStream().asBroadcastStream();
});

class ChatService {
  late AIBroServiceClient stub;
  late ClientChannel channel;
  late StreamController<ChatStreamRequest> _requestStreamController;

  ChatService() {
    channel = ClientChannel(
      'localhost',
      port: 8080,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        idleTimeout: Duration(minutes: 1),
      ),
    );

    stub = AIBroServiceClient(channel);
    _requestStreamController = StreamController<ChatStreamRequest>();
  }

  Stream<ChatStreamResponse> chatStream() {
    try {
      print("Connecting to server...");
      final responseStream = stub.chatStream(_requestStreamController.stream).asBroadcastStream();

      responseStream.listen(
        (response) {
          print("Received response: ${response.message}");
        },
        onError: (error) {
          print("Error in stream: $error");
        },
        onDone: () {
          print("Stream has been closed.");
        },
      );

      return responseStream;
    } catch (e) {
      print("Failed to connect to server: $e");
      rethrow;
    }
  }

  void sendMessage(String userId, String message) {
    if (_requestStreamController.isClosed) {
      print("Cannot send message, stream is closed.");
      return;
    }

    final request = ChatStreamRequest()
        ..userId = userId
        ..message = message;

    print("Sending message: $message");

    _requestStreamController.add(request);
  }

  Future<void> shutdown() async {
    await _requestStreamController.close();
    await channel.shutdown();
  }
}
