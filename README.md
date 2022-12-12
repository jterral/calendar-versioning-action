[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](https://opensource.org/licenses/MIT)

# Calendar Versioning Action

Simple CalVer GitHub Composite Action.

## Dependencies

* [Checkout](https://github.com/actions/checkout) To checks-out your repository so the workflow can access any specified ARM template.

## Inputs

* `commit-tag`: specify whether to commit the tag (default) or not.
* `commit-email`: specify the commit user email, default to `github-actions@github.com`.
* `commit-name`: specify the commit user name, default to `github-actions`.

## Outputs

* `tag`: generated with the year and the week number, followed by the count of same tag, example `22.42.0` for first tag and `22.42.1` for next tag.
* `version`: built with tag suffixed by unique build number, for example `22.42.0+1234`.

## Usage

```yml
- uses: jterral/calendar-versioning-action@v1
  with:
    commit-tag: 'true'
    commit-email: 'github-actions@github.com'
    commit-name: 'github-actions'
```

# License

See the [LICENSE](https://github.com/jterral/cityparkings-app/blob/mvvm/LICENSE.md) for more information.
