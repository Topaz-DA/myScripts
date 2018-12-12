#!/bin/bash

# The script is starting my tests EC2 and SSH to it.

# Gets instance ID by Name

INSTANCE_NAME="Topaz-TEST"
INSTANCE_ID=$(aws ec2 describe-instances --filters Name=tag:Name,Values=$INSTANCE_NAME --query "Reservations[*].Instances[*].InstanceId" --output text)

# Start the EC2
aws ec2 start-instances --instance-ids $INSTANCE_ID

# Waits untill the EC2 is ready
aws ec2 wait instance-status-ok --instance-ids $INSTANCE_ID
# SSH to EC2
/root/.ssh/ssh-connect.sh topaz-tests.da


