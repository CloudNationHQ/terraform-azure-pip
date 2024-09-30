.PHONY: test docs install

export EXAMPLE

test:
	cd tests && go test -v -timeout 60m -run TestApplyNoError/$(EXAMPLE) ./public_ip_test.go

install:
	@command -v terraform-docs >/dev/null 2>&1 || go install github.com/terraform-docs/terraform-docs@v0.16.0

docs:
	@terraform-docs markdown table --output-file README.md --output-mode inject .
