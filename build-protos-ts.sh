protoc -I protos \
  --js_out=import_style=commonjs:app/src/protos \
  --grpc-web_out=import_style=typescript,mode=grpcwebtext:app/src/protos \
  ping.proto
