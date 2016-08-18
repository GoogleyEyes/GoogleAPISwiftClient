//
//  YoutubeContentRating.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The video's rating from the Ministero dei Beni e delle Attività Culturali e del Turismo (Italy).
public enum YoutubeContentRatingMibacRating: String {
	/// 
	case MibacT = "mibacT"
	/// 
	case MibacUnrated = "mibacUnrated"
	/// 
	case MibacVap = "mibacVap"
	/// 
	case MibacVm12 = "mibacVm12"
	/// 
	case MibacVm14 = "mibacVm14"
	/// 
	case MibacVm18 = "mibacVm18"
}

/// Ratings schemes. The country-specific ratings are mostly for movies and shows. NEXT_ID: 68
public class YoutubeContentRating: ObjectType {
	/// The video's rating from the Movie and Television Review and Classification Board (Philippines).
	public var mtrcbRating: YoutubeContentRatingMtrcbRating!
	/// Reasons that explain why the video received its FPB (South Africa) rating.
	public var fpbRatingReasons: [String]!
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
	/// Rating system in Turkey - Evaluation and Classification Board of the Ministry of Culture and Tourism
	public var ecbmctRating: YoutubeContentRatingEcbmctRating!
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
	/// The video's rating in Poland.
	public var nbcplRating: YoutubeContentRatingNbcplRating!
	/// The video's rating from the Ministero dei Beni e delle Attività Culturali e del Turismo (Italy).
	public var mibacRating: YoutubeContentRatingMibacRating!
	/// The video's rating from the Nacionãlais Kino centrs (National Film Centre of Latvia).
	public var nkclvRating: YoutubeContentRatingNkclvRating!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		mtrcbRating <- map["mtrcbRating"]
		fpbRatingReasons <- map["fpbRatingReasons"]
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
		ecbmctRating <- map["ecbmctRating"]
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
		nbcplRating <- map["nbcplRating"]
		mibacRating <- map["mibacRating"]
		nkclvRating <- map["nkclvRating"]
	}
}

/// The video's Ministerio de Cultura (Colombia) rating.
public enum YoutubeContentRatingMocRating: String {
	/// 
	case Moc12 = "moc12"
	/// 
	case Moc15 = "moc15"
	/// 
	case Moc18 = "moc18"
	/// 
	case Moc7 = "moc7"
	/// 
	case MocBanned = "mocBanned"
	/// 
	case MocE = "mocE"
	/// 
	case MocT = "mocT"
	/// 
	case MocUnrated = "mocUnrated"
	/// 
	case MocX = "mocX"
}

/// The video's Australian Classification Board (ACB) or Australian Communications and Media Authority (ACMA) rating. ACMA ratings are used to classify children's television programming.
public enum YoutubeContentRatingAcbRating: String {
	/// 
	case AcbC = "acbC"
	/// 
	case AcbE = "acbE"
	/// 
	case AcbG = "acbG"
	/// 
	case AcbM = "acbM"
	/// 
	case AcbMa15plus = "acbMa15plus"
	/// 
	case AcbP = "acbP"
	/// 
	case AcbPg = "acbPg"
	/// 
	case AcbR18plus = "acbR18plus"
	/// 
	case AcbUnrated = "acbUnrated"
}

/// The video's rating from the Kenya Film Classification Board.
public enum YoutubeContentRatingKfcbRating: String {
	/// 
	case Kfcb16plus = "kfcb16plus"
	/// 
	case KfcbG = "kfcbG"
	/// 
	case KfcbPg = "kfcbPg"
	/// 
	case KfcbR = "kfcbR"
	/// 
	case KfcbUnrated = "kfcbUnrated"
}

/// The video's rating from Finland's Kansallinen Audiovisuaalinen Instituutti (National Audiovisual Institute).
public enum YoutubeContentRatingMekuRating: String {
	/// 
	case Meku12 = "meku12"
	/// 
	case Meku16 = "meku16"
	/// 
	case Meku18 = "meku18"
	/// 
	case Meku7 = "meku7"
	/// 
	case MekuS = "mekuS"
	/// 
	case MekuUnrated = "mekuUnrated"
}

/// The video's Motion Picture Association of America (MPAA) rating.
public enum YoutubeContentRatingMpaaRating: String {
	/// 
	case MpaaG = "mpaaG"
	/// 
	case MpaaNc17 = "mpaaNc17"
	/// 
	case MpaaPg = "mpaaPg"
	/// 
	case MpaaPg13 = "mpaaPg13"
	/// 
	case MpaaR = "mpaaR"
	/// 
	case MpaaUnrated = "mpaaUnrated"
}

