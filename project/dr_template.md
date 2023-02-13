# Infrastructure


## AWS Zones
Identify your zones here
# Primary: us-east-2a, us-east-2b, us-east-2c
# Secondary: us-west-1a, us-west-1c

## Servers and Clusters
3 EC2 instances with name Ubuntu-Web in every region
AMI image used by Ubuntu-Web EC2 instances stored in every region
2 EC2 instances for EKS cluster in every region

### Table 1.1 Summary
|          **Asset**         | **Purpose**                                             | **Size**                                                               | **Qty**                                                         | DR                                                                                                           |   |
|:--------------------------:|---------------------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|---|
|         Asset name         |                    Brief description                    | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |   |
| S3 Bucket                  | store terraform stats                                   |                                                                        | 2 (1 at each region)                                            | Deployed at 2 regions                                                                                        |   |
| Key pair                   | ec2 ssh key-pair                                        |                                                                        | 2 (1 at each region)                                            | Deployed at 2 regions                                                                                        |   |
| VPC                        | A virtual network dedicated in the AWS account.         |                                                                        | 1                                                               | DR                                                                                                           |   |
| EC2 instances (web server) | EC2 instances for ubuntu-web server                     | t3.micro                                                               | 3                                                               | DR- deployed in two regions                                                                                  |   |
| RDS cluster                | RDS instances with one primary and another read replica |                                                                        | 2                                                               | DR                                                                                                           |   |

### Descriptions
More detailed descriptions of each asset identified above.

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region