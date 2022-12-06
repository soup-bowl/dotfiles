# Soupbowl's Dotfile

Installs the crap I like. Mainly **ZSH** and a **GPG key**.

## GPG Signing

This is setup to detect a GPG directory stored as a base64-encoded string in a **GNUGPG** environmental. This can be created by running the following on a machine with the desired GPG key setup:

```bash
tar -czvf - ./.gnupg | base64 -w 0
```

Inspired by [this comment](https://github.com/gitpod-io/gitpod/issues/666#issuecomment-534347856) on a [Gitpod issue](https://github.com/gitpod-io/gitpod/issues/666) regarding GPG signing.
