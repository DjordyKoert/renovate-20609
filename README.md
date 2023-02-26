Related discussion https://github.com/renovatebot/renovate/discussions/20609

# Current behavior 
Private vcs repositories includes dist in renovate generated `composer.lock`.

Current result in `composer.lock` (as can be seen in [the reproduction PR](https://github.com/DjordyKoert/renovate-20609/pulls)):
```
{
            "name": "company/some-private-package",
            "version": "3.1.0",
            "source": {
                "type": "git",
                "url": "git@gitlab.company.com:packages/some-private-package.git",
                "reference": "036d7a077c47381221f74f080aca23553e264dd1"
            },
            "dist": {
                "type": "zip",
                "url": "https://gitlab.company.com/api/v4/projects/packages%2Fsome-private-package/repository/archive.zip?sha=036d7a077c47381221f74f080aca23553e264dd1",
                "reference": "036d7a077c47381221f74f080aca23553e264dd1",
                "shasum": ""
            },
            ...
}
```

# Expected behavior
Private vcs repositories does not include dist in renovate generated `composer.lock`.

Expected result in `composer.lock`:
```
{
            "name": "company/some-private-package",
            "version": "3.1.0",
            "source": {
                "type": "git",
                "url": "git@gitlab.company.com:packages/some-private-package.git",
                "reference": "036d7a077c47381221f74f080aca23553e264dd1"
            },
            ...
}
```

## Running custom docker image
```
docker build -t renovate-20609 --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/id_rsa)" .
```

```
docker run renovate-20609
```
