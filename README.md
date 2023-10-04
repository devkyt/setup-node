# Setup Node.js

One more action to setup Node.js on Linux or MacOS. Minimalistic, but helpful. Supports almost all versions from [official distributive](https://nodejs.org/dist/)

## Usage

Run it gently:

```yaml
steps:
  - name: "Setup Node.js"
    uses: s8ckerpunch/setup-node@main
    with:
      NODE_VERSION: "20.7.0"
```

If no version is specified, 16.16.0 will be used by default.
