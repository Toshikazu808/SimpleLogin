# SimpleLogin
Simple login UI.  Does not include Firebase dependencies.
Steps to use:
1. Open Terminal, cd to project directory
2. pod init
3. open Podfile
4. Add following pods into file:
pod 'Firebase/Core'
pod 'Firebase/Auth'
pod 'Firebase/Analytics'
5. pod install
6. Open file .xcworkspace
7. Make sure you include:
import Firebase
import FirebaseAuth
