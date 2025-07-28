
// ignore_for_file: constant_identifier_names

import 'dart:ffi';



const String url = "https://saint.softvencefsd.xyz";
const String imageUrl = url;

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class PaymentGateway {
  PaymentGateway._();
  static String gateway(String orderId) => "";
}

final class Endpoints {
  Endpoints._();

  //===================== Auth Part ============================================
  static String signIn() => "/api/register";
  static String logInUrl() => "/api/login";
  static String otpSendApi() => "/api/resend-otp";
  static String otpVerification() => "/api/register-verify-otp";
  static String getHobbyApiLink() => "/api/hobby/get";
  static String postHobbyApiLink() => "/api/hobby/store";
  static String postEmailForgetApiLink() => "/api/forget-password";
  static String otpForgetApiLink() => "/api/verify-otp";
  static String forgetPasswordChangeApiLink() => "/api/reset-password";
  static String logout() => "/api/logout";

  ///>>>>>>>>>>>>>>>>>>> home screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  static String homeScreenAPiLink()=> "/api/group/search";
  static String createChannelGroupAPiLink()=> "/api/group/chat/group/create";
  static String requestUserDataApi()=> "/api/group/get";
  static String sendRequestDataApi()=> "/api/group/request";
  static String approveAndDenyRequestSendApiLink()=> "/api/group/memberadd";



  //================== Chat Part ===============================================

  static String chatterListUrl({dynamic chatType}) => "/api/chat/get?type=$chatType";
  static String getChatList(dynamic id) => "/api/chat/user/conversation/$id";
  static String addMessage()=> "/api/chat/message";
  static String groupSendMessage()=> "/api/group/groupmessage";
  static String groupSeeAllMember()=> "/api/group/member";




  ///>>>>>>>>>>>>>>>>>>>>> home section >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  static String getHomeStoryApiLink() => "/api/story/followers";
  static String getForYouApiLink() =>"/api/post/foryou";
  static String getFollowApiLink() =>"/api/follow/post";
  static String homeLikeApiLink() => "/api/like/store";
  static String homeBookMarkApiLink() => "/api/bookmarks/store";
  static String homeRepostApiLink() => "/api/repost/store";
  static String hollowPostApiLink() => "/api/follow/store";



  ///>>>>>>>>>>>>>>>>>>>> story section >>>>>>>>>>>>>>>>>>>>>>>>>>

  static String postStoryApiLink()=> "/api/story/store";
  static String getAllStoryApiLink(int id )=> "/api/story/all/$id";
  static String reactStoryApiLink()=> "/api/story/react";
  static String blockApiLink()=> "/api/story/block";
  static String muteApiLink()=> "/api/story/mute";
  static String repostApiLink()=> "/api/story/report";



  ///>>>>>>>>>>>>>>>> profile section >>>>>>>>>>>>>>>>>>>>>>>>>

  static String getFollowersApiLink()=> "/api/follow/get";
  static String getFollowingApiLink()=> "/api/follow/following";
  static String getProfileAllDataApiLink(dynamic id)=> "/api/profile/me?user_id=$id";
  static String getProfilePostApiLink(dynamic id)=> "/api/post/get?user_id=$id";
  static String getProfileRepostApiLink(dynamic id)=> "/api/repost/get?user_id=$id";
  static String getProfileHighlightApiLink(dynamic id)=> "/api/post/highlight?user_id=$id";
  static String getProfileReelsApiLink(dynamic id)=> "/api/reels/get?user_id=$id";


  ///>>>>>>>>>>>>>>>>>> reels >>>>>>>>>>>>>>>>>>>>>>>>>>

  static String getAllReelsApiLink(int id)=> "/api/reels/timeline?page=$id";
  static String postReelsApiLink()=> "/api/reels/store";
  static String postCommentApiLink()=> "/api/comment/store";


  ///>>>>>>>>>>>>>>>>>>> Comments >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  static String getAllCommentApiLink(int id, String type )=> "/api/comment/get/$type/$id";



  ///>>>>>>>>>>>>>>>> Post section >>>>>>>>>>>>>>>>>>>>>>>>>

  static String getSuggestedUserApiLink()=> "/api/tags/suggested";




}
