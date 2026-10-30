# Ukrainian QWERTY for iPhone — starter project

This repository contains an XcodeGen project specification, a small container app, and a custom iOS keyboard extension.

## Current features
- Ukrainian Cyrillic letters in the requested QWERTY positions.
- Shift, delete, numbers/symbols toggle, space, punctuation, Return, and next-keyboard key.
- The keyboard extension does not request Full Access.

## Not included yet
- Predictive text or autocorrect.
- App Store distribution or a signed IPA.
- A guarantee that the project has been built on Apple's toolchain. The GitHub Actions workflow builds an **unsigned simulator app** to check compilation; that artifact cannot be installed on a physical iPhone.

## Build
The GitHub Actions workflow uses a macOS runner and XcodeGen to generate the Xcode project from `project.yml`, then builds for the iOS simulator without code signing.

A physical-device installation requires valid Apple code signing and provisioning for both the containing app and keyboard extension. Never put Apple ID passwords or verification codes in this repository.
