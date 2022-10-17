# vault-hcp-demo
Demo set-up of a HCP Vault cluster including peering to AWS VPC and a small test instance for connecting to the Vault cluster.
In order to connect to the test instance use the command
ssh -i "<your-key.pem>" ec2-user@<public DNS of the instance >