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
| **Asset**                  | **Purpose**                                             | **Size**                                                               | **Qty**                                                         | DR                                                                                                           |   |   |
|----------------------------|---------------------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|---|---|
| Asset name                 | Brief description                                       | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |   |   |
| S3 Bucket                  | store terraform stats                                   |                                                                        | 2 (1 at each region)                                            | Deployed at 2 regions                                                                                        |   |   |
| Key pair                   | ec2 ssh key-pair                                        |                                                                        | 2 (1 at each region)                                            | Deployed at 2 regions                                                                                        |   |   |
| VPC                        | A virtual network dedicated in the AWS account.         |                                                                        | 1                                                               | DR                                                                                                           |   |   |
| EC2 instances (web server) | EC2 instances for ubuntu-web server                     | t3.micro                                                               | 3                                                               | DR- deployed in two regions                                                                                  |   |   |
| RDS cluster                | RDS instances with one primary and another read replica |                                                                        | 2                                                               | DR                                                                                                           |   |   |
| Application Load Balancer  | Distribution of incoming traffic across ec2 instances.  |                                                                        | 2                                                               | DR - at 2 regions                                                                                            |   |   |

### Descriptions
More detailed descriptions of each asset identified above.
- S3 Bucket : we have created 2 s3 buckets at 2 regions, to save terraform state.
- Key pairs: 2 key pairs with same name "udacity" creted at 2 regions, it's ssh key-pairs used to connect to ec2 instances of web servers.
- VPC: we have created Virtual Private Cloud (Amazon VPC) to launch AWS resources into it, we created subnets public and private in each availability zone of each region.
- AMI images are using to hold the application executable. You have to create and store these AMI images in both regions. Also, these AMI images are copied from us-east-1 region.
- EC2 instances for web server: we need to create EC2 in every availability zone in the region
- RDS cluster: we are deploying two RDS cluster. One RDS cluster as primary cluster is deployed in us-east-2 region. This RDS cluster has one write instance and one read instance. The another RDS cluster as secondary cluster is deployed in us-west-1 region with replication from the primary cluster in us-east.2. This secondary cluster has 2 read instances.
- Application Load Balancer : Elastic Load Balancing automatically distributes incoming traffic across multiple EC2 instances more Availability Zones.

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.

- Restore & Create AMI images at 2 regions.
- Create S3 buckets for terraform state.
- Create private Keypairs with name "udacity" at 2 regions.
- Provision: VPC, Application Load Balancer (ALB), Security groups, EC2 instances web - servers and EKS cluster in another region.
- Provision primary RDS cluster in us-east-2 region replicated to a secondary RDS cluster in us-west-1 region.
- Using Postman collections to initiate the flask app, make traffic.
- Provision monitoring stack: prometheus configuration, Grafana dashboard 

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region

- Check  Route53 failover routing for the application servers completed successfully,It's now reached via the DR region ec2 instances.
- Check the RDS cluster failed over to new node.

