## structure

```
lib/
├── main.dart                 # Entrypoint
├── core/
│   ├── utilities.dart
│   └── constants.dart
├── services/
│   ├── chat_service.dart     # gRPC client service
│   └── proto/                # generated gRPC files from protos
│       └── aibro/
|           └── v1/
│               ├── aibro.pb.dart
│               ├── aibro.pbenum.dart
│               ├── aibro.pbgrpc.dart
│               └── aibro.pbjson.dart
├── models/
│   └── chat_message.dart     # Application model 
├── screens/
│   └── chat_screen.dart      # Main screen
└── widgets/
└── custom_widgets.dart       # Custom widgets
```