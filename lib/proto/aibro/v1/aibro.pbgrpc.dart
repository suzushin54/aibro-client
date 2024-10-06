//
//  Generated code. Do not modify.
//  source: proto/aibro/v1/aibro.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'aibro.pb.dart' as $0;

export 'aibro.pb.dart';

@$pb.GrpcServiceName('aibro.v1.AIBroService')
class AIBroServiceClient extends $grpc.Client {
  static final _$chatStream = $grpc.ClientMethod<$0.ChatStreamRequest, $0.ChatStreamResponse>(
      '/aibro.v1.AIBroService/ChatStream',
      ($0.ChatStreamRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatStreamResponse.fromBuffer(value));

  AIBroServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.ChatStreamResponse> chatStream($async.Stream<$0.ChatStreamRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$chatStream, request, options: options);
  }
}

@$pb.GrpcServiceName('aibro.v1.AIBroService')
abstract class AIBroServiceBase extends $grpc.Service {
  $core.String get $name => 'aibro.v1.AIBroService';

  AIBroServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChatStreamRequest, $0.ChatStreamResponse>(
        'ChatStream',
        chatStream,
        true,
        true,
        ($core.List<$core.int> value) => $0.ChatStreamRequest.fromBuffer(value),
        ($0.ChatStreamResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ChatStreamResponse> chatStream($grpc.ServiceCall call, $async.Stream<$0.ChatStreamRequest> request);
}
