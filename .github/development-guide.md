# Tacotruck Orb Development Guide

This guide will walk you through setting up and developing the Tacotruck CircleCI Orb, from initial setup to publishing.

## Prerequisites

Before you begin, you'll need to install and configure the CircleCI CLI tool.

### Installing the CircleCI CLI

The CircleCI CLI is a command-line tool that enables you to interact with CircleCI, including creating, validating, and publishing orbs.

For detailed installation instructions, visit the official documentation:
[CircleCI CLI Installation Guide](https://circleci.com/docs/2.0/local-cli/)

Quick installation methods:

**For macOS using Homebrew:**
```
brew install circleci
```

**For other platforms, using curl:**
```
curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | bash
```

### Setting up the CircleCI CLI

After installation, you need to configure the CLI with your CircleCI token:

1. Log in to CircleCI web interface
2. Go to User Settings > Personal API Tokens
3. Create a new API token
4. Configure the CLI with your token:

```
circleci setup
```

## Getting Started with the Tacotruck Orb

### 1. Clone the Project Repository

```
git clone https://github.com/testfiesta/tacotruck-orb.git
cd tacotruck-orb
```

### 2. Create a Namespace (if not already created)

In CircleCI, orbs belong to namespaces. If you don't already have a namespace, create one:

```
circleci namespace create <your-namespace-name> --org-id <your-circle-ci-org-id> --token <your-circle-ci-token>
```

Replace `your-namespace-name` with your desired namespace, `your-circle-ci-org-id` with your CircleCI organization ID and `your-circle-ci-token` with your CircleCI token.

### 3. Initialize a New Orb (if starting from scratch)

If you're creating a new orb:

```
circleci orb init tacotruck
```

Manually creating a orb in the namespace:

```
circleci orb create <your-namespace-name>/tacotruck --token <your-circle-ci-token> --private (if you want to make it private)
```

This will create a new directory structure for your orb.

### 4. Develop Your Orb

The orb should have the following structure:

- `src/` - Contains the source code for your orb
  - `commands/` - Reusable commands
  - `jobs/` - Predefined jobs
  - `examples/` - Example usage
  - `executors/` - Executor definitions

### 5. Validate Your Orb

Before publishing, validate your orb configuration:

```
circleci orb validate src/@orb.yml
```

### 6. Pack Your Orb

Pack your orb source files into a single file:

```
circleci orb pack src/ > orb.yml
```

### 7. Publish a Development Version

Before publishing a production version, you can publish a development version for testing:

```
circleci orb publish orb.yml your-namespace/tacotruck@dev:alpha
```

### 8. Test Your Orb

Create a test project that uses your development orb to verify it works as expected.

### 9. Publish a Production Version

Once you're satisfied with your orb, publish a production version:

```
circleci orb publish orb.yml your-namespace/tacotruck@1.0.0
```

Replace `1.0.0` with the appropriate semantic version.

### 10. Promote a Development Version (Alternative)

You can also promote a development version to production:

```
circleci orb publish promote your-namespace/tacotruck@dev:alpha patch
```

The `patch` parameter can be `patch`, `minor`, or `major` depending on the type of change according to semantic versioning.

## Continuous Integration for Orb Development

It's a good practice to set up a CI/CD pipeline for your orb development. This typically involves:

1. Automated testing of your orb
2. Automated publishing of development versions
3. Manual approval for production releases

You can use CircleCI itself to build this pipeline. Refer to the CircleCI Orb Author Guide for more details on setting up CI/CD for orbs.

## Further Resources

- [CircleCI Orb Author Guide](https://circleci.com/docs/orbs/author/orb-author/)
- [CircleCI Orb Publishing Process](https://circleci.com/docs/orbs/author/creating-orbs/)
- [Orb Best Practices](https://circleci.com/docs/orbs/author/orbs-best-practices/)
