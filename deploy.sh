#!/bin/bash
set -e

DEPLOY_USER="annevankesteren"

TITLE="Fetch Standard"
LS_URL="https://fetch.spec.whatwg.org/"
COMMIT_URL_BASE="https://github.com/whatwg/fetch/commit/"
BRANCH_URL_BASE="https://github.com/whatwg/fetch/tree/"

INPUT_FILE="fetch.bs"
SERVER="fetch.spec.whatwg.org"
WEB_ROOT="fetch.spec.whatwg.org"
COMMITS_DIR="commit-snapshots"
BRANCHES_DIR="branch-snapshots"

if [ "$1" != "--local" -a "$DEPLOY_USER" == "" ]; then
    echo "No deploy credentials present; skipping deploy"
    exit 0
fi

if [ "$1" == "--local" ]; then
    echo "Running a local deploy into $WEB_ROOT directory"
    echo ""
fi

SHA="`git rev-parse HEAD`"
BRANCH="`git rev-parse --abbrev-ref HEAD`"
if [ "$BRANCH" == "HEAD" ]; then # Travis does this for some reason
    BRANCH=$TRAVIS_BRANCH
fi

if [ "$BRANCH" == "master" -a "$TRAVIS_PULL_REQUEST" != "false" -a "$TRAVIS_PULL_REQUEST" != "" ]; then
    echo "Skipping deploy for a pull request; the branch build will suffice"
    exit 0
fi

BACK_TO_LS_LINK="<a href=\"/\" id=\"commit-snapshot-link\">Go to the living standard</a>"
SNAPSHOT_LINK="<a href=\"/commit-snapshots/$SHA/\" id=\"commit-snapshot-link\">Snapshot as of this commit</a>"

echo "Branch = $BRANCH"
echo "Commit = $SHA"
echo ""

rm -rf $WEB_ROOT || exit 0

# Commit snapshot
COMMIT_DIR=$WEB_ROOT/$COMMITS_DIR/$SHA
mkdir -p $COMMIT_DIR
curl https://api.csswg.org/bikeshed/ -f -F file=@$INPUT_FILE -F md-status=LS-COMMIT \
     -F md-warning="Commit $SHA $COMMIT_URL_BASE$SHA replaced by $LS_URL" \
     -F md-title="$TITLE (Commit Snapshot $SHA)" \
     -F md-Text-Macro="SNAPSHOT-LINK $BACK_TO_LS_LINK" \
     > $COMMIT_DIR/index.html;
echo "Commit snapshot output to $WEB_ROOT/$COMMITS_DIR/$SHA"
echo ""

if [ $BRANCH != "master" ] ; then
    # Branch snapshot, if not master
    BRANCH_DIR=$WEB_ROOT/$BRANCHES_DIR/$BRANCH
    mkdir -p $BRANCH_DIR
    curl https://api.csswg.org/bikeshed/ -f -F file=@$INPUT_FILE -F md-status=LS-BRANCH \
         -F md-warning="Branch $BRANCH $BRANCH_URL_BASE$BRANCH replaced by $LS_URL" \
         -F md-title="$TITLE (Branch Snapshot $BRANCH)" \
         -F md-Text-Macro="SNAPSHOT-LINK $SNAPSHOT_LINK" \
         > $BRANCH_DIR/index.html;
    echo "Branch snapshot output to $WEB_ROOT/$BRANCHES_DIR/$BRANCH"
else
    # Living standard, if master
    curl https://api.csswg.org/bikeshed/ -f -F file=@$INPUT_FILE \
         -F md-Text-Macro="SNAPSHOT-LINK $SNAPSHOT_LINK" \
         > $WEB_ROOT/index.html
    echo "Living standard output to $WEB_ROOT"
fi

echo ""
find $WEB_ROOT -print
echo ""

if [ "$1" != "--local" ]; then
    # Get the deploy key by using Travis's stored variables to decrypt deploy_key.enc
    ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
    ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
    ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
    ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
    openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in deploy_key.enc -out deploy_key -d
    chmod 600 deploy_key
    eval `ssh-agent -s`
    ssh-add deploy_key

    # scp the output directory up
    scp -r -o StrictHostKeyChecking=no $WEB_ROOT $DEPLOY_USER@$SERVER:
fi
