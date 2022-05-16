## Terraform and Kubernetes assignment for DevOps candidates - v2

### Requirements:
- any Kubernetes environment, e.g. 
  - Docker Desktop with activated Kubernetes cluster (https://www.docker.com/products/docker-desktop)
  - minikube (https://minikube.sigs.k8s.io/docs/start/)
  - k3s/k3d (https://k3d.io/v5.2.2/)
  - kind - Kubernetes IN Docker (https://kind.sigs.k8s.io)
- access to Kubernetes configured in ~/.kube/config  (in case your path is different, please set it in the `providers.tf` accordingly)
- Terraform in any version >1.0 (https://www.terraform.io/downloads)
- Terraform documentation https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs

### Story

You have been provided some Terraform manifests for Kubernetes resources that are supposed to mock a Kubernetes job for backing up a PostgreSQL databaase. The code is incomplete and needs some additions and probably refactoring. Please read all tasks to the end and decide how you want to deal with all requests after you understood the sum of requirements.


### Please go over the resource manifests `job.tf` and the variable declarations in `variables.tf` to get an understanding of the scenario.

You can use the Terraform commands `init`, `validate` and `plan` directly without any provider configuration. If you want to `apply` the code, the `providers.tf` file is required and should have the correct value for the `config_path` attribute to point to your local `KUBECONFIG`.
You can also use the official Hashicorp documentation from the link above. Feel free to change whatever you like and implement different methods or functions however you feel appropriate.  

#### 1. add missing resource dependency
The job wants to write the backups somewhere, but the target is likely missing and needs to be created. Please add the appropriate resource definition and try to make everything as safe and secure as possible (hint: encryption and access restrictions might be a good idea).

#### 2. remove secrets from code
The secrets in the code need to be removed. It might be a good idea to replace them with references, either from resources created in Terraform (e.g. an RDS instance with a TF managed password argument) or from objects that already exist and can be looked up for referencing (hint: anything goes, feel free to implement it whatever you think would work, just make those secrets invisible).

#### 3. change job execution schedule
The job is currently scheduled to run only once per day. Business wants to have backups created every 2 hours, so please change the job execution to make everybody happy.

#### 4. add parameters for multi-environment
This job should probably run in multiple different environments, so it might be a good idea to parameterize as much as possible and replace them with references to variable values that can be a applied depending on the environment.

#### 5. make it a module
Someone from management read an article about best practices in DevOps and wants you to implement the backup job as a reusable module. Please do so and put everything that you did above into a module that can be called with variable parameters from another manifest.


#### Please provide your solutions, comments and corrections in code (you can use any language or framework of your preference if you don't want to use Terraform HCL). Answers and solutions in text form can also be inserted or added to this document or another text file.

*`DRY` = "don't repeat yourself", which basically means that code should try to avoid duplications whenever possible. It is the opposite of `WET` coding, which probably means something like "write everything twice", "we enjoy typing" or "waste everyone's time".
