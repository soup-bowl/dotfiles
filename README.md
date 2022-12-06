# Soupbowl's Dotfile

## GPG Signing

This is setup to detect a GPG directory stored as a base64-encoded string in a **GNUGPG** environmental. This can be created by running the following on a machine with the desired GPG key setup:

```bash
tar -czvf - ./.gnupg | base64 -w 0
```
