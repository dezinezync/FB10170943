# UIFindInteraction Bug

For **FB10170943**

### Steps to Reproduce
1. Build and run the app
2. Select any item from the list 
3. Tap on the search icon in the navigation bar to initiate the search session
4. Search for any string that appears in the on-screen content, eg. `quis` 
5. Tap on `Done` or the search icon in the navigation bar to end the search session.
6. Tapping again on search will present the search bar with the previous query pre-filled. 
7. Dismiss this view, and repeat step 2 and 3. The previous query will be pre-filled in the search bar. 

### Expected
Once a `UIFindInteraction` has been deallocated, it should no longer persist the search query or options. 

Each `UIFindInteraction` should maintain its own internal state and not have a shared state throughout the app. This should either be an opt-in or inversely, provide an option to opt-out of this behaviour if its determined to be essential. 
