/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:031342435657:environment/my-terraform-environment

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

resource "aws_glue_workflow" "GlueWOrkflow" {
    name = "GlueWOrkflow"
   
}

resource "aws_glue_trigger" "parquettransformation" {
  name          = "parquettransformation"
  type          = "SCHEDULED"
  workflow_name = aws_glue_workflow.GlueWOrkflow.name
  schedule = "cron(45 11 ? * MON-FRI *)"
  start_on_creation = true
  


  actions {
    job_name = "CFNRGlueETL1"
  }
}

resource "aws_glue_job" "CFNRGlueETL1" {
  name     = var.environment.inputs.job1
  role_arn = var.environment.inputs.iam_role
  command {
    script_location = "s3://aws-glue-scripts-881689400308-us-east-1/admin/caspian_mpl_dev_delta_parquet_transformation"
  }
}
