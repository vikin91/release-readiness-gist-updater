# Release-readiness gist updater

[![Are we ready to release?](https://github.com/vikin91/release-readiness-gist-updater/actions/workflows/update-gist.yaml/badge.svg)](https://github.com/vikin91/release-readiness-gist-updater/actions/workflows/update-gist.yaml)

This project is a part of Stackrox 2022 Hackathon.

It uses Github actions to query external systems for status updates.
Based on that data, it evaluates whether starting a new upstream release of [stackrox/stackrox](https://github.com/stackrox/stackrox) would be a success or failure.
The detailed status is pushed to a [secret gist](https://gist.github.com/vikin91/7fda2135b348991d302f098abfbc5cf2) that can be consumed by a frontend.
