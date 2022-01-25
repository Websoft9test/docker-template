## Github Action

### Github的内置变量汇总(push commit)
```
{
  "token": "***",
  "job": "build",
  "ref": "refs/heads/main",
  "sha": "ef2d64c20eed7388da9423b3a9213df2506dbc84",
  "repository": "Websoft9/docker-template",
  "repository_owner": "Websoft9",
  "repositoryUrl": "git://github.com/Websoft9/docker-template.git",
  "run_id": "1743231303",
  "run_number": "24",
  "retention_days": "90",
  "run_attempt": "1",
  "actor": "qiaofeng1227",
  "workflow": "Docker Build And Push To Docker Hub",
  "head_ref": "",
  "base_ref": "",
  "event_name": "push",
  "event": {
    "after": "ef2d64c20eed7388da9423b3a9213df2506dbc84",
    "base_ref": null,
    "before": "c195b6c8964209667f921f48e023670997eab721",
    "commits": [
      {
        "author": {
          "email": "76487013@qq.com",
          "name": "qiaofeng1227",
          "username": "qiaofeng1227"
        },
        "committer": {
          "email": "noreply@github.com",
          "name": "GitHub",
          "username": "web-flow"
        },
        "distinct": true,
        "id": "ef2d64c20eed7388da9423b3a9213df2506dbc84",
        "message": "Update docker.yml",
        "timestamp": "2022-01-25T10:13:50+08:00",
        "tree_id": "595e9167738b5a25fefdb7253ce691c66dc35d6c",
        "url": "https://github.com/Websoft9/docker-template/commit/ef2d64c20eed7388da9423b3a9213df2506dbc84"
      }
    ],
    "compare": "https://github.com/Websoft9/docker-template/compare/c195b6c89642...ef2d64c20eed",
    "created": false,
    "deleted": false,
    "forced": false,
    "head_commit": {
      "author": {
        "email": "76487013@qq.com",
        "name": "qiaofeng1227",
        "username": "qiaofeng1227"
      },
      "committer": {
        "email": "noreply@github.com",
        "name": "GitHub",
        "username": "web-flow"
      },
      "distinct": true,
      "id": "ef2d64c20eed7388da9423b3a9213df2506dbc84",
      "message": "Update docker.yml",
      "timestamp": "2022-01-25T10:13:50+08:00",
      "tree_id": "595e9167738b5a25fefdb7253ce691c66dc35d6c",
      "url": "https://github.com/Websoft9/docker-template/commit/ef2d64c20eed7388da9423b3a9213df2506dbc84"
    },
    "organization": {
      "avatar_url": "https://avatars.githubusercontent.com/u/36851177?v=4",
        "type": "Organization",
        "url": "https://api.github.com/users/Websoft9"
      },
      "private": false,
      "pulls_url": "https://api.github.com/repos/Websoft9/docker-template/pulls{/number}",
      "pushed_at": 1643076830,
      "releases_url": "https://api.github.com/repos/Websoft9/docker-template/releases{/id}",
      "size": 453,
      "ssh_url": "git@github.com:Websoft9/docker-template.git",
      "stargazers": 1,
      "stargazers_count": 1,
      "stargazers_url": "https://api.github.com/repos/Websoft9/docker-template/stargazers",
      "statuses_url": "https://api.github.com/repos/Websoft9/docker-template/statuses/{sha}",
      "subscribers_url": "https://api.github.com/repos/Websoft9/docker-template/subscribers",
      "subscription_url": "https://api.github.com/repos/Websoft9/docker-template/subscription",
      "svn_url": "https://github.com/Websoft9/docker-template",
      "tags_url": "https://api.github.com/repos/Websoft9/docker-template/tags",
      "teams_url": "https://api.github.com/repos/Websoft9/docker-template/teams",
      "topics": [],
      "trees_url": "https://api.github.com/repos/Websoft9/docker-template/git/trees{/sha}",
      "updated_at": "2022-01-08T07:58:32Z",
      "url": "https://github.com/Websoft9/docker-template",
      "visibility": "public",
      "watchers": 1,
      "watchers_count": 1
    },
    "sender": {
      "avatar_url": "https://avatars.githubusercontent.com/u/43192516?v=4",
      "events_url": "https://api.github.com/users/qiaofeng1227/events{/privacy}",
      "followers_url": "https://api.github.com/users/qiaofeng1227/followers",
      "following_url": "https://api.github.com/users/qiaofeng1227/following{/other_user}",
      "gists_url": "https://api.github.com/users/qiaofeng1227/gists{/gist_id}",
      "gravatar_id": "",
      "html_url": "https://github.com/qiaofeng1227",
      "id": 43192516,
      "login": "qiaofeng1227",
      "node_id": "MDQ6VXNlcjQzMTkyNTE2",
      "organizations_url": "https://api.github.com/users/qiaofeng1227/orgs",
      "received_events_url": "https://api.github.com/users/qiaofeng1227/received_events",
      "repos_url": "https://api.github.com/users/qiaofeng1227/repos",
      "site_admin": false,
      "starred_url": "https://api.github.com/users/qiaofeng1227/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/qiaofeng1227/subscriptions",
      "type": "User",
      "url": "https://api.github.com/users/qiaofeng1227"
    }
  },
  "server_url": "https://github.com",
  "api_url": "https://api.github.com",
  "graphql_url": "https://api.github.com/graphql",
  "ref_name": "main",
  "ref_protected": true,
  "ref_type": "branch",
  "secret_source": "Actions",
  "workspace": "/home/runner/work/docker-template/docker-template",
  "action": "__run",
  "event_path": "/home/runner/work/_temp/_github_workflow/event.json",
  "action_repository": "",
  "action_ref": "",
  "path": "/home/runner/work/_temp/_runner_file_commands/add_path_7954e66a-0b85-4f2c-9d9b-a923628555d4",
  "env": "/home/runner/work/_temp/_runner_file_commands/set_env_7954e66a-0b85-4f2c-9d9b-a923628555d4"
}
```