/// The video's General Directorate of Radio, Television and Cinematography (Mexico) rating.
public enum YoutubeContentRatingRtcRating: String {
	/// 
	case RtcA = "rtcA"
	/// 
	case RtcAa = "rtcAa"
	/// 
	case RtcB = "rtcB"
	/// 
	case RtcB15 = "rtcB15"
	/// 
	case RtcC = "rtcC"
	/// 
	case RtcD = "rtcD"
	/// 
	case RtcUnrated = "rtcUnrated"
}

/// The video's rating from the Movie and Television Review and Classification Board (Philippines).
public enum YoutubeContentRatingMtrcbRating: String {
	/// 
	case MtrcbG = "mtrcbG"
	/// 
	case MtrcbPg = "mtrcbPg"
	/// 
	case MtrcbR13 = "mtrcbR13"
	/// 
	case MtrcbR16 = "mtrcbR16"
	/// 
	case MtrcbR18 = "mtrcbR18"
	/// 
	case MtrcbUnrated = "mtrcbUnrated"
	/// 
	case MtrcbX = "mtrcbX"
}

/// The video's rating from Portugal's Comissão de Classificação de Espect´culos.
public enum YoutubeContentRatingCceRating: String {
	/// 
	case CceM12 = "cceM12"
	/// 
	case CceM14 = "cceM14"
	/// 
	case CceM16 = "cceM16"
	/// 
	case CceM18 = "cceM18"
	/// 
	case CceM4 = "cceM4"
	/// 
	case CceM6 = "cceM6"
	/// 
	case CceUnrated = "cceUnrated"
}

/// The video's rating in Peru.
public enum YoutubeContentRatingPefilmRating: String {
	/// 
	case Pefilm14 = "pefilm14"
	/// 
	case Pefilm18 = "pefilm18"
	/// 
	case PefilmPg = "pefilmPg"
	/// 
	case PefilmPt = "pefilmPt"
	/// 
	case PefilmUnrated = "pefilmUnrated"
}

/// The video's TV Parental Guidelines (TVPG) rating.
public enum YoutubeContentRatingTvpgRating: String {
	/// 
	case Pg14 = "pg14"
	/// 
	case TvpgG = "tvpgG"
	/// 
	case TvpgMa = "tvpgMa"
	/// 
	case TvpgPg = "tvpgPg"
	/// 
	case TvpgUnrated = "tvpgUnrated"
	/// 
	case TvpgY = "tvpgY"
	/// 
	case TvpgY7 = "tvpgY7"
	/// 
	case TvpgY7Fv = "tvpgY7Fv"
}

/// The video's rating in Estonia.
public enum YoutubeContentRatingEefilmRating: String {
	/// 
	case EefilmK12 = "eefilmK12"
	/// 
	case EefilmK14 = "eefilmK14"
	/// 
	case EefilmK16 = "eefilmK16"
	/// 
	case EefilmK6 = "eefilmK6"
	/// 
	case EefilmL = "eefilmL"
	/// 
	case EefilmMs12 = "eefilmMs12"
	/// 
	case EefilmMs6 = "eefilmMs6"
	/// 
	case EefilmPere = "eefilmPere"
	/// 
	case EefilmUnrated = "eefilmUnrated"
}

/// voor de Classificatie van Audiovisuele Media (Netherlands).
public enum YoutubeContentRatingKijkwijzerRating: String {
	/// 
	case Kijkwijzer12 = "kijkwijzer12"
	/// 
	case Kijkwijzer16 = "kijkwijzer16"
	/// 
	case Kijkwijzer18 = "kijkwijzer18"
	/// 
	case Kijkwijzer6 = "kijkwijzer6"
	/// 
	case Kijkwijzer9 = "kijkwijzer9"
	/// 
	case KijkwijzerAl = "kijkwijzerAl"
	/// 
	case KijkwijzerUnrated = "kijkwijzerUnrated"
}

/// This property has been deprecated. Use the contentDetails.contentRating.cncRating instead.
public enum YoutubeContentRatingFmocRating: String {
	/// 
	case Fmoc10 = "fmoc10"
	/// 
	case Fmoc12 = "fmoc12"
	/// 
	case Fmoc16 = "fmoc16"
	/// 
	case Fmoc18 = "fmoc18"
	/// 
	case FmocE = "fmocE"
	/// 
	case FmocU = "fmocU"
	/// 
	case FmocUnrated = "fmocUnrated"
}

