# microservices-proto



## Field Types

* [Reference](https://protobuf.dev/programming-guides/proto3/#scalar)



## Field Names

* The field name should be lowercase; if if contains more than one word, it should be separated by an underscore;



## Field Numbers 

* unique identifiers for the field;



## Protocol buffer compiler

```sh
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
```

### Generate

```sh
protoc --go_out ./golang \
	--go_opt paths=source_relative \
	--go-grpc_out ./golang \
	--go-grpc_opt paths=source_relative \
	./proto/order.proto
```

