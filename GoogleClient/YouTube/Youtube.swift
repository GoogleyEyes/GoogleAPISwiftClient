//
//  Youtube.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public enum YoutubeSearchOrder: String {
	case Date = "date"
	case Rating = "rating"
	case Relevance = "relevance"
	case Title = "title"
	case VideoCount = "videoCount"
	case ViewCount = "viewCount"
}

public enum YoutubeSearchVideoCaption: String {
	case Any = "any"
	case ClosedCaption = "closedCaption"
	case None = "none"
}

public enum YoutubeCommentThreadsModerationStatus: String {
	case HeldForReview = "heldForReview"
	case LikelySpam = "likelySpam"
	case Published = "published"
}

public enum YoutubeVideosRating: String {
	case Dislike = "dislike"
	case Like = "like"
	case None = "none"
}

public enum YoutubeSearchVideoEmbeddable: String {
	case Any = "any"
	case True = "true"
}

public enum YoutubeLiveBroadcastsBroadcastStatus: String {
	case Complete = "complete"
	case Live = "live"
	case Testing = "testing"
}

public enum YoutubeLiveBroadcastsBroadcastType: String {
	case All = "all"
	case Event = "event"
	case Persistent = "persistent"
}

public class Youtube: GoogleService {
	var apiNameInURL: String = "youtube"
	var apiVersionString: String = "v3"

	/// OAuth 2.0 token for the current user.
	public var accessToken: String? {
		didSet {
			GoogleServiceFetcher.sharedInstance.accessToken = accessToken
		}
	}
	/// API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
	public var apiKey: String? {
		didSet {
			GoogleServiceFetcher.sharedInstance.apiKey = apiKey
		}
	}
	public static let sharedInstance = Youtube()
	private init() {

	}

	/// IP address of the site where the request originates. Use this if you want to enforce per-user limits.
	public var userIp: String!
	/// Returns response with indentations and line breaks.
	public var prettyPrint: Bool = true
	/// Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
	public var quotaUser: String!
	/// Selector specifying which fields to include in a partial response.
	public var fields: String!
	/// Data format for the response.
	public var alt: YoutubeAlt = .Json
	/// API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
	public var key: String!
	/// OAuth 2.0 token for the current user.
	public var oauthToken: String!
	
	/**
	Note: This parameter is intended exclusively for YouTube content partners.
	
	The onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.*/
	public var onBehalfOfContentOwner: String!
	
	public func setWatermarks(invideoBranding invideoBranding: YoutubeInvideoBranding, channelId: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(channelId, forKey: "channelId")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "watermarks/set", queryParams: queryParams, postBody: Mapper<YoutubeInvideoBranding>().toJSON(invideoBranding)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func unsetWatermarks(channelId channelId: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(channelId, forKey: "channelId")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "watermarks/unset", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func setThumbnails(videoId videoId: String, completionHandler: (thumbnailSetResponse: YoutubeThumbnailSetResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(videoId, forKey: "videoId")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "thumbnails/set", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(thumbnailSetResponse: nil, error: error)
			} else if JSON != nil {
				let thumbnailSetResponse = Mapper<YoutubeThumbnailSetResponse>().map(JSON)
				completionHandler(thumbnailSetResponse: thumbnailSetResponse, error: nil)
			}
		}
	}

	public func insertLiveChatBans(liveChatBan liveChatBan: YoutubeLiveChatBan, part: String, completionHandler: (liveChatBan: YoutubeLiveChatBan?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/bans", queryParams: queryParams, postBody: Mapper<YoutubeLiveChatBan>().toJSON(liveChatBan)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveChatBan: nil, error: error)
			} else if JSON != nil {
				let liveChatBan = Mapper<YoutubeLiveChatBan>().map(JSON)
				completionHandler(liveChatBan: liveChatBan, error: nil)
			}
		}
	}

	public func deleteLiveChatBans(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/bans", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// The regionCode parameter instructs the API to return the list of video categories available in the specified country. The parameter value is an ISO 3166-1 alpha-2 country code.
	public var regionCode: String!
	/// The id parameter specifies a comma-separated list of video category IDs for the resources that you are retrieving.
	public var id: String!
	/// The hl parameter specifies the language that should be used for text values in the API response.
	public var hl: String = "en_US"
	
	public func listVideoCategories(part part: String, completionHandler: (videoCategoryListResponse: YoutubeVideoCategoryListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let regionCode = regionCode {
			queryParams.updateValue(regionCode, forKey: "regionCode")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videoCategories", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(videoCategoryListResponse: nil, error: error)
			} else if JSON != nil {
				let videoCategoryListResponse = Mapper<YoutubeVideoCategoryListResponse>().map(JSON)
				completionHandler(videoCategoryListResponse: videoCategoryListResponse, error: nil)
			}
		}
	}

	public func insertLiveChatModerators(liveChatModerator liveChatModerator: YoutubeLiveChatModerator, part: String, completionHandler: (liveChatModerator: YoutubeLiveChatModerator?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/moderators", queryParams: queryParams, postBody: Mapper<YoutubeLiveChatModerator>().toJSON(liveChatModerator)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveChatModerator: nil, error: error)
			} else if JSON != nil {
				let liveChatModerator = Mapper<YoutubeLiveChatModerator>().map(JSON)
				completionHandler(liveChatModerator: liveChatModerator, error: nil)
			}
		}
	}

	/// The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.
	public var pageToken: String!
	/// The maxResults parameter specifies the maximum number of items that should be returned in the result set.
	public var maxResults: UInt = 5
	
