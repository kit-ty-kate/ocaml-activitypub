open Activitystreams

type ty_endpoints = [`Endpoints]

type prop_source = ty_object t option
type prop_shares = unit (* TODO: The activitypub reference doesn't give a lot of indications of the value of such field *)
type prop_inbox = ty_link t option (* TODO: Or either ty_collection?? *)
type prop_outbox = ty_link t option (* TODO: Or either ty_collection?? *)
type prop_following = ty_link t option (* TODO: Or either ty_collection?? *)
type prop_followers = ty_link t option (* TODO: Or either ty_collection?? *)
type prop_liked = ty_link t option (* TODO: Or either ty_collection?? *)
type prop_streams = ty_link t list (* TODO: Or either ty_collection?? *)
type prop_preferredUsername = string option
type prop_endpoints = ty_endpoints t option (* TODO: option or list?? *)
type prop_endpoints_proxyUrl = anyURI option
type prop_endpoints_oauthAuthorizationEndpoint = anyURI option
type prop_endpoints_authTokenEndpoint = anyURI option
type prop_endpoints_provideClientKey = anyURI option
type prop_endpoints_signClientKey = anyURI option
type prop_endpoints_sharedInbox = anyURI option

module Object : sig
  include module type of Object

  val source : [> ty_object] t -> prop_source
  val shares : [> ty_object] t -> prop_shares
end

(* TODO: Have a special type for actors? *)
module Actor : sig
  include module type of Object

  val inbox : [> ty_object] t -> prop_inbox
  val outbox : [> ty_object] t -> prop_outbox
  val following : [> ty_object] t -> prop_following
  val followers : [> ty_object] t -> prop_followers
  val liked : [> ty_object] t -> prop_liked
  val streams : [> ty_object] t -> prop_streams
  val preferredUsername : [> ty_object] t -> prop_preferredUsername
  val endpoints : [> ty_object] t -> prop_endpoints
end

module Endpoints : sig
  val proxyUrl : [> ty_endpoints] t -> prop_endpoints_proxyUrl
  val oauthAuthorizationEndpoint : [> ty_endpoints] t -> prop_endpoints_oauthAuthorizationEndpoint
  val oauthTokenEndpoint : [> ty_endpoints] t -> prop_endpoints_authTokenEndpoint
  val provideClientKey : [> ty_endpoints] t -> prop_endpoints_provideClientKey
  val signClientKey : [> ty_endpoints] t -> prop_endpoints_signClientKey
  val sharedInbox : [> ty_endpoints] t -> prop_endpoints_sharedInbox
end
