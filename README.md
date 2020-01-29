# retirement
This repo contains the templates for creating a generic retirement site. It also contains the files for all sites that have been retired to date. 

# Deployment 
Once your changes have been accepted here, they don't deploy automatically. 

If the app is like our normal Custom Front Ends (CFEs) then the DNS of the app, e.g. www.diskdetective.org/ is already pointing at our S3 bucket paths through our static Nginx proxies. That means the only changes necessary are for your retirement page static files* you've just made/modified need to be put into the correct s3 bucket path to be served by our nginx proxies.

`*` E.g. [DiskDetective](DiskDetective/)

The easiest way to do move the files to the correct bucket path is to use the aws cli s3 sync tools. 

The static bucket is `zooniverse-static` and you can list that via cli `aws s3 ls zooniverse-static`

In that bucket you will a 'folder' (path suffix) for our deployed domains, e.g. `zooniverse-static/www.diskdetective.org/` 

Use this aws cli cmd `aws s3 ls zooniverse-static/www.diskdetective.org/` to list the data in the disk detective bucket path. It's these files that are what is served to the browser when you visit, https://www.diskdetective.org

``` bash
DEPLOY_APP_PATH="./DiskDetective" # or cd DiskDetective/ and use .
DEPLOY_PATH="s3://zooniverse-static/www.diskdetective.org/"
# check what the sync cmd will do with a dry run
aws s3 sync --dryrun "${DEPLOY_APP_PATH}" "${DEPLOY_PATH}" 

# when you are happy with this (modify this cmd to fit your use case), no dry run, be careful!
aws s3 sync "${DEPLOY_APP_PATH}" "${DEPLOY_PATH}" 
```
See https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html


Alternatively you can use the AWS S3 GUI to drag and drop. 
