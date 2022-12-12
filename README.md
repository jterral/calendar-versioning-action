# Calendar Versioning Action

Simple CalVer GitHub Composite Action.

## Inputs

### commit-tag

Indicate to commit the tag or not.

## Outputs

### Tag

The tag is generated with the year and the week number, followed by the number of same tag.

For example:

* User tags the branch for the first time in week, the generated tag will be `22.42.0`.
* Second user add new tag same week, the generated tag will be `22.42.1`.

### Version

Version is built with tag suffixed by unique build number, for example `22.42.0+1234`.
