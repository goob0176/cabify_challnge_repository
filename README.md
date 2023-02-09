This is my solution to the [Cabify's take-home challenge.](https://github.com/cabify/MobileChallenge)
---------------------------------------------------------------------------------------------------------

I've designed and developed simple and user-friendly application which allows users to buy Cabify's products with different discounts:

![Application gif](https://drive.google.com/uc?export=view&id=1s2tYSNewJSgrLYP0xyq342UdBKZtAf0r)

General technical info:
---------------

- Application was written using SwiftUI, Swift 5 and Xcode 14.2. (Latest stable releases at the moment)
- Minimum deployment target is iOS 16.0.
- Application uses MVVM Architecture.
- Network data receiving and error handling are written using Combine.

Testing
---------------
- Application is covered by different types of tests: unit, snapshot and UI-tests.
- For snapshot testing the following library is used and connected with Swift Package Manager:
https://github.com/pointfreeco/swift-snapshot-testing

>**⚠️ Warning: Before launching  snapshot tests on your local machine, be sure to select @3x simulator in Xcode (iPhone 14 for example) to prevent unexpected failures because of the different scaling.**

CI
---------------
- Application is connected to a CI via GitHub actions to execute tests remotely after each push.
- On CI tests are executed on iPhone 14 simulator