/// The video's rating from the Bulgarian National Film Center.
public enum YoutubeContentRatingNfrcRating: String {
	/// 
	case NfrcA = "nfrcA"
	/// 
	case NfrcB = "nfrcB"
	/// 
	case NfrcC = "nfrcC"
	/// 
	case NfrcD = "nfrcD"
	/// 
	case NfrcUnrated = "nfrcUnrated"
	/// 
	case NfrcX = "nfrcX"
}

/// The video's Canadian Home Video Rating System (CHVRS) rating.
public enum YoutubeContentRatingChvrsRating: String {
	/// 
	case Chvrs14a = "chvrs14a"
	/// 
	case Chvrs18a = "chvrs18a"
	/// 
	case ChvrsE = "chvrsE"
	/// 
	case ChvrsG = "chvrsG"
	/// 
	case ChvrsPg = "chvrsPg"
	/// 
	case ChvrsR = "chvrsR"
	/// 
	case ChvrsUnrated = "chvrsUnrated"
}

/// The video's Anatel (Asociación Nacional de Televisión) rating for Chilean television.
public enum YoutubeContentRatingAnatelRating: String {
	/// 
	case AnatelA = "anatelA"
	/// 
	case AnatelF = "anatelF"
	/// 
	case AnatelI = "anatelI"
	/// 
	case AnatelI10 = "anatelI10"
	/// 
	case AnatelI12 = "anatelI12"
	/// 
	case AnatelI7 = "anatelI7"
	/// 
	case AnatelR = "anatelR"
	/// 
	case AnatelUnrated = "anatelUnrated"
}

/// The video's rating from the Nacionãlais Kino centrs (National Film Centre of Latvia).
public enum YoutubeContentRatingNkclvRating: String {
	/// 
	case Nkclv12plus = "nkclv12plus"
	/// 
	case Nkclv18plus = "nkclv18plus"
	/// 
	case Nkclv7plus = "nkclv7plus"
	/// 
	case NkclvU = "nkclvU"
	/// 
	case NkclvUnrated = "nkclvUnrated"
}

/// The video's rating from Ireland's Raidió Teilifís Éireann.
public enum YoutubeContentRatingRteRating: String {
	/// 
	case RteCh = "rteCh"
	/// 
	case RteGa = "rteGa"
	/// 
	case RteMa = "rteMa"
	/// 
	case RtePs = "rtePs"
	/// 
	case RteUnrated = "rteUnrated"
}

/// The video's rating from Taiwan's Ministry of Culture (文化部).
public enum YoutubeContentRatingMoctwRating: String {
	/// 
	case MoctwG = "moctwG"
	/// 
	case MoctwP = "moctwP"
	/// 
	case MoctwPg = "moctwPg"
	/// 
	case MoctwR = "moctwR"
	/// 
	case MoctwR12 = "moctwR12"
	/// 
	case MoctwR15 = "moctwR15"
	/// 
	case MoctwUnrated = "moctwUnrated"
}

/// The video's rating in the Czech Republic.
public enum YoutubeContentRatingCzfilmRating: String {
	/// 
	case Czfilm12 = "czfilm12"
	/// 
	case Czfilm14 = "czfilm14"
	/// 
	case Czfilm18 = "czfilm18"
	/// 
	case CzfilmU = "czfilmU"
	/// 
	case CzfilmUnrated = "czfilmUnrated"
}

/// The video's rating in Poland.
public enum YoutubeContentRatingNbcplRating: String {
	/// 
	case Nbcpl18plus = "nbcpl18plus"
	/// 
	case NbcplI = "nbcplI"
	/// 
	case NbcplIi = "nbcplIi"
	/// 
	case NbcplIii = "nbcplIii"
	/// 
	case NbcplIv = "nbcplIv"
	/// 
	case NbcplUnrated = "nbcplUnrated"
}

/// Rating system in France - Commission de classification cinematographique
public enum YoutubeContentRatingCncRating: String {
	/// 
	case Cnc10 = "cnc10"
	/// 
	case Cnc12 = "cnc12"
	/// 
	case Cnc16 = "cnc16"
	/// 
	case Cnc18 = "cnc18"
	/// 
	case CncE = "cncE"
	/// 
	case CncT = "cncT"
	/// 
	case CncUnrated = "cncUnrated"
}