	public func listLiveChatModerators(liveChatId liveChatId: String, part: String, completionHandler: (liveChatModeratorlistResponse: YoutubeLiveChatModeratorListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(liveChatId, forKey: "liveChatId")
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/moderators", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveChatModeratorlistResponse: nil, error: error)
			} else if JSON != nil {
				let liveChatModeratorlistResponse = Mapper<YoutubeLiveChatModeratorListResponse>().map(JSON)
				completionHandler(liveChatModeratorlistResponse: liveChatModeratorlistResponse, error: nil)
			}
		}
	}

	public func deleteLiveChatModerators(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/moderators", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/**
	This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.
	
	The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.
	
	This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.*/
	public var onBehalfOfContentOwnerChannel: String!
	
	public func insertPlaylists(playlist playlist: YoutubePlaylist, part: String, completionHandler: (playlist: YoutubePlaylist?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlists", queryParams: queryParams, postBody: Mapper<YoutubePlaylist>().toJSON(playlist)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(playlist: nil, error: error)
			} else if JSON != nil {
				let playlist = Mapper<YoutubePlaylist>().map(JSON)
				completionHandler(playlist: playlist, error: nil)
			}
		}
	}

	public func deletePlaylists(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlists", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// This value indicates that the API should only return the specified channel's playlists.
	public var channelId: String!
	/// Set this parameter's value to true to instruct the API to only return playlists owned by the authenticated user.
	public var mine: Bool!
	
	public func listPlaylists(part part: String, completionHandler: (playlistListResponse: YoutubePlaylistListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(hl, forKey: "hl")
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlists", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(playlistListResponse: nil, error: error)
			} else if JSON != nil {
				let playlistListResponse = Mapper<YoutubePlaylistListResponse>().map(JSON)
				completionHandler(playlistListResponse: playlistListResponse, error: nil)
			}
		}
	}

	public func updatePlaylists(playlist playlist: YoutubePlaylist, part: String, completionHandler: (playlist: YoutubePlaylist?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlists", queryParams: queryParams, postBody: Mapper<YoutubePlaylist>().toJSON(playlist)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(playlist: nil, error: error)
			} else if JSON != nil {
				let playlist = Mapper<YoutubePlaylist>().map(JSON)
				completionHandler(playlist: playlist, error: nil)
			}
		}
	}

	public func insertChannelBanners(channelBannerResource channelBannerResource: YoutubeChannelBannerResource, completionHandler: (channelBannerResource: YoutubeChannelBannerResource?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channelBanners/insert", queryParams: queryParams, postBody: Mapper<YoutubeChannelBannerResource>().toJSON(channelBannerResource)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(channelBannerResource: nil, error: error)
			} else if JSON != nil {
				let channelBannerResource = Mapper<YoutubeChannelBannerResource>().map(JSON)
				completionHandler(channelBannerResource: channelBannerResource, error: nil)
			}
		}
	}

	public func insertChannelSections(channelSection channelSection: YoutubeChannelSection, part: String, completionHandler: (channelSection: YoutubeChannelSection?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channelSections", queryParams: queryParams, postBody: Mapper<YoutubeChannelSection>().toJSON(channelSection)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(channelSection: nil, error: error)
			} else if JSON != nil {
				let channelSection = Mapper<YoutubeChannelSection>().map(JSON)
				completionHandler(channelSection: channelSection, error: nil)
			}
		}
	}

	public func deleteChannelSections(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channelSections", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func listChannelSections(part part: String, completionHandler: (channelSectionListResponse: YoutubeChannelSectionListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		queryParams.updateValue(part, forKey: "part")
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(hl, forKey: "hl")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channelSections", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(channelSectionListResponse: nil, error: error)
			} else if JSON != nil {
				let channelSectionListResponse = Mapper<YoutubeChannelSectionListResponse>().map(JSON)
				completionHandler(channelSectionListResponse: channelSectionListResponse, error: nil)
			}
		}
	}

	public func updateChannelSections(channelSection channelSection: YoutubeChannelSection, part: String, completionHandler: (channelSection: YoutubeChannelSection?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channelSections", queryParams: queryParams, postBody: Mapper<YoutubeChannelSection>().toJSON(channelSection)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(channelSection: nil, error: error)
			} else if JSON != nil {
				let channelSection = Mapper<YoutubeChannelSection>().map(JSON)
				completionHandler(channelSection: channelSection, error: nil)
			}
		}
	}

	/// ID of the Google+ Page for the channel that the request is be on behalf of
	public var onBehalfOf: String!
	/**
	The sync parameter indicates whether YouTube should automatically synchronize the caption file with the audio track of the video. If you set the value to true, YouTube will disregard any time codes that are in the uploaded caption file and generate new time codes for the captions.
	
	You should set the sync parameter to true if you are uploading a transcript, which has no time codes, or if you suspect the time codes in your file are incorrect and want YouTube to try to fix them.*/
	public var sync: Bool!
	
	public func insertCaptions(caption caption: YoutubeCaption, part: String, completionHandler: (caption: YoutubeCaption?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOf = onBehalfOf {
			queryParams.updateValue(onBehalfOf, forKey: "onBehalfOf")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let sync = sync {
			queryParams.updateValue(sync.toJSONString(), forKey: "sync")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "captions", queryParams: queryParams, postBody: Mapper<YoutubeCaption>().toJSON(caption)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(caption: nil, error: error)
			} else if JSON != nil {
				let caption = Mapper<YoutubeCaption>().map(JSON)
				completionHandler(caption: caption, error: nil)
			}
		}
	}

	public func deleteCaptions(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let onBehalfOf = onBehalfOf {
			queryParams.updateValue(onBehalfOf, forKey: "onBehalfOf")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "captions", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func listCaptions(videoId videoId: String, part: String, completionHandler: (captionListResponse: YoutubeCaptionListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(videoId, forKey: "videoId")
		if let onBehalfOf = onBehalfOf {
			queryParams.updateValue(onBehalfOf, forKey: "onBehalfOf")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "captions", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(captionListResponse: nil, error: error)
			} else if JSON != nil {
				let captionListResponse = Mapper<YoutubeCaptionListResponse>().map(JSON)
				completionHandler(captionListResponse: captionListResponse, error: nil)
			}
		}
	}

	public func updateCaptions(caption caption: YoutubeCaption, part: String, completionHandler: (caption: YoutubeCaption?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOf = onBehalfOf {
			queryParams.updateValue(onBehalfOf, forKey: "onBehalfOf")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let sync = sync {
			queryParams.updateValue(sync.toJSONString(), forKey: "sync")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "captions", queryParams: queryParams, postBody: Mapper<YoutubeCaption>().toJSON(caption)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(caption: nil, error: error)
			} else if JSON != nil {
				let caption = Mapper<YoutubeCaption>().map(JSON)
				completionHandler(caption: caption, error: nil)
			}
		}
	}

	/// The tfmt parameter specifies that the caption track should be returned in a specific format. If the parameter is not included in the request, the track is returned in its original format.
	public var tfmt: YoutubeCaptionsTfmt!
	/// The tlang parameter specifies that the API response should return a translation of the specified caption track. The parameter value is an ISO 639-1 two-letter language code that identifies the desired caption language. The translation is generated by using machine translation, such as Google Translate.
	public var tlang: String!
	
	public func downloadCaptions(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let tfmt = tfmt {
			queryParams.updateValue(tfmt.rawValue, forKey: "tfmt")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let onBehalfOf = onBehalfOf {
			queryParams.updateValue(onBehalfOf, forKey: "onBehalfOf")
		}
		if let tlang = tlang {
			queryParams.updateValue(tlang, forKey: "tlang")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "captions/\(id)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// The forUsername parameter specifies a YouTube username, thereby requesting the channel associated with that username.
	public var forUsername: String!
	/// The categoryId parameter specifies a YouTube guide category, thereby requesting YouTube channels associated with that category.
	public var categoryId: String!
	/**
	Note: This parameter is intended exclusively for YouTube content partners.
	
	Set this parameter's value to true to instruct the API to only return channels managed by the content owner that the onBehalfOfContentOwner parameter specifies. The user must be authenticated as a CMS account linked to the specified content owner and onBehalfOfContentOwner must be provided.*/
	public var managedByMe: Bool!
	/// Use the subscriptions.list method and its mySubscribers parameter to retrieve a list of subscribers to the authenticated user's channel.
	public var mySubscribers: Bool!
	
	public func listChannels(part part: String, completionHandler: (channelListResponse: YoutubeChannelListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(hl, forKey: "hl")
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let forUsername = forUsername {
			queryParams.updateValue(forUsername, forKey: "forUsername")
		}
		if let categoryId = categoryId {
			queryParams.updateValue(categoryId, forKey: "categoryId")
		}
		if let managedByMe = managedByMe {
			queryParams.updateValue(managedByMe.toJSONString(), forKey: "managedByMe")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let mySubscribers = mySubscribers {
			queryParams.updateValue(mySubscribers.toJSONString(), forKey: "mySubscribers")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channels", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(channelListResponse: nil, error: error)
			} else if JSON != nil {
				let channelListResponse = Mapper<YoutubeChannelListResponse>().map(JSON)
				completionHandler(channelListResponse: channelListResponse, error: nil)
			}
		}
	}

	public func updateChannels(channel channel: YoutubeChannel, part: String, completionHandler: (channel: YoutubeChannel?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channels", queryParams: queryParams, postBody: Mapper<YoutubeChannel>().toJSON(channel)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(channel: nil, error: error)
			} else if JSON != nil {
				let channel = Mapper<YoutubeChannel>().map(JSON)
				completionHandler(channel: channel, error: nil)
			}
		}
	}

	public func insertLiveBroadcasts(liveBroadcast liveBroadcast: YoutubeLiveBroadcast, part: String, completionHandler: (liveBroadcast: YoutubeLiveBroadcast?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts", queryParams: queryParams, postBody: Mapper<YoutubeLiveBroadcast>().toJSON(liveBroadcast)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveBroadcast: nil, error: error)
			} else if JSON != nil {
				let liveBroadcast = Mapper<YoutubeLiveBroadcast>().map(JSON)
				completionHandler(liveBroadcast: liveBroadcast, error: nil)
			}
		}
	}

	/// The walltime parameter specifies the wall clock time at which the specified slate change will occur. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sssZ) format.
	public var walltime: NSDate!
	/**
	The offsetTimeMs parameter specifies a positive time offset when the specified slate change will occur. The value is measured in milliseconds from the beginning of the broadcast's monitor stream, which is the time that the testing phase for the broadcast began. Even though it is specified in milliseconds, the value is actually an approximation, and YouTube completes the requested action as closely as possible to that time.
	
	If you do not specify a value for this parameter, then YouTube performs the action as soon as possible. See the Getting started guide for more details.
	
	Important: You should only specify a value for this parameter if your broadcast stream is delayed.*/
	public var offsetTimeMs: UInt64!
	/// The displaySlate parameter specifies whether the slate is being enabled or disabled.
	public var displaySlate: Bool!
	
	public func controlLiveBroadcasts(id id: String, part: String, completionHandler: (liveBroadcast: YoutubeLiveBroadcast?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let walltime = walltime {
			queryParams.updateValue(walltime.toJSONString(), forKey: "walltime")
		}
		queryParams.updateValue(id, forKey: "id")
		if let offsetTimeMs = offsetTimeMs {
			queryParams.updateValue(offsetTimeMs.toJSONString(), forKey: "offsetTimeMs")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let displaySlate = displaySlate {
			queryParams.updateValue(displaySlate.toJSONString(), forKey: "displaySlate")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts/control", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveBroadcast: nil, error: error)
			} else if JSON != nil {
				let liveBroadcast = Mapper<YoutubeLiveBroadcast>().map(JSON)
				completionHandler(liveBroadcast: liveBroadcast, error: nil)
			}
		}
	}

	public func deleteLiveBroadcasts(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// The streamId parameter specifies the unique ID of the video stream that is being bound to a broadcast. If this parameter is omitted, the API will remove any existing binding between the broadcast and a video stream.
	public var streamId: String!
	
	public func bindLiveBroadcasts(id id: String, part: String, completionHandler: (liveBroadcast: YoutubeLiveBroadcast?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let streamId = streamId {
			queryParams.updateValue(streamId, forKey: "streamId")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts/bind", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveBroadcast: nil, error: error)
			} else if JSON != nil {
				let liveBroadcast = Mapper<YoutubeLiveBroadcast>().map(JSON)
				completionHandler(liveBroadcast: liveBroadcast, error: nil)
			}
		}
	}

	public func updateLiveBroadcasts(liveBroadcast liveBroadcast: YoutubeLiveBroadcast, part: String, completionHandler: (liveBroadcast: YoutubeLiveBroadcast?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts", queryParams: queryParams, postBody: Mapper<YoutubeLiveBroadcast>().toJSON(liveBroadcast)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveBroadcast: nil, error: error)
			} else if JSON != nil {
				let liveBroadcast = Mapper<YoutubeLiveBroadcast>().map(JSON)
				completionHandler(liveBroadcast: liveBroadcast, error: nil)
			}
		}
	}

	/// The broadcastStatus parameter filters the API response to only include broadcasts with the specified status.
	public var broadcastStatus: YoutubeLiveBroadcastsBroadcastStatus!
	/// The broadcastType parameter filters the API response to only include broadcasts with the specified type. This is only compatible with the mine filter for now.
	public var broadcastType: YoutubeLiveBroadcastsBroadcastType = .Event
	
	public func listLiveBroadcasts(part part: String, completionHandler: (liveBroadcastlistResponse: YoutubeLiveBroadcastListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let broadcastStatus = broadcastStatus {
			queryParams.updateValue(broadcastStatus.rawValue, forKey: "broadcastStatus")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		queryParams.updateValue(broadcastType.rawValue, forKey: "broadcastType")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveBroadcastlistResponse: nil, error: error)
			} else if JSON != nil {
				let liveBroadcastlistResponse = Mapper<YoutubeLiveBroadcastListResponse>().map(JSON)
				completionHandler(liveBroadcastlistResponse: liveBroadcastlistResponse, error: nil)
			}
		}
	}

	public func transitionLiveBroadcasts(broadcastStatus broadcastStatus: YoutubeLiveBroadcastsBroadcastStatus, id: String, part: String, completionHandler: (liveBroadcast: YoutubeLiveBroadcast?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		queryParams.updateValue(broadcastStatus.rawValue, forKey: "broadcastStatus")
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts/transition", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveBroadcast: nil, error: error)
			} else if JSON != nil {
				let liveBroadcast = Mapper<YoutubeLiveBroadcast>().map(JSON)
				completionHandler(liveBroadcast: liveBroadcast, error: nil)
			}
		}
	}

	public func markAsSpamComments(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments/markAsSpam", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func insertComments(comment comment: YoutubeComment, part: String, completionHandler: (comment: YoutubeComment?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments", queryParams: queryParams, postBody: Mapper<YoutubeComment>().toJSON(comment)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(comment: nil, error: error)
			} else if JSON != nil {
				let comment = Mapper<YoutubeComment>().map(JSON)
				completionHandler(comment: comment, error: nil)
			}
		}
	}

	/**
	The banAuthor parameter lets you indicate that you want to automatically reject any additional comments written by the comment's author. Set the parameter value to true to ban the author.
	
	Note: This parameter is only valid if the moderationStatus parameter is also set to rejected.*/
	public var banAuthor: Bool = false
	
	public func setModerationStatusComments(id id: String, moderationStatus: YoutubeCommentsModerationStatus, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		queryParams.updateValue(moderationStatus.rawValue, forKey: "moderationStatus")
		queryParams.updateValue(banAuthor.toJSONString(), forKey: "banAuthor")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments/setModerationStatus", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func deleteComments(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// This parameter indicates whether the API should return comments formatted as HTML or as plain text.
	public var textFormat: YoutubeCommentsTextFormat = .Html
	/**
	The parentId parameter specifies the ID of the comment for which replies should be retrieved.
	
	Note: YouTube currently supports replies only for top-level comments. However, replies to replies may be supported in the future.*/
	public var parentId: String!
	
	public func listComments(part part: String, completionHandler: (commentListResponse: YoutubeCommentListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(textFormat.rawValue, forKey: "textFormat")
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let parentId = parentId {
			queryParams.updateValue(parentId, forKey: "parentId")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(commentListResponse: nil, error: error)
			} else if JSON != nil {
				let commentListResponse = Mapper<YoutubeCommentListResponse>().map(JSON)
				completionHandler(commentListResponse: commentListResponse, error: nil)
			}
		}
	}

	public func updateComments(comment comment: YoutubeComment, part: String, completionHandler: (comment: YoutubeComment?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments", queryParams: queryParams, postBody: Mapper<YoutubeComment>().toJSON(comment)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(comment: nil, error: error)
			} else if JSON != nil {
				let comment = Mapper<YoutubeComment>().map(JSON)
				completionHandler(comment: comment, error: nil)
			}
		}
	}

	public func listFanFundingEvents(part part: String, completionHandler: (fanfundingEventListResponse: YoutubeFanFundingEventListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "fanFundingEvents", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(fanfundingEventListResponse: nil, error: error)
			} else if JSON != nil {
				let fanfundingEventListResponse = Mapper<YoutubeFanFundingEventListResponse>().map(JSON)
				completionHandler(fanfundingEventListResponse: fanfundingEventListResponse, error: nil)
			}
		}
	}

	/**
	Note: This parameter is intended exclusively for YouTube content partners.
	
	The forContentOwner parameter restricts the search to only retrieve resources owned by the content owner specified by the onBehalfOfContentOwner parameter. The user must be authenticated using a CMS account linked to the specified content owner and onBehalfOfContentOwner must be provided.*/
	public var forContentOwner: Bool!
	/**
	The location parameter, in conjunction with the locationRadius parameter, defines a circular geographic area and also restricts a search to videos that specify, in their metadata, a geographic location that falls within that area. The parameter value is a string that specifies latitude/longitude coordinates e.g. (37.42307,-122.08427).
	
	
	- The location parameter value identifies the point at the center of the area.
	- The locationRadius parameter specifies the maximum distance that the location associated with a video can be from that point for the video to still be included in the search results.The API returns an error if your request specifies a value for the location parameter but does not also specify a value for the locationRadius parameter.*/
	public var location: String!
	/// The videoSyndicated parameter lets you to restrict a search to only videos that can be played outside youtube.com. If you specify a value for this parameter, you must also set the type parameter's value to video.
	public var videoSyndicated: YoutubeSearchVideoSyndicated!
	/// The videoDefinition parameter lets you restrict a search to only include either high definition (HD) or standard definition (SD) videos. HD videos are available for playback in at least 720p, though higher resolutions, like 1080p, might also be available. If you specify a value for this parameter, you must also set the type parameter's value to video.
	public var videoDefinition: YoutubeSearchVideoDefinition!
	/// The videoDimension parameter lets you restrict a search to only retrieve 2D or 3D videos. If you specify a value for this parameter, you must also set the type parameter's value to video.
	public var videoDimension: YoutubeSearchVideoDimension!
	/**
	The q parameter specifies the query term to search for.
	
	Your request can also use the Boolean NOT (-) and OR (|) operators to exclude videos or to find videos that are associated with one of several search terms. For example, to search for videos matching either "boating" or "sailing", set the q parameter value to boating|sailing. Similarly, to search for videos matching either "boating" or "sailing" but not "fishing", set the q parameter value to boating|sailing -fishing. Note that the pipe character must be URL-escaped when it is sent in your API request. The URL-escaped value for the pipe character is %7C.*/
	public var q: String!
	/// The videoDuration parameter filters video search results based on their duration. If you specify a value for this parameter, you must also set the type parameter's value to video.
	public var videoDuration: YoutubeSearchVideoDuration!
	/// The publishedBefore parameter indicates that the API response should only contain resources created before the specified time. The value is an RFC 3339 formatted date-time value (1970-01-01T00:00:00Z).
	public var publishedBefore: NSDate!
	/// The videoEmbeddable parameter lets you to restrict a search to only videos that can be embedded into a webpage. If you specify a value for this parameter, you must also set the type parameter's value to video.
	public var videoEmbeddable: YoutubeSearchVideoEmbeddable!
	/// The forDeveloper parameter restricts the search to only retrieve videos uploaded via the developer's application or website. The API server uses the request's authorization credentials to identify the developer. Therefore, a developer can restrict results to videos uploaded through the developer's own app or website but not to videos uploaded through other apps or sites.
	public var forDeveloper: Bool!
	/// The type parameter restricts a search query to only retrieve a particular type of resource. The value is a comma-separated list of resource types.
	public var type: String = "video,channel,playlist"
	/// The order parameter specifies the method that will be used to order resources in the API response.
	public var order: YoutubeSearchOrder = .Relevance
	/// The videoLicense parameter filters search results to only include videos with a particular license. YouTube lets video uploaders choose to attach either the Creative Commons license or the standard YouTube license to each of their videos. If you specify a value for this parameter, you must also set the type parameter's value to video.
	public var videoLicense: YoutubeSearchVideoLicense!
	/**
	The locationRadius parameter, in conjunction with the location parameter, defines a circular geographic area.
	
	The parameter value must be a floating point number followed by a measurement unit. Valid measurement units are m, km, ft, and mi. For example, valid parameter values include 1500m, 5km, 10000ft, and 0.75mi. The API does not support locationRadius parameter values larger than 1000 kilometers.
	
	Note: See the definition of the location parameter for more information.*/
	public var locationRadius: String!
	/// The relevanceLanguage parameter instructs the API to return search results that are most relevant to the specified language. The parameter value is typically an ISO 639-1 two-letter language code. However, you should use the values zh-Hans for simplified Chinese and zh-Hant for traditional Chinese. Please note that results in other languages will still be returned if they are highly relevant to the search query term.
	public var relevanceLanguage: String!
	/// The forMine parameter restricts the search to only retrieve videos owned by the authenticated user. If you set this parameter to true, then the type parameter's value must also be set to video.
	public var forMine: Bool!
	/// The channelType parameter lets you restrict a search to a particular type of channel.
	public var channelType: YoutubeSearchChannelType!
	/// The videoCaption parameter indicates whether the API should filter video search results based on whether they have captions. If you specify a value for this parameter, you must also set the type parameter's value to video.
	public var videoCaption: YoutubeSearchVideoCaption!
	/// The videoCategoryId parameter filters video search results based on their category. If you specify a value for this parameter, you must also set the type parameter's value to video.
	public var videoCategoryId: String!
	/// The videoType parameter lets you restrict a search to a particular type of videos. If you specify a value for this parameter, you must also set the type parameter's value to video.
	public var videoType: YoutubeSearchVideoType!
	/// The publishedAfter parameter indicates that the API response should only contain resources created after the specified time. The value is an RFC 3339 formatted date-time value (1970-01-01T00:00:00Z).
	public var publishedAfter: NSDate!
	/// The relatedToVideoId parameter retrieves a list of videos that are related to the video that the parameter value identifies. The parameter value must be set to a YouTube video ID and, if you are using this parameter, the type parameter must be set to video.
	public var relatedToVideoId: String!
	/// The eventType parameter restricts a search to broadcast events. If you specify a value for this parameter, you must also set the type parameter's value to video.
	public var eventType: YoutubeSearchEventType!
	/// The safeSearch parameter indicates whether the search results should include restricted content as well as standard content.
	public var safeSearch: YoutubeSearchSafeSearch!
	/// The topicId parameter indicates that the API response should only contain resources associated with the specified topic. The value identifies a Freebase topic ID.
	public var topicId: String!
	
	public func listSearch(part part: String, completionHandler: (searchListResponse: YoutubeSearchListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let regionCode = regionCode {
			queryParams.updateValue(regionCode, forKey: "regionCode")
		}
		if let forContentOwner = forContentOwner {
			queryParams.updateValue(forContentOwner.toJSONString(), forKey: "forContentOwner")
		}
		if let location = location {
			queryParams.updateValue(location, forKey: "location")
		}
		if let videoSyndicated = videoSyndicated {
			queryParams.updateValue(videoSyndicated.rawValue, forKey: "videoSyndicated")
		}
		if let videoDefinition = videoDefinition {
			queryParams.updateValue(videoDefinition.rawValue, forKey: "videoDefinition")
		}
		if let videoDimension = videoDimension {
			queryParams.updateValue(videoDimension.rawValue, forKey: "videoDimension")
		}
		if let q = q {
			queryParams.updateValue(q, forKey: "q")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let videoDuration = videoDuration {
			queryParams.updateValue(videoDuration.rawValue, forKey: "videoDuration")
		}
		if let publishedBefore = publishedBefore {
			queryParams.updateValue(publishedBefore.toJSONString(), forKey: "publishedBefore")
		}
		if let videoEmbeddable = videoEmbeddable {
			queryParams.updateValue(videoEmbeddable.rawValue, forKey: "videoEmbeddable")
		}
		if let forDeveloper = forDeveloper {
			queryParams.updateValue(forDeveloper.toJSONString(), forKey: "forDeveloper")
		}
		queryParams.updateValue(type, forKey: "type")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(order.rawValue, forKey: "order")
		if let videoLicense = videoLicense {
			queryParams.updateValue(videoLicense.rawValue, forKey: "videoLicense")
		}
		if let locationRadius = locationRadius {
			queryParams.updateValue(locationRadius, forKey: "locationRadius")
		}
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		if let relevanceLanguage = relevanceLanguage {
			queryParams.updateValue(relevanceLanguage, forKey: "relevanceLanguage")
		}
		if let forMine = forMine {
			queryParams.updateValue(forMine.toJSONString(), forKey: "forMine")
		}
		if let channelType = channelType {
			queryParams.updateValue(channelType.rawValue, forKey: "channelType")
		}
		if let videoCaption = videoCaption {
			queryParams.updateValue(videoCaption.rawValue, forKey: "videoCaption")
		}
		if let videoCategoryId = videoCategoryId {
			queryParams.updateValue(videoCategoryId, forKey: "videoCategoryId")
		}
		if let videoType = videoType {
			queryParams.updateValue(videoType.rawValue, forKey: "videoType")
		}
		if let publishedAfter = publishedAfter {
			queryParams.updateValue(publishedAfter.toJSONString(), forKey: "publishedAfter")
		}
		if let relatedToVideoId = relatedToVideoId {
			queryParams.updateValue(relatedToVideoId, forKey: "relatedToVideoId")
		}
		if let eventType = eventType {
			queryParams.updateValue(eventType.rawValue, forKey: "eventType")
		}
		if let safeSearch = safeSearch {
			queryParams.updateValue(safeSearch.rawValue, forKey: "safeSearch")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let topicId = topicId {
			queryParams.updateValue(topicId, forKey: "topicId")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "search", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(searchListResponse: nil, error: error)
			} else if JSON != nil {
				let searchListResponse = Mapper<YoutubeSearchListResponse>().map(JSON)
				completionHandler(searchListResponse: searchListResponse, error: nil)
			}
		}
	}

	public func listGuideCategories(part part: String, completionHandler: (guideCategoryListResponse: YoutubeGuideCategoryListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let regionCode = regionCode {
			queryParams.updateValue(regionCode, forKey: "regionCode")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "guideCategories", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(guideCategoryListResponse: nil, error: error)
			} else if JSON != nil {
				let guideCategoryListResponse = Mapper<YoutubeGuideCategoryListResponse>().map(JSON)
				completionHandler(guideCategoryListResponse: guideCategoryListResponse, error: nil)
			}
		}
	}

	public func insertActivities(activity activity: YoutubeActivity, part: String, completionHandler: (activity: YoutubeActivity?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "activities", queryParams: queryParams, postBody: Mapper<YoutubeActivity>().toJSON(activity)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(activity: nil, error: error)
			} else if JSON != nil {
				let activity = Mapper<YoutubeActivity>().map(JSON)
				completionHandler(activity: activity, error: nil)
			}
		}
	}

	/// Set this parameter's value to true to retrieve the activity feed that displays on the YouTube home page for the currently authenticated user.
	public var home: Bool!
	
	public func listActivities(part part: String, completionHandler: (activityListResponse: YoutubeActivityListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		if let regionCode = regionCode {
			queryParams.updateValue(regionCode, forKey: "regionCode")
		}
		if let publishedAfter = publishedAfter {
			queryParams.updateValue(publishedAfter.toJSONString(), forKey: "publishedAfter")
		}
		queryParams.updateValue(part, forKey: "part")
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let publishedBefore = publishedBefore {
			queryParams.updateValue(publishedBefore.toJSONString(), forKey: "publishedBefore")
		}
		if let home = home {
			queryParams.updateValue(home.toJSONString(), forKey: "home")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "activities", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(activityListResponse: nil, error: error)
			} else if JSON != nil {
				let activityListResponse = Mapper<YoutubeActivityListResponse>().map(JSON)
				completionHandler(activityListResponse: activityListResponse, error: nil)
			}
		}
	}

	public func insertCommentThreads(commentThread commentThread: YoutubeCommentThread, part: String, completionHandler: (commentThread: YoutubeCommentThread?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "commentThreads", queryParams: queryParams, postBody: Mapper<YoutubeCommentThread>().toJSON(commentThread)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(commentThread: nil, error: error)
			} else if JSON != nil {
				let commentThread = Mapper<YoutubeCommentThread>().map(JSON)
				completionHandler(commentThread: commentThread, error: nil)
			}
		}
	}

	/**
	Set this parameter to limit the returned comment threads to a particular moderation state.
	
	Note: This parameter is not supported for use in conjunction with the id parameter.*/
	public var moderationStatus: YoutubeCommentThreadsModerationStatus = .Published
	/**
	The searchTerms parameter instructs the API to limit the API response to only contain comments that contain the specified search terms.
	
	Note: This parameter is not supported for use in conjunction with the id parameter.*/
	public var searchTerms: String!
	/// The allThreadsRelatedToChannelId parameter instructs the API to return all comment threads associated with the specified channel. The response can include comments about the channel or about the channel's videos.
	public var allThreadsRelatedToChannelId: String!
	/// The videoId parameter instructs the API to return comment threads associated with the specified video ID.
	public var videoId: String!
	
	public func listCommentThreads(part part: String, completionHandler: (commentThreadListResponse: YoutubeCommentThreadListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(moderationStatus.rawValue, forKey: "moderationStatus")
		if let searchTerms = searchTerms {
			queryParams.updateValue(searchTerms, forKey: "searchTerms")
		}
		if let allThreadsRelatedToChannelId = allThreadsRelatedToChannelId {
			queryParams.updateValue(allThreadsRelatedToChannelId, forKey: "allThreadsRelatedToChannelId")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let videoId = videoId {
			queryParams.updateValue(videoId, forKey: "videoId")
		}
		queryParams.updateValue(textFormat.rawValue, forKey: "textFormat")
		queryParams.updateValue(order.rawValue, forKey: "order")
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "commentThreads", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(commentThreadListResponse: nil, error: error)
			} else if JSON != nil {
				let commentThreadListResponse = Mapper<YoutubeCommentThreadListResponse>().map(JSON)
				completionHandler(commentThreadListResponse: commentThreadListResponse, error: nil)
			}
		}
	}

	public func updateCommentThreads(commentThread commentThread: YoutubeCommentThread, part: String, completionHandler: (commentThread: YoutubeCommentThread?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "commentThreads", queryParams: queryParams, postBody: Mapper<YoutubeCommentThread>().toJSON(commentThread)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(commentThread: nil, error: error)
			} else if JSON != nil {
				let commentThread = Mapper<YoutubeCommentThread>().map(JSON)
				completionHandler(commentThread: commentThread, error: nil)
			}
		}
	}

	public func listVideoAbuseReportReasons(part part: String, completionHandler: (videoAbuseReportReasonListResponse: YoutubeVideoAbuseReportReasonListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videoAbuseReportReasons", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(videoAbuseReportReasonListResponse: nil, error: error)
			} else if JSON != nil {
				let videoAbuseReportReasonListResponse = Mapper<YoutubeVideoAbuseReportReasonListResponse>().map(JSON)
				completionHandler(videoAbuseReportReasonListResponse: videoAbuseReportReasonListResponse, error: nil)
			}
		}
	}

	public func insertLiveStreams(liveStream liveStream: YoutubeLiveStream, part: String, completionHandler: (liveStream: YoutubeLiveStream?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveStreams", queryParams: queryParams, postBody: Mapper<YoutubeLiveStream>().toJSON(liveStream)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveStream: nil, error: error)
			} else if JSON != nil {
				let liveStream = Mapper<YoutubeLiveStream>().map(JSON)
				completionHandler(liveStream: liveStream, error: nil)
			}
		}
	}

	public func deleteLiveStreams(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveStreams", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func listLiveStreams(part part: String, completionHandler: (liveStreamlistResponse: YoutubeLiveStreamListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveStreams", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveStreamlistResponse: nil, error: error)
			} else if JSON != nil {
				let liveStreamlistResponse = Mapper<YoutubeLiveStreamListResponse>().map(JSON)
				completionHandler(liveStreamlistResponse: liveStreamlistResponse, error: nil)
			}
		}
	}

	public func updateLiveStreams(liveStream liveStream: YoutubeLiveStream, part: String, completionHandler: (liveStream: YoutubeLiveStream?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveStreams", queryParams: queryParams, postBody: Mapper<YoutubeLiveStream>().toJSON(liveStream)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveStream: nil, error: error)
			} else if JSON != nil {
				let liveStream = Mapper<YoutubeLiveStream>().map(JSON)
				completionHandler(liveStream: liveStream, error: nil)
			}
		}
	}

	public func insertSubscriptions(subscription subscription: YoutubeSubscription, part: String, completionHandler: (subscription: YoutubeSubscription?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "subscriptions", queryParams: queryParams, postBody: Mapper<YoutubeSubscription>().toJSON(subscription)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(subscription: nil, error: error)
			} else if JSON != nil {
				let subscription = Mapper<YoutubeSubscription>().map(JSON)
				completionHandler(subscription: subscription, error: nil)
			}
		}
	}

	/// The forChannelId parameter specifies a comma-separated list of channel IDs. The API response will then only contain subscriptions matching those channels.
	public var forChannelId: String!
	
	public func listSubscriptions(part part: String, completionHandler: (subscriptionListResponse: YoutubeSubscriptionListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		if let forChannelId = forChannelId {
			queryParams.updateValue(forChannelId, forKey: "forChannelId")
		}
		queryParams.updateValue(part, forKey: "part")
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let mySubscribers = mySubscribers {
			queryParams.updateValue(mySubscribers.toJSONString(), forKey: "mySubscribers")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(order.rawValue, forKey: "order")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "subscriptions", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(subscriptionListResponse: nil, error: error)
			} else if JSON != nil {
				let subscriptionListResponse = Mapper<YoutubeSubscriptionListResponse>().map(JSON)
				completionHandler(subscriptionListResponse: subscriptionListResponse, error: nil)
			}
		}
	}

	public func deleteSubscriptions(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "subscriptions", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func insertPlaylistItems(playlistItem playlistItem: YoutubePlaylistItem, part: String, completionHandler: (playlistItem: YoutubePlaylistItem?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlistItems", queryParams: queryParams, postBody: Mapper<YoutubePlaylistItem>().toJSON(playlistItem)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(playlistItem: nil, error: error)
			} else if JSON != nil {
				let playlistItem = Mapper<YoutubePlaylistItem>().map(JSON)
				completionHandler(playlistItem: playlistItem, error: nil)
			}
		}
	}

	public func deletePlaylistItems(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlistItems", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// The playlistId parameter specifies the unique ID of the playlist for which you want to retrieve playlist items. Note that even though this is an optional parameter, every request to retrieve playlist items must specify a value for either the id parameter or the playlistId parameter.
	public var playlistId: String!
	
	public func listPlaylistItems(part part: String, completionHandler: (playlistItemListResponse: YoutubePlaylistItemListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let playlistId = playlistId {
			queryParams.updateValue(playlistId, forKey: "playlistId")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let videoId = videoId {
			queryParams.updateValue(videoId, forKey: "videoId")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlistItems", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(playlistItemListResponse: nil, error: error)
			} else if JSON != nil {
				let playlistItemListResponse = Mapper<YoutubePlaylistItemListResponse>().map(JSON)
				completionHandler(playlistItemListResponse: playlistItemListResponse, error: nil)
			}
		}
	}

	public func updatePlaylistItems(playlistItem playlistItem: YoutubePlaylistItem, part: String, completionHandler: (playlistItem: YoutubePlaylistItem?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlistItems", queryParams: queryParams, postBody: Mapper<YoutubePlaylistItem>().toJSON(playlistItem)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(playlistItem: nil, error: error)
			} else if JSON != nil {
				let playlistItem = Mapper<YoutubePlaylistItem>().map(JSON)
				completionHandler(playlistItem: playlistItem, error: nil)
			}
		}
	}

	/// The stabilize parameter indicates whether YouTube should adjust the video to remove shaky camera motions.
	public var stabilize: Bool!
	/// The autoLevels parameter indicates whether YouTube should automatically enhance the video's lighting and color.
	public var autoLevels: Bool!
	/// The notifySubscribers parameter indicates whether YouTube should send a notification about the new video to users who subscribe to the video's channel. A parameter value of True indicates that subscribers will be notified of newly uploaded videos. However, a channel owner who is uploading many videos might prefer to set the value to False to avoid sending a notification about each new video to the channel's subscribers.
	public var notifySubscribers: Bool = true
	
	public func insertVideos(video video: YoutubeVideo, part: String, completionHandler: (video: YoutubeVideo?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let stabilize = stabilize {
			queryParams.updateValue(stabilize.toJSONString(), forKey: "stabilize")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		queryParams.updateValue(part, forKey: "part")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let autoLevels = autoLevels {
			queryParams.updateValue(autoLevels.toJSONString(), forKey: "autoLevels")
		}
		queryParams.updateValue(notifySubscribers.toJSONString(), forKey: "notifySubscribers")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos", queryParams: queryParams, postBody: Mapper<YoutubeVideo>().toJSON(video)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(video: nil, error: error)
			} else if JSON != nil {
				let video = Mapper<YoutubeVideo>().map(JSON)
				completionHandler(video: video, error: nil)
			}
		}
	}

	public func rateVideos(id id: String, rating: YoutubeVideosRating, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		queryParams.updateValue(rating.rawValue, forKey: "rating")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos/rate", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func getRatingVideos(id id: String, completionHandler: (videoGetRatingResponse: YoutubeVideoGetRatingResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos/getRating", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(videoGetRatingResponse: nil, error: error)
			} else if JSON != nil {
				let videoGetRatingResponse = Mapper<YoutubeVideoGetRatingResponse>().map(JSON)
				completionHandler(videoGetRatingResponse: videoGetRatingResponse, error: nil)
			}
		}
	}

	public func deleteVideos(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func reportAbuseVideos(videoAbuseReport videoAbuseReport: YoutubeVideoAbuseReport, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos/reportAbuse", queryParams: queryParams, postBody: Mapper<YoutubeVideoAbuseReport>().toJSON(videoAbuseReport)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func updateVideos(video video: YoutubeVideo, part: String, completionHandler: (video: YoutubeVideo?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos", queryParams: queryParams, postBody: Mapper<YoutubeVideo>().toJSON(video)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(video: nil, error: error)
			} else if JSON != nil {
				let video = Mapper<YoutubeVideo>().map(JSON)
				completionHandler(video: video, error: nil)
			}
		}
	}

	/// DEPRECATED
	public var locale: String!
	/// The chart parameter identifies the chart that you want to retrieve.
	public var chart: YoutubeVideosChart!
	/// Set this parameter's value to like or dislike to instruct the API to only return videos liked or disliked by the authenticated user.
	public var myRating: YoutubeVideosMyRating!
	
	public func listVideos(part part: String, completionHandler: (videoListResponse: YoutubeVideoListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let locale = locale {
			queryParams.updateValue(locale, forKey: "locale")
		}
		if let regionCode = regionCode {
			queryParams.updateValue(regionCode, forKey: "regionCode")
		}
		if let chart = chart {
			queryParams.updateValue(chart.rawValue, forKey: "chart")
		}
		queryParams.updateValue(part, forKey: "part")
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(hl, forKey: "hl")
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(videoCategoryId, forKey: "videoCategoryId")
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let myRating = myRating {
			queryParams.updateValue(myRating.rawValue, forKey: "myRating")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(videoListResponse: nil, error: error)
			} else if JSON != nil {
				let videoListResponse = Mapper<YoutubeVideoListResponse>().map(JSON)
				completionHandler(videoListResponse: videoListResponse, error: nil)
			}
		}
	}

	/// The filter parameter specifies which channel sponsors to return.
	public var filter: YoutubeSponsorsFilter = .Newest
	
	public func listSponsors(part part: String, completionHandler: (sponsorListResponse: YoutubeSponsorListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		queryParams.updateValue(filter.rawValue, forKey: "filter")
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "sponsors", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(sponsorListResponse: nil, error: error)
			} else if JSON != nil {
				let sponsorListResponse = Mapper<YoutubeSponsorListResponse>().map(JSON)
				completionHandler(sponsorListResponse: sponsorListResponse, error: nil)
			}
		}
	}

	public func listI18nRegions(part part: String, completionHandler: (i18nRegionListResponse: YoutubeI18nRegionListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "i18nRegions", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(i18nRegionListResponse: nil, error: error)
			} else if JSON != nil {
				let i18nRegionListResponse = Mapper<YoutubeI18nRegionListResponse>().map(JSON)
				completionHandler(i18nRegionListResponse: i18nRegionListResponse, error: nil)
			}
		}
	}

	public func insertLiveChatMessages(liveChatMessage liveChatMessage: YoutubeLiveChatMessage, part: String, completionHandler: (liveChatMessage: YoutubeLiveChatMessage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/messages", queryParams: queryParams, postBody: Mapper<YoutubeLiveChatMessage>().toJSON(liveChatMessage)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveChatMessage: nil, error: error)
			} else if JSON != nil {
				let liveChatMessage = Mapper<YoutubeLiveChatMessage>().map(JSON)
				completionHandler(liveChatMessage: liveChatMessage, error: nil)
			}
		}
	}

	/// The profileImageSize parameter specifies the size of the user profile pictures that should be returned in the result set. Default: 88.
	public var profileImageSize: UInt!
	
	public func listLiveChatMessages(liveChatId liveChatId: String, part: String, completionHandler: (liveChatMessagelistResponse: YoutubeLiveChatMessageListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(liveChatId, forKey: "liveChatId")
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let profileImageSize = profileImageSize {
			queryParams.updateValue(profileImageSize.toJSONString(), forKey: "profileImageSize")
		}
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/messages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(liveChatMessagelistResponse: nil, error: error)
			} else if JSON != nil {
				let liveChatMessagelistResponse = Mapper<YoutubeLiveChatMessageListResponse>().map(JSON)
				completionHandler(liveChatMessagelistResponse: liveChatMessagelistResponse, error: nil)
			}
		}
	}

	public func deleteLiveChatMessages(id id: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/messages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func listI18nLanguages(part part: String, completionHandler: (i18nLanguageListResponse: YoutubeI18nLanguageListResponse?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(part, forKey: "part")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "i18nLanguages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(i18nLanguageListResponse: nil, error: error)
			} else if JSON != nil {
				let i18nLanguageListResponse = Mapper<YoutubeI18nLanguageListResponse>().map(JSON)
				completionHandler(i18nLanguageListResponse: i18nLanguageListResponse, error: nil)
			}
		}
	}

	func setUpQueryParams() -> [String: String] {
		var queryParams = [String: String]()
		if let userIp = userIp {
			queryParams.updateValue(userIp, forKey: "userIp")
		}
		queryParams.updateValue(prettyPrint.toJSONString(), forKey: "prettyPrint")
		if let quotaUser = quotaUser {
			queryParams.updateValue(quotaUser, forKey: "quotaUser")
		}
		if let fields = fields {
			queryParams.updateValue(fields, forKey: "fields")
		}
		queryParams.updateValue(alt.rawValue, forKey: "alt")
		if let key = key {
			queryParams.updateValue(key, forKey: "key")
		}
		if let oauthToken = oauthToken {
			queryParams.updateValue(oauthToken, forKey: "oauthToken")
		}
		return queryParams
	}
}

