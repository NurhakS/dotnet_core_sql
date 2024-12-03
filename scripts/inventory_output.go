package main

import (
	"bytes"
	"fmt"
	"os"
	"os/exec"
)

func main() {
	// Define Terraform directory (update to match your setup)
	terraformDir := "../terraform" // Adjust the path if needed
	ansibleInventoryFile := "../ansible/inventory.ini" // Path to Ansible inventory

	// Change to Terraform directory
	if err := os.Chdir(terraformDir); err != nil {
		fmt.Printf("Failed to change directory: %v\n", err)
		return
	}

	// Run `terraform output -json` to get outputs as JSON
	cmd := exec.Command("terraform", "output", "-json")
	var out bytes.Buffer
	cmd.Stdout = &out
	if err := cmd.Run(); err != nil {
		fmt.Printf("Failed to run Terraform output: %v\n", err)
		return
	}

	// Parse outputs (mock example, replace with actual parsing logic)
	output := out.String() // Process JSON output here

	// Example: Create an Ansible inventory string
	inventory := `[web]
server1 ansible_host=192.168.1.10 ansible_user=ubuntu

[db]
server2 ansible_host=192.168.1.20 ansible_user=ubuntu`

	// Write inventory to file
	if err := os.WriteFile(ansibleInventoryFile, []byte(inventory), 0644); err != nil {
		fmt.Printf("Failed to write inventory file: %v\n", err)
		return
	}

	fmt.Println("Ansible inventory generated successfully!")
}
