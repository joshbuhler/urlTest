# Demo of NSURLSession issues

When working on an Apple Watch project, my team has run into an issue where we're encountering a serious delay in the time it takes to load data using `NSURLSession`.

This project isolates the issue down to a simple test of loading content from a URL using two methods: `NSData:dataWithContentsOfURL:` and `NSURLSession`. Loading data via `NSData` is completing the task very quickly, whereas the `NSURLSession` method is often 5-10x longer, depending on the content being loaded. This is leading serious usability issues within our app, as often requests can be queued up, and take several seconds to complete.

The sample code that demonstrates this issue can be found in `InterfaceController.m` in the urlTest WatchKit Extension folder of this project. To see the issue in action, run this sample app in either the watchOS 2 simulator, or on an Apple Watch runing watchOS 2.

## Sample Test Results
Tests were run on a MacBook Pro, with the Apple Watch simulator[^1]. The app was built using Xcode 7.0[^2]. Similar results are seen when running on Apple Watch hardware. Each test was run 5 times against a few different URLs. All times listed are in seconds.

### https://www.apple.com

NSData | NSURLSession
------ | -------------
0.596  | 2.446
0.510  | 2.156
0.565  | 2.053
0.549  | 2.119
0.736  | 2.254

### https://www.google.com

NSData | NSURLSession
------ | -------------
0.365  | 2.498
0.340  | 2.457
0.106  | 2.094
0.115  | 2.137
0.104  | 2.131

### https://www.facebook.com

NSData | NSURLSession
------ | -------------
0.173  | 1.141
0.158  | 0.909
0.152  | 0.902
0.156  | 0.905
0.151  | 0.894


[^1]: Apple Watch Simulator Version 2.0 (SimulatorApp-621 CoreSimulator-179)

[^2]: Xcode Version 7.0 (7A220)