public enum YoutubeCommentThreadsOrder: String {
	case Relevance = "relevance"
	case Time = "time"
}

public enum YoutubeVideosMyRating: String {
	case Dislike = "dislike"
	case Like = "like"
}

public enum YoutubeSearchVideoSyndicated: String {
	case Any = "any"
	case True = "true"
}

public enum YoutubeSearchVideoDuration: String {
	case Any = "any"
	case Long = "long"
	case Medium = "medium"
	case Short = "short"
}

public enum YoutubeSubscriptionsOrder: String {
	case Alphabetical = "alphabetical"
	case Relevance = "relevance"
	case Unread = "unread"
}

public enum YoutubeCommentsTextFormat: String {
	case Html = "html"
	case PlainText = "plainText"
}

public enum YoutubeSearchVideoType: String {
	case Any = "any"
	case Episode = "episode"
	case Movie = "movie"
}

public enum YoutubeSearchVideoDimension: String {
	case X2d = "2d"
	case X3d = "3d"
	case Any = "any"
}

public enum YoutubeSponsorsFilter: String {
	case All = "all"
	case Newest = "newest"
}

public enum YoutubeSearchVideoLicense: String {
	case Any = "any"
	case CreativeCommon = "creativeCommon"
	case Youtube = "youtube"
}

