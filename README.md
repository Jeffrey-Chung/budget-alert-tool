# budget-alert-tool

<h1>Description</h1>

This is a tool that can set budget alerts for your AWS spendage on the Billing Management Console using GitHub Actions and Terraform. You can customize the interval of your alerts, maximum budget, your region, your email notifications etc. As long as you set your OIDC identity provider, an IAM role and a state bucket. The Terraform State Bucket will be stored in S3.  

<h1> Parameters Definition </h1>

 <table>
  <tr>
    <th>Name</th>
    <th>Definition</th>
    <th>Type</th>
  </tr>
  <tr>
    <td>region</td>
    <td>Region to deploy your budget alert</td>
    <td>String</td>
  </tr>
  <tr>
    <td>budget_name</td>
    <td>The name that you want to set for your budget</td>
    <td>String</td>
  </tr>
   <tr>
    <td>budget_cost</td>
    <td>Your Budget per Month in USD</td>
    <td>String</td>
  </tr>
   <tr>
    <td>time_unit</td>
    <td>Intervals between alerts (i.e. DAILY, MONTHLY etc.)</td>
    <td>String</td>
  </tr>
  <tr>
    <td>email_address</td>
    <td>The email address that will be notified to once you hit a certain threshold(s) of your budget</td>
    <td>String</td>
  </tr>
  <tr>
    <td>state_bucket_name</td>
    <td>The name of your S3 bucket that will keep track of the Terraform changes</td>
    <td>String</td>
  </tr>
  <tr>
    <td>min_notification_threshold</td>
    <td>The minimum notification threshold in percentage that an email will be sent to alert your spendings (i.e. 50% of your spendings)</td>
    <td>Integer</td>
    
  </tr>
  <tr>
    <td>max_notification_threshold</td>
    <td>The maximum notification threshold in percentage that an email will be sent to alert your spendings (i.e. 50% of your spendings)</td>
    <td>Integer</td>
  </tr>
</table> 

<h1>Instructions</h1>

1. Fork/Clone this repo
2. Follow <a href="https://aws.amazon.com/blogs/security/use-iam-roles-to-connect-github-actions-to-actions-in-aws/">this</a> link to setup OIDC for GitHub Actions. You will also create an IAM role whilst following the tutorial
3. Add the `AmazonS3FullAccess` and `Billing` permission policies to your IAM role to make sure that it has access to the billing console to setup the budget and the state bucket.
4. Use the `terraform init` command to create the terraform state file to be uploaded to a S3 Bucket
5. Create a default S3 bucket then upload the state file that you just created (.terraform/terraform.tfstate). That will be your state bucket
6. Copy the ARN address of your IAM role and in the `deploy_with_tfvars.yml` file, update the `IAM_ROLE` with the ARN address
7. In a tfvars file, customize your budget alert with the parameters provided, make sure you copy the name of your state bucket as well.
8. Commit and Push your progress.
9. In `Actions`, click on <b>Deployment - terraform apply or destroy  -> Run workflow</b> and type `build` to start the CI/CD workflow.

NOTE: if you want to destroy your alerts, then follow step 9. but type `destroy` instead
