package test

import (
	"crypto/tls"
	"fmt"
	"testing"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestExample(t *testing.T) {

	// Indique où se trouve les fichiers Terragrunt à executer.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir:    "../example/terratest",
		TerraformBinary: "terragrunt",
	})

	// Detruis les ressources peu importe le code retour de la fonction (defer)
	defer terraform.Destroy(t, terraformOptions)

	// Execute terraform init et terraform apply et retorune une erreur si ça fail
	terraform.InitAndApply(t, terraformOptions)

	validate(t, terraformOptions)
}

func validate(t *testing.T, opts *terraform.Options) {
	// Récupère l'output Terraform
	url := fmt.Sprintf("http://%s", terraform.Output(t, opts, "bucket_endpoint"))

	// Setup une configuration TLS avec une structure vide
	tlsConfig := tls.Config{}

	// Vérifie que la requête retourne bien un code 200
	http_helper.HttpGet(t, url, &tlsConfig)
}
