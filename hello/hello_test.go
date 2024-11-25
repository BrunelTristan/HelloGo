package main

import (
	"github.com/stretchr/testify/assert"
	"math/rand"
	"testing"
)

func TestHello(t *testing.T) {
	msg := Hello()

	assert.NotEmpty(t, msg, "Should return a message")
	if len(msg) == 0 {
		t.Error("Error Hello return no message")
	} else {
		t.Log(msg)
	}
}

func TestMain(t *testing.T) {
	main()
}

func BenchmarkRandInt(b *testing.B) {
	for i := 0; i < b.N; i++ {
		rand.Int()
	}
}