public enum YoutubeCaptionsTfmt: String {
	case Sbv = "sbv"
	case Scc = "scc"
	case Srt = "srt"
	case Ttml = "ttml"
	case Vtt = "vtt"
}

public enum YoutubeSearchEventType: String {
	case Completed = "completed"
	case Live = "live"
	case Upcoming = "upcoming"
}

public enum YoutubeOAuthScopes: String {
	case YoutubepartnerChannelAudit = "https://www.googleapis.com/auth/youtubepartner-channel-audit"
	case Upload = "https://www.googleapis.com/auth/youtube.upload"
	case Youtube = "https://www.googleapis.com/auth/youtube"
	case Youtubepartner = "https://www.googleapis.com/auth/youtubepartner"
	case ForceSsl = "https://www.googleapis.com/auth/youtube.force-ssl"
	case Readonly = "https://www.googleapis.com/auth/youtube.readonly"
}

public enum YoutubeCommentsModerationStatus: String {
	case HeldForReview = "heldForReview"
	case Published = "published"
	case Rejected = "rejected"
}

public enum YoutubeSearchChannelType: String {
	case Any = "any"
	case Show = "show"
}

public enum YoutubeSearchVideoDefinition: String {
	case Any = "any"
	case High = "high"
	case Standard = "standard"
}

public enum YoutubeCommentThreadsTextFormat: String {
	case Html = "html"
	case PlainText = "plainText"
}

public enum YoutubeSearchSafeSearch: String {
	case Moderate = "moderate"
	case None = "none"
	case Strict = "strict"
}

public enum YoutubeAlt: String {
	case Json = "json"
}

public enum YoutubeVideosChart: String {
	case MostPopular = "mostPopular"
}

