# retirement
This repo contains the templates for creating a generic retirement site. It also contains the files for all sites that have been retired to date. 

# Deployment 
Once your changes have been accepted here, they don't deploy automatically. 

If the app is like our normal Custom Front Ends (CFEs) then the DNS of the app (www.diskdetective.org) is already pointing at our static Nginx proxies which request the data from our S3 `zooniverse-static` bucket paths. 

As such you need to ensure the static retirement page files* you've just made/modified are added to the correct s3 bucket path to be served by our nginx proxies for the desired domain.

`*` E.g. [DiskDetective](DiskDetective/) files will be served are served from bucket path `zooniverse-static/www.diskdetective.org/` when requesting data for the www.diskdetective.org domain.

There are two ways to move the files to the correct bucket path:
1. Use the AWS S3 GUI to drag and drop (not covered here)
0. Use the aws cli s3 sync tools (see below)

The static bucket is `zooniverse-static` and you can list that via cli `aws s3 ls zooniverse-static`

In that bucket you will a 'folder' (path suffix) for our deployed domains, e.g. `zooniverse-static/www.diskdetective.org/` 

Use the aws cli cmd `aws s3 ls zooniverse-static/www.diskdetective.org/` to list the data in the disk detective bucket path. It's these files that are what is served to the browser when you visit, https://www.diskdetective.org

``` bash
DEPLOY_APP_PATH="./DiskDetective" # or cd DiskDetective/ and use .
DEPLOY_PATH="s3://zooniverse-static/www.diskdetective.org/"

# if you want to preseve the original index file for rollback / posterity
# check the cmd looks right
aws s3 cp --dryrun "${DEPLOY_PATH}index.html" "${DEPLOY_PATH}old_index_`date '+%Y-%m-%d-%H:%M:%S'`.html"
# run it without dry run
aws s3 cp "${DEPLOY_PATH}index.html" "${DEPLOY_PATH}old_index_`date '+%Y-%m-%d-%H:%M:%S`.html"

# check what the sync cmd will do with a dry run
aws s3 sync --dryrun "${DEPLOY_APP_PATH}" "${DEPLOY_PATH}" 

# when you are happy with this (modify this cmd to fit your use case), no dry run, be careful!
aws s3 sync "${DEPLOY_APP_PATH}" "${DEPLOY_PATH}" 
```
See https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html

#### After Deployement 
Once deployed the static server may be caching the old content.
You can clear the static sites cache two ways:
1. Use the Jenkins job manually 
0. Use chat ops via slack ops channel cmd `lita clear static cache`
