import 'package:grpc/grpc.dart';
import 'package:aibro_client/proto_aibro_v1/aibro.pbgrpc.dart';
import 'dart:async';

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
      ),
    );

    stub = AIBroServiceClient(channel);
    _requestStreamController = StreamController<ChatStreamRequest>();
  }

  Stream<ChatStreamResponse> chatStream() {
    try {
      print("Connecting to server...");
      final responseStream = stub.chatStream(_requestStreamController.stream);
      print("Connected to server");
      return responseStream;
    } catch (e) {
      print("Failed to connect to server: $e");
      rethrow;
    }
  }

  void sendMessage(String userId, String message) {
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
