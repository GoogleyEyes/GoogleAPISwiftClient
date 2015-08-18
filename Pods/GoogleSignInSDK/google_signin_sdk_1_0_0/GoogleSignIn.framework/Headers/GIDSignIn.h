//
//  GIDSignIn.h
//  Google Sign-In iOS SDK
//
//  Copyright 2012 Google Inc.
//
//  Use of this SDK is subject to the Google APIs Terms of Service:
//  https://developers.google.com/terms/
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GIDGoogleUser;
@class GIDSignIn;

// The error domain for NSErrors returned by the Google Identity SDK.
extern NSString *const kGIDSignInErrorDomain;

// A list of potential error codes returned from the Google Identity SDK.
typedef NS_ENUM(NSInteger, GIDSignInErrorCode) {
  // Indicates an unknown error has occured.
  kGIDSignInErrorCodeUnknown = -1,
  // Indicates a problem reading or writing to the application keychain.
  kGIDSignInErrorCodeKeychain = -2,
  // Indicates no appropriate applications are installed on the user's device which can handle
  // sign-in. This code will only ever be returned if switching to Safari has been disabled.
  kGIDSignInErrorCodeNoSignInHandlersInstalled = -3,
};

// A protocol implemented by the delegate of |GIDSignIn| to receive a refresh token or an error.
@protocol GIDSignInDelegate

// The sign-in flow has finished and was successful if |error| is |nil|.
- (void)signIn:(GIDSignIn *)signIn
    didSignInForUser:(GIDGoogleUser *)user
           withError:(NSError *)error;

// Finished disconnecting |user| from the app successfully if |error| is |nil|.
@optional
- (void)signIn:(GIDSignIn *)signIn
    didDisconnectWithUser:(GIDGoogleUser *)user
                withError:(NSError *)error;

@end

// A protocol which may be implemented by consumers of |GIDSignIn| to be notified of when
// GIDSignIn has finished dispatching the sign-in request.
//
// This protocol is useful for developers who implement their own "Sign In with Google" button.
// Because there may be a brief delay between when the call to |signIn| is made, and when the
// app switch occurs, it is best practice to have the UI react to the user's input by displaying
// a spinner or other UI element. The |signInWillDispatch| method should be used to
// stop or hide the spinner.
@protocol GIDSignInUIDelegate <NSObject>

@optional

// The sign-in flow has finished selecting how to proceed, and the UI should no longer display
// a spinner or other "please wait" element.
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error;

@end

// This class signs the user in with Google. It also provides single sign-on via a capable Google
// app if one is installed.
//
// For reference, please see "Google Sign-In for iOS" at
// https://developers.google.com/identity/sign-in/ios
// Here is sample code to use |GIDSignIn|:
// 1. Get a reference to the |GIDSignIn| shared instance:
//    GIDSignIn *signIn = [GIDSignIn sharedInstance];
// 2. Set the OAuth 2.0 scopes you want to request:
//    [signIn setScopes:[NSArray arrayWithObject:@"https://www.googleapis.com/auth/plus.login"]];
// 3. Call [signIn setDelegate:self];
// 4. Set up delegate method |signIn:didSignInForUser:withError:|.
// 5. Call |handleURL| on the shared instance from |application:openUrl:...| in your app delegate.
// 6. Call |signIn| on the shared instance;
@interface GIDSignIn : NSObject

// The authentication object for the current user, or |nil| if there is currently no logged in user.
@property(nonatomic, readonly) GIDGoogleUser *currentUser;

// The object to be notified when authentication is finished.
@property(nonatomic, weak) id<GIDSignInDelegate> delegate;

// The object to be notified when sign in dispatch selection is finished.
@property(nonatomic, weak) id<GIDSignInUIDelegate> uiDelegate;

// The client ID of the app from the Google APIs console.  Must set for sign-in to work.
@property(nonatomic, copy) NSString *clientID;

// The client ID of the home web server.  This will be returned as the |audience| property of the
// JWT ID token.  For more info on the ID token:
// https://developers.google.com/accounts/docs/OAuth2Login#obtainuserinfo
//
// This property is optional. If you set it, set it before calling |signIn|.
@property(nonatomic, copy) NSString *serverClientID;

// The OpenID2 realm of the home web server. This allows Google to include the user's OpenID
// Identifier in the JWT ID token.
//
// This property is optional. If you set it, set it before calling |signIn|.
@property(nonatomic, copy) NSString *openIDRealm;

// The API scopes requested by the app in an array of |NSString|s.  The default value is |@[]|.
//
// This property is optional. If you set it, set it before calling |signIn|.
@property(nonatomic, copy) NSArray *scopes;

// The language for sign-in, in the form of ISO 639-1 language code optionally followed by a dash
// and ISO 3166-1 alpha-2 region code, such as |@"it"| or |@"pt-PT"|. Only set if different from
// system default.
//
// This property is optional. If you set it, set it before calling |signIn|.
@property(nonatomic, copy) NSString *language;

// Whether or not to fetch basic profile data after signing in. The data is saved in the
// |GIDGoogleUser.profileData| object.
//
// Setting the flag will add https://www.googleapis.com/auth/userinfo.email and
// https://www.googleapis.com/auth/userinfo.profile to scopes.
// Defaults to |YES|.
@property(nonatomic, assign) BOOL shouldFetchBasicProfile;

// Whether or not to switch to Chrome or Safari if no suitable Google apps are installed.
// Defaults to |YES|.
@property(nonatomic, assign) BOOL allowsSignInWithBrowser;

// Returns a shared |GIDSignIn| instance.
+ (GIDSignIn *)sharedInstance;

// Checks whether the user has either currently signed in or has previous authentication saved in
// keychain.
- (BOOL)hasAuthInKeychain;

// Checks if a Google app to handle sign in requests is installed on the user's
// device (mobile Safari will be used to sign in users if no such app is installed).
- (void)checkGoogleSignInAppInstalled:(void (^)(BOOL isInstalled))callback;

// Starts the sign-in process.  The delegate will be called at the end of this process.  Note that
// this method should not be called when the app is starting up, (e.g in
// application:didFinishLaunchingWithOptions:). Instead use the |signInSilently| method.
- (void)signIn;

// Attempts to sign in a previously authenticated user without interaction.  The delegate will be
// called at the end of this process indicating success or failure.
- (void)signInSilently;

// Marks current user as being in the signed out state.
- (void)signOut;

// Disconnects the current user from the app and revokes previous authentication. If the operation
// succeeds, the OAuth 2.0 token is also removed from keychain.
- (void)disconnect;

// This method should be called from your |UIApplicationDelegate|'s
// |application:openURL:sourceApplication:annotation|.  Returns |YES| if |GIDSignIn| handled this
// URL.
- (BOOL)handleURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation;

@end