/// The video's Freiwillige Selbstkontrolle der Filmwirtschaft (FSK - Germany) rating.
public enum YoutubeContentRatingFskRating: String {
	/// 
	case Fsk0 = "fsk0"
	/// 
	case Fsk12 = "fsk12"
	/// 
	case Fsk16 = "fsk16"
	/// 
	case Fsk18 = "fsk18"
	/// 
	case Fsk6 = "fsk6"
	/// 
	case FskUnrated = "fskUnrated"
}

/// The video's Instituto de la Cinematografía y de las Artes Audiovisuales (ICAA - Spain) rating.
public enum YoutubeContentRatingIcaaRating: String {
	/// 
	case Icaa12 = "icaa12"
	/// 
	case Icaa13 = "icaa13"
	/// 
	case Icaa16 = "icaa16"
	/// 
	case Icaa18 = "icaa18"
	/// 
	case Icaa7 = "icaa7"
	/// 
	case IcaaApta = "icaaApta"
	/// 
	case IcaaUnrated = "icaaUnrated"
	/// 
	case IcaaX = "icaaX"
}

/// The video's rating from the Danish Film Institute's (Det Danske Filminstitut) Media Council for Children and Young People.
public enum YoutubeContentRatingMccypRating: String {
	/// 
	case Mccyp11 = "mccyp11"
	/// 
	case Mccyp15 = "mccyp15"
	/// 
	case Mccyp7 = "mccyp7"
	/// 
	case MccypA = "mccypA"
	/// 
	case MccypUnrated = "mccypUnrated"
}

/// The video's Departamento de Justiça, Classificação, Qualificação e Títulos (DJCQT - Brazil) rating.
public enum YoutubeContentRatingDjctqRating: String {
	/// 
	case Djctq10 = "djctq10"
	/// 
	case Djctq12 = "djctq12"
	/// 
	case Djctq14 = "djctq14"
	/// 
	case Djctq16 = "djctq16"
	/// 
	case Djctq18 = "djctq18"
	/// 
	case DjctqL = "djctqL"
	/// 
	case DjctqUnrated = "djctqUnrated"
}

/// The video's rating from the Maldives National Bureau of Classification.
public enum YoutubeContentRatingNbcRating: String {
	/// 
	case Nbc12plus = "nbc12plus"
	/// 
	case Nbc15plus = "nbc15plus"
	/// 
	case Nbc18plus = "nbc18plus"
	/// 
	case Nbc18plusr = "nbc18plusr"
	/// 
	case NbcG = "nbcG"
	/// 
	case NbcPg = "nbcPg"
	/// 
	case NbcPu = "nbcPu"
	/// 
	case NbcUnrated = "nbcUnrated"
}

/// The video's rating from the Commission de Contrôle des Films (Belgium).
public enum YoutubeContentRatingCicfRating: String {
	/// 
	case CicfE = "cicfE"
	/// 
	case CicfKntEna = "cicfKntEna"
	/// 
	case CicfKtEa = "cicfKtEa"
	/// 
	case CicfUnrated = "cicfUnrated"
}

/// A rating that YouTube uses to identify age-restricted content.
public enum YoutubeContentRatingYtRating: String {
	/// 
	case YtAgeRestricted = "ytAgeRestricted"
}

/// The video's Eirin (映倫) rating. Eirin is the Japanese rating system.
public enum YoutubeContentRatingEirinRating: String {
	/// 
	case EirinG = "eirinG"
	/// 
	case EirinPg12 = "eirinPg12"
	/// 
	case EirinR15plus = "eirinR15plus"
	/// 
	case EirinR18plus = "eirinR18plus"
	/// 
	case EirinUnrated = "eirinUnrated"
}

/// The video's rating from Thailand's Board of Film and Video Censors.
public enum YoutubeContentRatingBfvcRating: String {
	/// 
	case Bfvc13 = "bfvc13"
	/// 
	case Bfvc15 = "bfvc15"
	/// 
	case Bfvc18 = "bfvc18"
	/// 
	case Bfvc20 = "bfvc20"
	/// 
	case BfvcB = "bfvcB"
	/// 
	case BfvcE = "bfvcE"
	/// 
	case BfvcG = "bfvcG"
	/// 
	case BfvcUnrated = "bfvcUnrated"
}

/// The video's rating from Malta's Film Age-Classification Board.
public enum YoutubeContentRatingMccaaRating: String {
	/// 
	case Mccaa12 = "mccaa12"
	/// 
	case Mccaa12a = "mccaa12a"
	/// 
	case Mccaa14 = "mccaa14"
	/// 
	case Mccaa15 = "mccaa15"
	/// 
	case Mccaa16 = "mccaa16"
	/// 
	case Mccaa18 = "mccaa18"
	/// 
	case MccaaPg = "mccaaPg"
	/// 
	case MccaaU = "mccaaU"
	/// 
	case MccaaUnrated = "mccaaUnrated"
}

