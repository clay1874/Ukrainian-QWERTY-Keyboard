# Ukrainian QWERTY iPhone Keyboard

This is a starter source project for an iOS app containing a custom keyboard extension.

## What it is designed to do
- Provide a Ukrainian Cyrillic keyboard using familiar QWERTY key positions.
- Stay available as a normal iOS keyboard after it is installed and enabled.
- Let you switch to it with the iOS keyboard/globe control when other keyboards are enabled.
- Avoid requiring you to launch the container app every time you type.

## Important limitations
This ZIP is **source code, not an installable iPhone app**. It is not an `.ipa`, and it has not been signed by Apple. iOS requires an iOS app + keyboard extension to be built and signed with Xcode on macOS, then installed through an Apple-supported distribution method.

I cannot sign or install it directly onto your iPhone from this chat. A cloud Mac or a Mac-owning developer is needed for the build/signing step. You do not need a PC or Mac for everyday use after installation.

iOS also does not let third-party keyboards appear in every single field. Secure password fields and some protected/system contexts use Apple's keyboard or block third-party keyboards.

## Key mapping in this starter
Top row: Q W E R T Y U I O P [ ] -> й ц у к е н г ш щ з х ї  
Home row: A S D F G H J K L ; ' -> ф і в а п р о л д ж є  
Bottom row: Z X C V B N M , . -> я ч с м и т ь б ю

The keyboard is a direct key mapping. It does not transliterate English words phonetically.

## Build outline
1. Open the project on a Mac with a compatible version of Xcode.
2. Create an iOS App target and a Keyboard Extension target.
3. Add `ContainerApp/ContentView.swift` to the app target.
4. Add `KeyboardExtension/KeyboardViewController.swift` and `KeyboardExtension/Info.plist` to the keyboard extension target.
5. Set the extension's bundle identifier to a unique identifier under your app's bundle identifier.
6. Sign both targets with your Apple development team.
7. Build and install the app on the iPhone.
8. On iPhone, go to Settings > General > Keyboard > Keyboards > Add New Keyboard and enable the new keyboard.

This starter deliberately does not request Full Access and does not transmit typed text.
