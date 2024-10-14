import 'package:grpc/grpc.dart';
import 'package:aibro_client/proto_aibro_v1/aibro.pbgrpc.dart';
import 'dart:async';

class ChatService {
  late AIBroServiceClient stub;
  late ClientChannel channel;

  ChatService() {
    channel = ClientChannel(
      'localhost',
      port: 8080,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    stub = AIBroServiceClient(channel);
  }

  Stream<ChatStreamResponse> chatStream(Stream<ChatStreamRequest> requests) {
    try {
      print("Connecting to server...");
      final responseStream = stub.chatStream(requests);
      print("Connected to server");
      return responseStream;
    } catch (e) {
      print("Failed to connect to server: $e");
      rethrow;
    }
  }

  Future<void> shutdown() async {
    await channel.shutdown();
  }

}