/// The video's National Film Registry of the Russian Federation (MKRF - Russia) rating.
public enum YoutubeContentRatingRussiaRating: String {
	/// 
	case Russia0 = "russia0"
	/// 
	case Russia12 = "russia12"
	/// 
	case Russia16 = "russia16"
	/// 
	case Russia18 = "russia18"
	/// 
	case Russia6 = "russia6"
	/// 
	case RussiaUnrated = "russiaUnrated"
}

/// The video's rating from the Canadian Radio-Television and Telecommunications Commission (CRTC) for Canadian French-language broadcasts. For more information, see the Canadian Broadcast Standards Council website.
public enum YoutubeContentRatingCatvfrRating: String {
	/// 
	case Catvfr13plus = "catvfr13plus"
	/// 
	case Catvfr16plus = "catvfr16plus"
	/// 
	case Catvfr18plus = "catvfr18plus"
	/// 
	case Catvfr8plus = "catvfr8plus"
	/// 
	case CatvfrG = "catvfrG"
	/// 
	case CatvfrUnrated = "catvfrUnrated"
}

/// Rating system in Turkey - Evaluation and Classification Board of the Ministry of Culture and Tourism
public enum YoutubeContentRatingEcbmctRating: String {
	/// 
	case Ecbmct13a = "ecbmct13a"
	/// 
	case Ecbmct13plus = "ecbmct13plus"
	/// 
	case Ecbmct15a = "ecbmct15a"
	/// 
	case Ecbmct15plus = "ecbmct15plus"
	/// 
	case Ecbmct18plus = "ecbmct18plus"
	/// 
	case Ecbmct7a = "ecbmct7a"
	/// 
	case Ecbmct7plus = "ecbmct7plus"
	/// 
	case EcbmctG = "ecbmctG"
	/// 
	case EcbmctUnrated = "ecbmctUnrated"
}

/// The video's rating from the Hungarian Nemzeti Filmiroda, the Rating Committee of the National Office of Film.
public enum YoutubeContentRatingRcnofRating: String {
	/// 
	case RcnofI = "rcnofI"
	/// 
	case RcnofIi = "rcnofIi"
	/// 
	case RcnofIii = "rcnofIii"
	/// 
	case RcnofIv = "rcnofIv"
	/// 
	case RcnofUnrated = "rcnofUnrated"
	/// 
	case RcnofV = "rcnofV"
	/// 
	case RcnofVi = "rcnofVi"
}

/// The video's rating from Medietilsynet, the Norwegian Media Authority.
public enum YoutubeContentRatingMedietilsynetRating: String {
	/// 
	case Medietilsynet11 = "medietilsynet11"
	/// 
	case Medietilsynet12 = "medietilsynet12"
	/// 
	case Medietilsynet15 = "medietilsynet15"
	/// 
	case Medietilsynet18 = "medietilsynet18"
	/// 
	case Medietilsynet6 = "medietilsynet6"
	/// 
	case Medietilsynet7 = "medietilsynet7"
	/// 
	case Medietilsynet9 = "medietilsynet9"
	/// 
	case MedietilsynetA = "medietilsynetA"
	/// 
	case MedietilsynetUnrated = "medietilsynetUnrated"
}

/// The video's rating from Nigeria's National Film and Video Censors Board.
public enum YoutubeContentRatingNfvcbRating: String {
	/// 
	case Nfvcb12 = "nfvcb12"
	/// 
	case Nfvcb12a = "nfvcb12a"
	/// 
	case Nfvcb15 = "nfvcb15"
	/// 
	case Nfvcb18 = "nfvcb18"
	/// 
	case NfvcbG = "nfvcbG"
	/// 
	case NfvcbPg = "nfvcbPg"
	/// 
	case NfvcbRe = "nfvcbRe"
	/// 
	case NfvcbUnrated = "nfvcbUnrated"
}

/// The video's rating from the Austrian Board of Media Classification (Bundesministerium für Unterricht, Kunst und Kultur).
public enum YoutubeContentRatingBmukkRating: String {
	/// 
	case Bmukk10 = "bmukk10"
	/// 
	case Bmukk12 = "bmukk12"
	/// 
	case Bmukk14 = "bmukk14"
	/// 
	case Bmukk16 = "bmukk16"
	/// 
	case Bmukk6 = "bmukk6"
	/// 
	case Bmukk8 = "bmukk8"
	/// 
	case BmukkAa = "bmukkAa"
	/// 
	case BmukkUnrated = "bmukkUnrated"
}

