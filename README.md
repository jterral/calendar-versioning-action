# 📅 Calendar Versioning Action

[![GitHub release](https://img.shields.io/github/release/jterral/calendar-versioning-action.svg)](https://github.com/jterral/calendar-versioning-action/releases)
[![GitHub marketplace](https://img.shields.io/badge/marketplace-calendar--versioning--action-blue?logo=github)](https://github.com/marketplace/actions/calendar-versioning-action)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Effortlessly implement Calendar Versioning (CalVer) in your GitHub workflows!** 🚀

This powerful GitHub Action automatically generates semantic, time-based version tags following the CalVer specification. Perfect for continuous deployment pipelines where you want predictable, chronological versioning that makes sense at a glance.

## ✨ Features

- **🔄 Automatic Version Generation**: Creates CalVer tags based on year and week number
- **📈 Incremental Releases**: Handles multiple releases in the same week with automatic incrementing
- **🎯 Zero Configuration**: Works out of the box with sensible defaults
- **🔧 Flexible Options**: Customize commit behavior and user information
- **⚡ Lightweight**: Composite action with minimal overhead
- **📊 Dual Output**: Provides both clean tags and build-numbered versions

## 🏷️ Version Format

This action generates versions in the format: `YY.WW.PATCH`

- **YY**: Last two digits of the current year
- **WW**: Week number of the year (00-53)
- **PATCH**: Incremental number for releases within the same week

**Examples:**

- First release of week 42 in 2025: `25.42.0`
- Second release of the same week: `25.42.1`
- With build number: `25.42.1+1234`

## 🚀 Quick Start

### Step 1: Setup Your Workflow

```yaml
name: Release
on:
  push:
    branches: [main]

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Generate CalVer tag
        id: calver
        uses: jterral/calendar-versioning-action@v2

      - name: Create GitHub Release
        uses: actions/create-release@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          tag_name: ${{ steps.calver.outputs.tag }}
          release_name: Release ${{ steps.calver.outputs.version }}
```

### Step 2: Customize (Optional)

```yaml
- name: Generate CalVer tag with prefix
  uses: jterral/calendar-versioning-action@v2
  with:
    tag-prefix: 'api-'
    tag-push: 'true'
    commit-email: 'bot@mycompany.com'
    commit-name: 'Release Bot'
```

## 📋 Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `tag-prefix` | Optional prefix for the tag (e.g., 'api-') | No | `""` (empty) |
| `tag-push` | Whether to push the tag to the remote repository | No | `false` |
| `commit-email` | Git user email for tag commits | No | `github-actions[bot]@users.noreply.github.com` |
| `commit-name` | Git user name for tag commits | No | `github-actions[bot]` |

## 📤 Outputs

| Output | Description | Example |
|--------|-------------|---------|
| `tag` | The generated CalVer tag (with prefix if specified) | `25.42.1` or `api-25.42.1` |
| `version` | Tag with build number suffix | `25.42.1+1234` |

## 💡 Use Cases

- **🏢 Enterprise Applications**: Predictable versioning for business applications
- **📱 Mobile Apps**: Clear release cycles tied to calendar weeks
- **🌐 Web Services**: API versioning that correlates with deployment schedules
- **📦 Library Releases**: Time-based versioning for regular maintenance releases
- **🔄 Continuous Deployment**: Automated versioning for CD pipelines

## 🛠️ Advanced Usage

### Conditional Tagging

```yaml
- name: Generate version (no push)
  id: calver
  uses: jterral/calendar-versioning-action@v2
  with:
    tag-push: 'false'

- name: Manual tag push
  if: github.ref == 'refs/heads/main'
  run: |
    git push origin ${{ steps.calver.outputs.tag }}
```

### API Versioning with Prefix

```yaml
- name: Generate API version
  id: calver
  uses: jterral/calendar-versioning-action@v2
  with:
    tag-prefix: 'api-'
    tag-push: 'true'

- name: Use the versioned API tag
  run: |
    echo "API version: ${{ steps.calver.outputs.tag }}"
    echo "Full version: ${{ steps.calver.outputs.version }}"
```

### Docker Image Tagging

```yaml
- name: Generate CalVer
  id: calver
  uses: jterral/calendar-versioning-action@v2

- name: Build and push Docker image
  run: |
    docker build -t myapp:${{ steps.calver.outputs.tag }} .
    docker build -t myapp:${{ steps.calver.outputs.version }} .
    docker push myapp:${{ steps.calver.outputs.tag }}
    docker push myapp:${{ steps.calver.outputs.version }}
```

## ⚠️ Requirements

- **Git Repository**: The action automatically checks out the repository with full history (`fetch-depth: 0`)
- **Write Permissions**: If using `tag-push: true`, ensure your workflow has permission to push tags to the repository

## 🤝 Contributing

We welcome contributions! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 📄 License

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.

## ⭐ Support

If this action helped you, please consider giving it a star! ⭐

Found a bug or have a feature request? [Open an issue](https://github.com/jterral/calendar-versioning-action/issues) - we're here to help!
