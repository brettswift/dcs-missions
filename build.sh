#!/usr/bin/env bash

echo "Building miz files for deployment"
mkdir -p dist

TAG=$(git describe --tags)
TAG_DASHES=$(echo $TAG | sed -e "s/\./-/g")
echo "Found version ${TAG} (${TAG_DASHES})"
for d in DCS*/ ; do
    (
        if [ ! -d "$d" ]; then
            echo "Skipping invalid path: $d"
            continue
        fi
        cd "$d"
        # in dcs version folders so we can get the directory name into a var easier

        for mission in */ ; do
            if [ ! -d "$mission" ]; then
                echo "Skipping invalid path: $mission"
                continue
            fi
            MISSION_NAME=$(echo $mission | sed -e 's/\/$//')
            echo "Packaging up: $MISSION_NAME"
            # ls -lah "$MISSION_NAME/"
            cd "${MISSION_NAME}"
            zip -r "../../dist/${MISSION_NAME}-${TAG_DASHES}.miz" .
        done
    )
done

echo "Finished packaging.  Files that will be deployed are:"
ls -lah dist/