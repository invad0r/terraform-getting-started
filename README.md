# terraform example
- playing around with terraform and aws (ec2, s3,..)

```sh
terraform workspace new dev		# init workspace
${terraform.workspace}
```

```sh
terraform init
terraform apply
terraform show
```

## precedence of variables

1. cli flags `-var 'key=val'`
2. file e.g. `terraform.tfvars` or `*.auto.tfvars`, if different filename `-var-file="path/file"`
3. env-variables `TF_VAR_name`; only populates string-type variables not List and map type 


## list definition
```
variable "cidrs" { default = [] }    # implicitly by using brackets [...]

variable "cidrs" { type = "list" }   # explicitly

cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]
```
