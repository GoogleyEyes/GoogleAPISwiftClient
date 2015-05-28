//
//  GIDAuthentication.h
//  Google Sign-In iOS SDK
//
//  Copyright 2014 Google Inc.
//
//  Use of this SDK is subject to the Google APIs Terms of Service:
//  https://developers.google.com/terms/
//

#import <Foundation/Foundation.h>

// This class represents the OAuth 2.0 entities needed for sign-in.
//
@interface GIDAuthentication : NSObject <NSCoding>

// The OAuth2 access token to access Google services.
@property(nonatomic, readonly) NSString *accessToken;

// The estimated expiration date of the access token.
@property(nonatomic, readonly) NSDate *accessTokenExpirationDate;

// The OAuth2 refresh token to exchange for new access tokens.
@property(nonatomic, readonly) NSString *refreshToken;

// A JSON Web Token identifying the user. Send this token to your server to authenticate the user on
// the server. For more information on JWTs, see
// http://tools.ietf.org/html/draft-ietf-oauth-json-web-token-05
@property(nonatomic, readonly) NSString *idToken;

@end
