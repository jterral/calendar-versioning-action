#!/bin/bash
set -e

echo "::group::🔧 Git Config"
git config --global user.email "${INPUT_COMMIT_EMAIL}"
echo "Configured git user email: ${INPUT_COMMIT_EMAIL}"
git config --global user.name "${INPUT_COMMIT_NAME}"
echo "Configured git user name: ${INPUT_COMMIT_NAME}"
echo "::endgroup::"

echo "::group::🏷️ Tagging"
git tag -a "$TAG" -m "$VERSION"
echo "Created tag $TAG"
echo "::endgroup::"

if [[ "$INPUT_PUSH_TAG" == "true" ]]; then
  echo "::group::🚀 Pushing tag"
  git push origin "$TAG" || {
    echo "::error::❌ Failed to push tag '$TAG'. Check permissions or token scope."
    exit 1
  }
  echo "✅ Tag $TAG pushed to origin"
  echo "::endgroup::"
else
  echo "🧪 push-tag=false → skipping push of $TAG"
fi
