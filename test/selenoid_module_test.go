package test

import (
	"fmt"
	"testing"
	"time"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestSelenoidModule(t *testing.T) {
	t.Parallel()

	tfOptions := &terraform.Options{
		TerraformDir: "./fixtures",
		VarFiles:     []string{"terraform.tfvars"},
	}

	defer terraform.Destroy(t, tfOptions)

	terraform.InitAndApply(t, tfOptions)
	seleniumGridIp := terraform.Output(t, tfOptions, "ip")
	t.Logf("IP: %v", seleniumGridIp)
	http_helper.HTTPDoWithRetry(t, "GET", fmt.Sprintf("http://%s:4444", seleniumGridIp), nil, nil, 200, 10, 20*time.Second, nil)
}
