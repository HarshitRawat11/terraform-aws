scp -i ~/.ssh/terra-key \
-o StrictHostKeyChecking=no \
-o UserKnownHostsFile=/dev/null \
-q 91931: C:/Users/91931/Documents/Study Material/DevOps/Terraform/Derek Morgan/terraform-aws/k3s/k3s.yaml ${k3s_path}/k3s-${nodename}.yaml && 
sed -i 's/127.0.0.1/${nodeip}/' ${k3s_path}/k3s-${nodename}.yaml