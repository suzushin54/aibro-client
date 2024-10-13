//
//  Generated code. Do not modify.
//  source: proto/aibro/v1/aibro.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatStreamRequestDescriptor instead')
const ChatStreamRequest$json = {
  '1': 'ChatStreamRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ChatStreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatStreamRequestDescriptor = $convert.base64Decode(
    'ChFDaGF0U3RyZWFtUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGAoHbWVzc2FnZR'
    'gCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use chatStreamResponseDescriptor instead')
const ChatStreamResponse$json = {
  '1': 'ChatStreamResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ChatStreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatStreamResponseDescriptor = $convert.base64Decode(
    'ChJDaGF0U3RyZWFtUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