/// The video's rating from France's Conseil supérieur de l?audiovisuel, which rates broadcast content.
public enum YoutubeContentRatingCsaRating: String {
	/// 
	case Csa10 = "csa10"
	/// 
	case Csa12 = "csa12"
	/// 
	case Csa16 = "csa16"
	/// 
	case Csa18 = "csa18"
	/// 
	case CsaInterdiction = "csaInterdiction"
	/// 
	case CsaT = "csaT"
	/// 
	case CsaUnrated = "csaUnrated"
}

/// The video's rating in Switzerland.
public enum YoutubeContentRatingChfilmRating: String {
	/// 
	case Chfilm0 = "chfilm0"
	/// 
	case Chfilm12 = "chfilm12"
	/// 
	case Chfilm16 = "chfilm16"
	/// 
	case Chfilm18 = "chfilm18"
	/// 
	case Chfilm6 = "chfilm6"
	/// 
	case ChfilmUnrated = "chfilmUnrated"
}

/// The video's rating in Egypt.
public enum YoutubeContentRatingEgfilmRating: String {
	/// 
	case Egfilm18 = "egfilm18"
	/// 
	case EgfilmBn = "egfilmBn"
	/// 
	case EgfilmGn = "egfilmGn"
	/// 
	case EgfilmUnrated = "egfilmUnrated"
}

/// The video's rating in Venezuela.
public enum YoutubeContentRatingResorteviolenciaRating: String {
	/// 
	case ResorteviolenciaA = "resorteviolenciaA"
	/// 
	case ResorteviolenciaB = "resorteviolenciaB"
	/// 
	case ResorteviolenciaC = "resorteviolenciaC"
	/// 
	case ResorteviolenciaD = "resorteviolenciaD"
	/// 
	case ResorteviolenciaE = "resorteviolenciaE"
	/// 
	case ResorteviolenciaUnrated = "resorteviolenciaUnrated"
}

/// The video's rating from Singapore's Media Development Authority (MDA) and, specifically, it's Board of Film Censors (BFC).
public enum YoutubeContentRatingMdaRating: String {
	/// 
	case MdaG = "mdaG"
	/// 
	case MdaM18 = "mdaM18"
	/// 
	case MdaNc16 = "mdaNc16"
	/// 
	case MdaPg = "mdaPg"
	/// 
	case MdaPg13 = "mdaPg13"
	/// 
	case MdaR21 = "mdaR21"
	/// 
	case MdaUnrated = "mdaUnrated"
}

/// The video's rating in Israel.
public enum YoutubeContentRatingIlfilmRating: String {
	/// 
	case Ilfilm12 = "ilfilm12"
	/// 
	case Ilfilm16 = "ilfilm16"
	/// 
	case Ilfilm18 = "ilfilm18"
	/// 
	case IlfilmAa = "ilfilmAa"
	/// 
	case IlfilmUnrated = "ilfilmUnrated"
}

/// The video's Central Board of Film Certification (CBFC - India) rating.
public enum YoutubeContentRatingCbfcRating: String {
	/// 
	case CbfcA = "cbfcA"
	/// 
	case CbfcS = "cbfcS"
	/// 
	case CbfcU = "cbfcU"
	/// 
	case CbfcUA = "cbfcUA"
	/// 
	case CbfcUnrated = "cbfcUnrated"
}

/// The video's rating from Luxembourg's Commission de surveillance de la classification des films (CSCF).
public enum YoutubeContentRatingCscfRating: String {
	/// 
	case Cscf12 = "cscf12"
	/// 
	case Cscf16 = "cscf16"
	/// 
	case Cscf18 = "cscf18"
	/// 
	case Cscf6 = "cscf6"
	/// 
	case Cscf9 = "cscf9"
	/// 
	case CscfA = "cscfA"
	/// 
	case CscfAl = "cscfAl"
	/// 
	case CscfUnrated = "cscfUnrated"
}

/// The video's British Board of Film Classification (BBFC) rating.
public enum YoutubeContentRatingBbfcRating: String {
	/// 
	case Bbfc12 = "bbfc12"
	/// 
	case Bbfc12a = "bbfc12a"
	/// 
	case Bbfc15 = "bbfc15"
	/// 
	case Bbfc18 = "bbfc18"
	/// 
	case BbfcPg = "bbfcPg"
	/// 
	case BbfcR18 = "bbfcR18"
	/// 
	case BbfcU = "bbfcU"
	/// 
	case BbfcUnrated = "bbfcUnrated"
}

