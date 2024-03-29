/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:031342435657:environment/my-terraform-environment

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

output "GlueWorkflowArn" {
  value = aws_glue_workflow.GlueWOrkflow.arn
}

output "GlueTriggerArn" {
  value = aws_glue_trigger.parquettransformation.arn
}

output "GlueJobArn" {
  value = aws_glue_job.CFNRGlueETL1.arn
}




