package hello

import (
	"math/rand"
	"testing"
)

func TestHello(t *testing.T) {
	msg := Hello()

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