/// The video's INCAA (Instituto Nacional de Cine y Artes Audiovisuales - Argentina) rating.
public enum YoutubeContentRatingIncaaRating: String {
	/// 
	case IncaaAtp = "incaaAtp"
	/// 
	case IncaaC = "incaaC"
	/// 
	case IncaaSam13 = "incaaSam13"
	/// 
	case IncaaSam16 = "incaaSam16"
	/// 
	case IncaaSam18 = "incaaSam18"
	/// 
	case IncaaUnrated = "incaaUnrated"
}

/// The video's rating from Indonesia's Lembaga Sensor Film.
public enum YoutubeContentRatingLsfRating: String {
	/// 
	case Lsf13 = "lsf13"
	/// 
	case Lsf17 = "lsf17"
	/// 
	case Lsf21 = "lsf21"
	/// 
	case LsfA = "lsfA"
	/// 
	case LsfBo = "lsfBo"
	/// 
	case LsfD = "lsfD"
	/// 
	case LsfR = "lsfR"
	/// 
	case LsfSu = "lsfSu"
	/// 
	case LsfUnrated = "lsfUnrated"
}

/// The video's rating from Malaysia's Film Censorship Board.
public enum YoutubeContentRatingFcbmRating: String {
	/// 
	case Fcbm18 = "fcbm18"
	/// 
	case Fcbm18pa = "fcbm18pa"
	/// 
	case Fcbm18pl = "fcbm18pl"
	/// 
	case Fcbm18sg = "fcbm18sg"
	/// 
	case Fcbm18sx = "fcbm18sx"
	/// 
	case FcbmP13 = "fcbmP13"
	/// 
	case FcbmPg13 = "fcbmPg13"
	/// 
	case FcbmU = "fcbmU"
	/// 
	case FcbmUnrated = "fcbmUnrated"
}

/// The video's Irish Film Classification Office (IFCO - Ireland) rating. See the IFCO website for more information.
public enum YoutubeContentRatingIfcoRating: String {
	/// 
	case Ifco12 = "ifco12"
	/// 
	case Ifco12a = "ifco12a"
	/// 
	case Ifco15 = "ifco15"
	/// 
	case Ifco15a = "ifco15a"
	/// 
	case Ifco16 = "ifco16"
	/// 
	case Ifco18 = "ifco18"
	/// 
	case IfcoG = "ifcoG"
	/// 
	case IfcoPg = "ifcoPg"
	/// 
	case IfcoUnrated = "ifcoUnrated"
}

/// The video's Korea Media Rating Board (영상물등급위원회) rating. The KMRB rates videos in South Korea.
public enum YoutubeContentRatingKmrbRating: String {
	/// 
	case Kmrb12plus = "kmrb12plus"
	/// 
	case Kmrb15plus = "kmrb15plus"
	/// 
	case KmrbAll = "kmrbAll"
	/// 
	case KmrbR = "kmrbR"
	/// 
	case KmrbTeenr = "kmrbTeenr"
	/// 
	case KmrbUnrated = "kmrbUnrated"
}

/// The video's rating from Romania's CONSILIUL NATIONAL AL AUDIOVIZUALULUI (CNA).
public enum YoutubeContentRatingCnaRating: String {
	/// 
	case Cna12 = "cna12"
	/// 
	case Cna15 = "cna15"
	/// 
	case Cna18 = "cna18"
	/// 
	case Cna18plus = "cna18plus"
	/// 
	case CnaAp = "cnaAp"
	/// 
	case CnaUnrated = "cnaUnrated"
}

/// The video's Consejo de Calificación Cinematográfica (Chile) rating.
public enum YoutubeContentRatingCccRating: String {
	/// 
	case Ccc14 = "ccc14"
	/// 
	case Ccc18 = "ccc18"
	/// 
	case Ccc18s = "ccc18s"
	/// 
	case Ccc18v = "ccc18v"
	/// 
	case Ccc6 = "ccc6"
	/// 
	case CccTe = "cccTe"
	/// 
	case CccUnrated = "cccUnrated"
}

