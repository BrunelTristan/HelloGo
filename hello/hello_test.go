package hello

import (
	"testing"
)

func TestHello(t *testing.T) {
    msg := Hello()

	if len(msg) == 0 {
		t.Error("Error Hello return no message")
	} else {
		t.Log(msg);
	}
}