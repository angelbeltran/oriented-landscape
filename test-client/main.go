package main

import (
	"context"
	"log"
	"os"
	"time"
        "strings"

	"google.golang.org/grpc"
	pb "github.com/angelbeltran/tanks/protos"
)

const (
	address     = "localhost:8080"
	defaultMessage = "Hello!"
)

func main() {
	// Set up a connection to the server.
	conn, err := grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	c := pb.NewPingServiceClient(conn)

	// Contact the server and print out its response.
	msg := defaultMessage
	if len(os.Args) > 1 {
          msg = strings.Join(os.Args[1:], " ")
	}
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()
	r, err := c.SendPing(ctx, &pb.Ping{Message: msg})
	if err != nil {
		log.Fatalf("could not ping: %v", err)
	}
	log.Printf("Pong: %s", r.Message)
}
