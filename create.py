import json
import requests
import logging

logging.basicConfig()
log = logging.getLogger()
log.setLevel(logging.INFO)

token = "" #oauth token to where the TF code lives
repo_path = "" #repo name for TF code
org = "" #TFC Org name
tfc_token = "" #token for tfc


vars =   [
    {
        "key": "TeamIDRepoName", #variable and name of workspace, must be the same
        "value": "",
        "sensitive": "false"
    },
    {
        "key": "region",
        "value": "",
        "sensitive": "false"
    },
    {
        "key": "access_key",
        "value": "",
        "sensitive": "true"
    },
    {
        "key": "secret_key",
        "value": "",
        "sensitive": "false"
    },
    {
        "key": "Github_repo_owner",
        "value": "",
        "sensitive": "false"
    },
    {
        "key": "Github_repo_name",
        "value": "",
        "sensitive": "false"
    },
    {
        "key": "tfc_org",
        "value": "",
        "sensitive": "false"
    },
    {
        "key": "tfc_workspace",
        "value": "",
        "sensitive": "false"
    },
    {
        "key": "CS_Creator_Full_Name",
        "value": "",
        "sensitive": "false"
    },
    {
        "key": "token",
        "value": "",
        "sensitive": "true"
    }
    ]



def create_vars(workspace_id, vars):
    key = var['key']
    value = var['value']
    sensitive = var['sensitive']
    url =   "https://app.terraform.io/api/v2/workspaces/" + workspace_id +"/vars"
    headers = {
            'Authorization': "Bearer " + tfc_token,
            'Content-Type': "application/vnd.api+json",
            'Accept': "*/*"
        }

    payload = {
              "data": {
                "type":"vars",
                "attributes": {
                  "key":key,
                  "value":value,
                  "description":"",
                  "category":"terraform",
                  "hcl":"false",
                  "sensitive":sensitive
                }
              }
            }

    try:
        requests.post(url, headers=headers, data=json.dumps(payload)).json()
        log.info("Successfully created variable")
    except Exception as e:
        log.error("Did not create variable")
        raise e


def create_workspace(workspace_name, token, repo_path, org, tfc_token):
    url =   "https://app.terraform.io/api/v2/organizations/" + org +"/workspaces"
    headers = {
            'Authorization': "Bearer " + tfc_token,
            'Content-Type': "application/vnd.api+json",
            'Accept': "*/*"

        }

    payload = {
              "data": {
                "attributes": {
                  "name": workspace_name,
                  "working-directory": "",
                  "vcs-repo": {
                    "identifier": repo_path,
                    "oauth-token-id": token,
                    "branch": ""
                  }
                },
                "type": "workspaces"
              }
            }

    try:
        out = requests.post(url, headers=headers, data=json.dumps(payload)).json()
        workspace_id = out['data']['id']
        log.info("Successfully created workspaceid: " + workspace_id)
    except Exception as e:
        log.error("Did not successfully create workspace id")
        raise e
    return workspace_id


def create_run(workspace_id):
    url =   "https://app.terraform.io/api/v2/runs"
    headers = {
            'Authorization': "Bearer " + tfc_token,
            'Content-Type': "application/vnd.api+json",
            'Accept': "*/*"
        }

    payload = {
              "data": {
                "attributes": {
                  "message": "Initial deploy",
                  "auto-apply": "true"
                },
                "type":"runs",
                "relationships": {
                  "workspace": {
                    "data": {
                      "type": "workspaces",
                      "id": workspace_id
                    }
                  }
                }
              }
            }

    try:
        requests.post(url, headers=headers, data=json.dumps(payload)).json()
        log.info("Successfully started the run")
    except Exception as e:
        log.error("Did not start the run")
        raise e




workspace_name = vars[0]['value']
id = create_workspace(workspace_name, token, repo_path, org, tfc_token)

for var in vars:
    create_vars(id, var)

create_run(id)
