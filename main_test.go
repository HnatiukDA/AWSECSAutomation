package main

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
)

func TestPingEndpoint(t *testing.T) {
	// Create a new Gin router
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
			"version": "v1",
		})
	})

	// Create a new HTTP request for the /ping endpoint
	req, err := http.NewRequest("GET", "/ping", nil)
	if err != nil {
		t.Fatalf("Failed to create request: %v", err)
	}

	// Create a response recorder to record the response
	rec := httptest.NewRecorder()

	// Serve the request to the recorder
	r.ServeHTTP(rec, req)

	// Check the response status code
	if rec.Code != http.StatusOK {
		t.Errorf("Expected status code %d, but got %d", http.StatusOK, rec.Code)
	}

	// Check the response body
	expectedBody := `{"message":"pong","version":"v1"}`
	if rec.Body.String() != expectedBody {
		t.Errorf("Expected body %s, but got %s", expectedBody, rec.Body.String())
	}
}
