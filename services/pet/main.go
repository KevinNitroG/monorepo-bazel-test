package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	// Create a new Gin router
	router := gin.Default()

	// Add a simple health check endpoint
	router.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"status": "ok"})
	})

	// Start the server
	fmt.Println("Starting Pet Service on :8080")
	if err := router.Run(":8080"); err != nil {
		log.Fatalf("Server error: %v", err)
	}
}
