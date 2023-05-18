Here I have tried to manage my resource and instance creation using terraform on AWS

The first thing to carry out here is to authenticate AWS with terraform, there are various ways to do so:
I. either pass access and secret access key with the provider block only (*this practice is not recommended because of the privacy issues*)
II. second way is to pass the access and secret access key as environment variables (*much better and secure way, protects your privacy, I have uased the same method here*)
III. another way can be creating a separate IAM user for the terraform and sharing user access with terraform

post authenticating AWS and terraform we can use the terraform scripts 

*Note - I have deployed the resources in AWS us-east-1 region so please use the same region or make respective changes as per the region you use (the ami ids for different regions are different and AWS frequently chnages ami ids so before using please check the ids mentioned here in the script with AWS)*