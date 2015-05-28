#import <Foundation/NSData.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSURLRequest.h>
#import <Foundation/NSString.h>


@interface OMGHTTPURLRQ : NSObject

+ (NSMutableURLRequest *)GET:(NSString *)url :(NSDictionary *)parameters;
+ (NSMutableURLRequest *)POST:(NSString *)url :(id)parametersOrMultipartFormData;
+ (NSMutableURLRequest *)POST:(NSString *)url JSON:(id)JSONObject;
+ (NSMutableURLRequest *)PUT:(NSString *)url :(NSDictionary *)parameters;
+ (NSMutableURLRequest *)PUT:(NSString *)url JSON:(id)JSONObject;
+ (NSMutableURLRequest *)DELETE:(NSString *)url :(NSDictionary *)parameters;

@end



/**
 POST this with `OMGHTTPURLRQ`’s `-POST::` class method.
*/
@interface OMGMultipartFormData : NSObject

/**
 The `filename` parameter is optional. The content-type is optional, and 
 if left `nil` will default to *octet-stream*.
*/
- (void)addFile:(NSData *)data parameterName:(NSString *)parameterName filename:(NSString *)filename contentType:(NSString *)contentType;

- (void)addText:(NSString *)text parameterName:(NSString *)parameterName;

/**
 Technically adding parameters to a multipart/form-data request is abusing
 the specification. What we do is add each parameter as a text-item. Any
 API that expects parameters in a multipart/form-data request will expect
 the parameters to be encoded in this way.
*/
- (void)addParameters:(NSDictionary *)parameters;

@end
