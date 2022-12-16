# Calendar Versioning Action

> Simple CalVer GitHub Composite Action.

## Inputs

* `commit-tag`: specify whether to commit the tag (default) or not.
* `commit-email`: specify the commit user email, default to `github-actions@github.com`.
* `commit-name`: specify the commit user name, default to `github-actions`.

## Outputs

* `tag`: generated with the year and the week number, followed by the count of same tag, example `22.42.0` for first tag and `22.42.1` for next tag.
* `version`: built with tag suffixed by unique build number, for example `22.42.0+1234`.

## Usage

### Requirements

To run this action, you will need to set `fetch-depth: 0` to fetch all history for all branches and tags.

```yml
- name: Checkout repository
  uses: actions/checkout@v2
  with:
    fetch-depth: 0 # This is a required field
```

### Example

```yml
- uses: jterral/calendar-versioning-action@v1
  with:
    commit-tag: 'true'
    commit-email: 'github-actions@github.com'
    commit-name: 'github-actions'
```

## License

The scripts and documentation in this project are released under the [MIT LICENSE](https://github.com/jterral/cityparkings-app/blob/mvvm/LICENSE.md).