/// The video's rating from Hong Kong's Office for Film, Newspaper and Article Administration.
public enum YoutubeContentRatingFcoRating: String {
	/// 
	case FcoI = "fcoI"
	/// 
	case FcoIi = "fcoIi"
	/// 
	case FcoIia = "fcoIia"
	/// 
	case FcoIib = "fcoIib"
	/// 
	case FcoIii = "fcoIii"
	/// 
	case FcoUnrated = "fcoUnrated"
}

/// The video's rating in Slovakia.
public enum YoutubeContentRatingSkfilmRating: String {
	/// 
	case SkfilmG = "skfilmG"
	/// 
	case SkfilmP2 = "skfilmP2"
	/// 
	case SkfilmP5 = "skfilmP5"
	/// 
	case SkfilmP8 = "skfilmP8"
	/// 
	case SkfilmUnrated = "skfilmUnrated"
}

/// The video's rating in Greece.
public enum YoutubeContentRatingGrfilmRating: String {
	/// 
	case GrfilmE = "grfilmE"
	/// 
	case GrfilmK = "grfilmK"
	/// 
	case GrfilmK13 = "grfilmK13"
	/// 
	case GrfilmK17 = "grfilmK17"
	/// 
	case GrfilmUnrated = "grfilmUnrated"
}

/// The video's rating from Italy's Autorità per le Garanzie nelle Comunicazioni (AGCOM).
public enum YoutubeContentRatingAgcomRating: String {
	/// 
	case AgcomT = "agcomT"
	/// 
	case AgcomUnrated = "agcomUnrated"
	/// 
	case AgcomVm14 = "agcomVm14"
	/// 
	case AgcomVm18 = "agcomVm18"
}

/// The video's rating in Iceland.
public enum YoutubeContentRatingSmaisRating: String {
	/// 
	case Smais12 = "smais12"
	/// 
	case Smais14 = "smais14"
	/// 
	case Smais16 = "smais16"
	/// 
	case Smais18 = "smais18"
	/// 
	case Smais7 = "smais7"
	/// 
	case SmaisL = "smaisL"
	/// 
	case SmaisUnrated = "smaisUnrated"
}

/// Rating system for Canadian TV - Canadian TV Classification System The video's rating from the Canadian Radio-Television and Telecommunications Commission (CRTC) for Canadian English-language broadcasts. For more information, see the Canadian Broadcast Standards Council website.
public enum YoutubeContentRatingCatvRating: String {
	/// 
	case Catv14plus = "catv14plus"
	/// 
	case Catv18plus = "catv18plus"
	/// 
	case CatvC = "catvC"
	/// 
	case CatvC8 = "catvC8"
	/// 
	case CatvG = "catvG"
	/// 
	case CatvPg = "catvPg"
	/// 
	case CatvUnrated = "catvUnrated"
}

/// The video's Office of Film and Literature Classification (OFLC - New Zealand) rating.
public enum YoutubeContentRatingOflcRating: String {
	/// 
	case OflcG = "oflcG"
	/// 
	case OflcM = "oflcM"
	/// 
	case OflcPg = "oflcPg"
	/// 
	case OflcR13 = "oflcR13"
	/// 
	case OflcR15 = "oflcR15"
	/// 
	case OflcR16 = "oflcR16"
	/// 
	case OflcR18 = "oflcR18"
	/// 
	case OflcRp13 = "oflcRp13"
	/// 
	case OflcRp16 = "oflcRp16"
	/// 
	case OflcUnrated = "oflcUnrated"
}

/// The video's rating from South Africa's Film and Publication Board.
public enum YoutubeContentRatingFpbRating: String {
	/// 
	case Fpb10 = "fpb10"
	/// 
	case Fpb1012Pg = "fpb1012Pg"
	/// 
	case Fpb13 = "fpb13"
	/// 
	case Fpb16 = "fpb16"
	/// 
	case Fpb18 = "fpb18"
	/// 
	case Fpb79Pg = "fpb79Pg"
	/// 
	case FpbA = "fpbA"
	/// 
	case FpbPg = "fpbPg"
	/// 
	case FpbUnrated = "fpbUnrated"
	/// 
	case FpbX18 = "fpbX18"
	/// 
	case FpbXx = "fpbXx"
}

/// The video's rating from Statens medieråd (Sweden's National Media Council).
public enum YoutubeContentRatingSmsaRating: String {
	/// 
	case Smsa11 = "smsa11"
	/// 
	case Smsa15 = "smsa15"
	/// 
	case Smsa7 = "smsa7"
	/// 
	case SmsaA = "smsaA"
	/// 
	case SmsaUnrated = "smsaUnrated"
}

