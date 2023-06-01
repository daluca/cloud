# Flux commands

## Flux CLI

```shell
flux diff kustomization apps --path ./apps/staging
```

## Git

```shell
git rebase --exec 'git commit --amend --allow-empty -S' -i <commit sha before the ones i want to apply gpg too>
git push --force-with-lease
```
