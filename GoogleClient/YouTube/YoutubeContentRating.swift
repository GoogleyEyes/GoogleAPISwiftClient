//
//  YoutubeContentRating.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeContentRating: Mappable {
	/// The video's rating from the Movie and Television Review and Classification Board (Philippines).
	public var mtrcbRating: YoutubeContentRatingMtrcbRating!
	/// The video's National Film Registry of the Russian Federation (MKRF - Russia) rating.
	public var russiaRating: YoutubeContentRatingRussiaRating!
	/// The video's rating in Egypt.
	public var egfilmRating: YoutubeContentRatingEgfilmRating!
	/// The video's rating from France's Conseil supérieur de l?audiovisuel, which rates broadcast content.
	public var csaRating: YoutubeContentRatingCsaRating!
	/// The video's rating from Malta's Film Age-Classification Board.
	public var mccaaRating: YoutubeContentRatingMccaaRating!
	/// The video's rating from Finland's Kansallinen Audiovisuaalinen Instituutti (National Audiovisual Institute).
	public var mekuRating: YoutubeContentRatingMekuRating!
	/// The video's Canadian Home Video Rating System (CHVRS) rating.
	public var chvrsRating: YoutubeContentRatingChvrsRating!
	/// The video's rating in Peru.
	public var pefilmRating: YoutubeContentRatingPefilmRating!
	/// This property has been deprecated. Use the contentDetails.contentRating.cncRating instead.
	public var fmocRating: YoutubeContentRatingFmocRating!
	/// The video's rating from the Hungarian Nemzeti Filmiroda, the Rating Committee of the National Office of Film.
	public var rcnofRating: YoutubeContentRatingRcnofRating!
	/// The video's rating from Romania's CONSILIUL NATIONAL AL AUDIOVIZUALULUI (CNA).
	public var cnaRating: YoutubeContentRatingCnaRating!
	/// The video's General Directorate of Radio, Television and Cinematography (Mexico) rating.
	public var rtcRating: YoutubeContentRatingRtcRating!
	/// Reasons that explain why the video received its DJCQT (Brazil) rating.
	public var djctqRatingReasons: [String]!
	/// Rating system for Canadian TV - Canadian TV Classification System The video's rating from the Canadian Radio-Television and Telecommunications Commission (CRTC) for Canadian English-language broadcasts. For more information, see the Canadian Broadcast Standards Council website.
	public var catvRating: YoutubeContentRatingCatvRating!
	/// voor de Classificatie van Audiovisuele Media (Netherlands).
	public var kijkwijzerRating: YoutubeContentRatingKijkwijzerRating!
	/// The video's rating in Slovakia.
	public var skfilmRating: YoutubeContentRatingSkfilmRating!
	/// The video's rating from the Danish Film Institute's (Det Danske Filminstitut) Media Council for Children and Young People.
	public var mccypRating: YoutubeContentRatingMccypRating!
	/// The video's British Board of Film Classification (BBFC) rating.
	public var bbfcRating: YoutubeContentRatingBbfcRating!
	/// The video's rating in Estonia.
	public var eefilmRating: YoutubeContentRatingEefilmRating!
	/// The video's Irish Film Classification Office (IFCO - Ireland) rating. See the IFCO website for more information.
	public var ifcoRating: YoutubeContentRatingIfcoRating!
	/// The video's rating from Ireland's Raidió Teilifís Éireann.
	public var rteRating: YoutubeContentRatingRteRating!
	/// The video's Consejo de Calificación Cinematográfica (Chile) rating.
	public var cccRating: YoutubeContentRatingCccRating!
	/// The video's rating from Statens medieråd (Sweden's National Media Council).
	public var smsaRating: YoutubeContentRatingSmsaRating!
	/// The video's Departamento de Justiça, Classificação, Qualificação e Títulos (DJCQT - Brazil) rating.
	public var djctqRating: YoutubeContentRatingDjctqRating!
	/// The video's rating from the Canadian Radio-Television and Telecommunications Commission (CRTC) for Canadian French-language broadcasts. For more information, see the Canadian Broadcast Standards Council website.
	public var catvfrRating: YoutubeContentRatingCatvfrRating!
	/// The video's Motion Picture Association of America (MPAA) rating.
	public var mpaaRating: YoutubeContentRatingMpaaRating!
	/// The video's rating from Singapore's Media Development Authority (MDA) and, specifically, it's Board of Film Censors (BFC).
	public var mdaRating: YoutubeContentRatingMdaRating!
	/// The video's rating in Switzerland.
	public var chfilmRating: YoutubeContentRatingChfilmRating!
	/// The video's rating from Medietilsynet, the Norwegian Media Authority.
	public var medietilsynetRating: YoutubeContentRatingMedietilsynetRating!
	/// The video's Instituto de la Cinematografía y de las Artes Audiovisuales (ICAA - Spain) rating.
	public var icaaRating: YoutubeContentRatingIcaaRating!
	/// The video's rating from the Maldives National Bureau of Classification.
	public var nbcRating: YoutubeContentRatingNbcRating!
	/// The video's Korea Media Rating Board (영상물등급위원회) rating. The KMRB rates videos in South Korea.
	public var kmrbRating: YoutubeContentRatingKmrbRating!
	/// The video's rating from Thailand's Board of Film and Video Censors.
	public var bfvcRating: YoutubeContentRatingBfvcRating!
	/// The video's Anatel (Asociación Nacional de Televisión) rating for Chilean television.
	public var anatelRating: YoutubeContentRatingAnatelRating!
	/// The video's rating in the Czech Republic.
	public var czfilmRating: YoutubeContentRatingCzfilmRating!
	/// The video's rating from Portugal's Comissão de Classificação de Espect´culos.
	public var cceRating: YoutubeContentRatingCceRating!
	/// The video's rating from the Austrian Board of Media Classification (Bundesministerium für Unterricht, Kunst und Kultur).
	public var bmukkRating: YoutubeContentRatingBmukkRating!
	/// The video's TV Parental Guidelines (TVPG) rating.
	public var tvpgRating: YoutubeContentRatingTvpgRating!
	/// Rating system in France - Commission de classification cinematographique
	public var cncRating: YoutubeContentRatingCncRating!
	/// The video's Central Board of Film Certification (CBFC - India) rating.
	public var cbfcRating: YoutubeContentRatingCbfcRating!
	/// The video's rating from Hong Kong's Office for Film, Newspaper and Article Administration.
	public var fcoRating: YoutubeContentRatingFcoRating!
	/// The video's rating from Malaysia's Film Censorship Board.
	public var fcbmRating: YoutubeContentRatingFcbmRating!
	/// The video's rating from the Commission de Contrôle des Films (Belgium).
	public var cicfRating: YoutubeContentRatingCicfRating!
	/// The video's rating from Nigeria's National Film and Video Censors Board.
	public var nfvcbRating: YoutubeContentRatingNfvcbRating!
	/// The video's rating from Indonesia's Lembaga Sensor Film.
	public var lsfRating: YoutubeContentRatingLsfRating!
	/// The video's rating from Luxembourg's Commission de surveillance de la classification des films (CSCF).
	public var cscfRating: YoutubeContentRatingCscfRating!
	/// The video's rating from Italy's Autorità per le Garanzie nelle Comunicazioni (AGCOM).
	public var agcomRating: YoutubeContentRatingAgcomRating!
	/// The video's Australian Classification Board (ACB) or Australian Communications and Media Authority (ACMA) rating. ACMA ratings are used to classify children's television programming.
	public var acbRating: YoutubeContentRatingAcbRating!
	/// The video's Freiwillige Selbstkontrolle der Filmwirtschaft (FSK - Germany) rating.
	public var fskRating: YoutubeContentRatingFskRating!
	/// The video's rating in Venezuela.
	public var resorteviolenciaRating: YoutubeContentRatingResorteviolenciaRating!
	/// The video's rating in Israel.
	public var ilfilmRating: YoutubeContentRatingIlfilmRating!
	/// The video's rating from South Africa's Film and Publication Board.
	public var fpbRating: YoutubeContentRatingFpbRating!
	/// The video's rating from the Bulgarian National Film Center.
	public var nfrcRating: YoutubeContentRatingNfrcRating!
	/// A rating that YouTube uses to identify age-restricted content.
	public var ytRating: YoutubeContentRatingYtRating!
	/// The video's rating from the Kenya Film Classification Board.
	public var kfcbRating: YoutubeContentRatingKfcbRating!
	/// The video's Office of Film and Literature Classification (OFLC - New Zealand) rating.
	public var oflcRating: YoutubeContentRatingOflcRating!
	/// The video's rating in Iceland.
	public var smaisRating: YoutubeContentRatingSmaisRating!
	/// The video's rating from Taiwan's Ministry of Culture (文化部).
	public var moctwRating: YoutubeContentRatingMoctwRating!
	/// The video's INCAA (Instituto Nacional de Cine y Artes Audiovisuales - Argentina) rating.
	public var incaaRating: YoutubeContentRatingIncaaRating!
	/// The video's Eirin (映倫) rating. Eirin is the Japanese rating system.
	public var eirinRating: YoutubeContentRatingEirinRating!
	/// The video's Ministerio de Cultura (Colombia) rating.
	public var mocRating: YoutubeContentRatingMocRating!
	/// The video's rating in Greece.
	public var grfilmRating: YoutubeContentRatingGrfilmRating!
	/// The video's rating from the Ministero dei Beni e delle Attività Culturali e del Turismo (Italy).
	public var mibacRating: YoutubeContentRatingMibacRating!
	/// The video's rating from the Nacionãlais Kino centrs (National Film Centre of Latvia).
	public var nkclvRating: YoutubeContentRatingNkclvRating!
	/// The video's rating in Poland.
	public var nbcplRating: YoutubeContentRatingNbcplRating!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		mtrcbRating <- map["mtrcbRating"]
		russiaRating <- map["russiaRating"]
		egfilmRating <- map["egfilmRating"]
		csaRating <- map["csaRating"]
		mccaaRating <- map["mccaaRating"]
		mekuRating <- map["mekuRating"]
		chvrsRating <- map["chvrsRating"]
		pefilmRating <- map["pefilmRating"]
		fmocRating <- map["fmocRating"]
		rcnofRating <- map["rcnofRating"]
		cnaRating <- map["cnaRating"]
		rtcRating <- map["rtcRating"]
		djctqRatingReasons <- map["djctqRatingReasons"]
		catvRating <- map["catvRating"]
		kijkwijzerRating <- map["kijkwijzerRating"]
		skfilmRating <- map["skfilmRating"]
		mccypRating <- map["mccypRating"]
		bbfcRating <- map["bbfcRating"]
		eefilmRating <- map["eefilmRating"]
		ifcoRating <- map["ifcoRating"]
		rteRating <- map["rteRating"]
		cccRating <- map["cccRating"]
		smsaRating <- map["smsaRating"]
		djctqRating <- map["djctqRating"]
		catvfrRating <- map["catvfrRating"]
		mpaaRating <- map["mpaaRating"]
		mdaRating <- map["mdaRating"]
		chfilmRating <- map["chfilmRating"]
		medietilsynetRating <- map["medietilsynetRating"]
		icaaRating <- map["icaaRating"]
		nbcRating <- map["nbcRating"]
		kmrbRating <- map["kmrbRating"]
		bfvcRating <- map["bfvcRating"]
		anatelRating <- map["anatelRating"]
		czfilmRating <- map["czfilmRating"]
		cceRating <- map["cceRating"]
		bmukkRating <- map["bmukkRating"]
		tvpgRating <- map["tvpgRating"]
		cncRating <- map["cncRating"]
		cbfcRating <- map["cbfcRating"]
		fcoRating <- map["fcoRating"]
		fcbmRating <- map["fcbmRating"]
		cicfRating <- map["cicfRating"]
		nfvcbRating <- map["nfvcbRating"]
		lsfRating <- map["lsfRating"]
		cscfRating <- map["cscfRating"]
		agcomRating <- map["agcomRating"]
		acbRating <- map["acbRating"]
		fskRating <- map["fskRating"]
		resorteviolenciaRating <- map["resorteviolenciaRating"]
		ilfilmRating <- map["ilfilmRating"]
		fpbRating <- map["fpbRating"]
		nfrcRating <- map["nfrcRating"]
		ytRating <- map["ytRating"]
		kfcbRating <- map["kfcbRating"]
		oflcRating <- map["oflcRating"]
		smaisRating <- map["smaisRating"]
		moctwRating <- map["moctwRating"]
		incaaRating <- map["incaaRating"]
		eirinRating <- map["eirinRating"]
		mocRating <- map["mocRating"]
		grfilmRating <- map["grfilmRating"]
		mibacRating <- map["mibacRating"]
		nkclvRating <- map["nkclvRating"]
		nbcplRating <- map["nbcplRating"]
	}
}

