type ('a, 'b) either = Left of 'a | Right of 'b
type ('a, 'b, 'c) either3 = Case1 of 'a | Case2 of 'b | Case3 of 'c
type anyURI = Uri.t
type dateTime = {d_year : int; d_month : int; d_day : int; d_hours : int; d_minutes : int; d_seconds : int}
type nonNegativeInteger = int (* TODO: not equivalent to xsd:nonNegativeInteger *)
type units = Cm | Feet | Inches | Km | Meter | Miles

type ty_any = [`Any]
type ty_object = [`Object | ty_any]
type ty_link = [`Link | ty_any]
type ty_activity = [`Activity | ty_object]
type ty_collection = [`Collection | ty_object]
type ty_collectionPage = [`CollectionPage | ty_collection]
type ty_orderedCollectionPage = [`OrderedCollectionPage | ty_collectionPage]
type ty_intransitiveActivity = [`IntransitiveActivity | ty_activity]
type ty_question = [`Question | ty_intransitiveActivity]
type ty_relationship = [`Relationship | ty_object]
type ty_place = [`Place | ty_object]
type ty_profile = [`Profile | ty_object]
type ty_tombstone = [`Tombstone | ty_object]
type ty_image = [`Image | ty_object]

type 'a t constraint 'a = [> ty_any ]

type prop_id = anyURI option
type prop_type = anyURI list
type prop_actor = ty_any t list
type prop_attachment = ty_any t list
type prop_attributedTo = ty_any t list
type prop_audience = ty_any t list
type prop_bcc = ty_any t list
type prop_bto = ty_any t list
type prop_cc = ty_any t list
type prop_context = ty_any t list
type prop_current = (ty_collectionPage t, ty_link t) either option
type prop_first = (ty_collectionPage t, ty_link t) either option
type prop_generator = ty_any t list
type prop_icon = (ty_image t, ty_link t) either list
type prop_image = (ty_image t, ty_link t) either list
type prop_inReplyTo = ty_any t list
type prop_instrument = ty_any t list
type prop_last = (ty_collectionPage t, ty_link t) either option
type prop_location = ty_any t list
type prop_items = ty_any t list
type prop_oneOf = ty_any t list
type prop_anyOf = ty_any t list
type prop_closed = (ty_any t, dateTime, bool) either3 list
type prop_origin = ty_any t list
type prop_next = (ty_collectionPage t, ty_link t) either option
type prop_object = ty_any t list
type prop_prev = (ty_collectionPage t, ty_link t) either option
type prop_preview = ty_any t list
type prop_result = ty_any t list
type prop_replies = ty_collection option
type prop_tag = ty_any t list
type prop_target = ty_any t list
type prop_to = ty_any t list
type prop_url = (anyURI, ty_link t) either list
type prop_accuracy = float option
type prop_altitude = float option
type prop_content = string list
type prop_name = string list
type prop_duration = dateTime option
type prop_height = nonNegativeInteger option
type prop_href = anyURI option
type prop_hreflang = string option (* TODO: not equivalent to [BCP47] Language Tag *)
type prop_partOf = (ty_collection t, ty_link t) either option
type prop_latitude = float option
type prop_longitude = float option
type prop_mediaType = string option (* TODO: not equivalent to MIME Media Type *)
type prop_endTime = dateTime option
type prop_published = dateTime option
type prop_startTime = dateTime option
type prop_radius = float option
type prop_rel = string list list (* TODO: not equivalent to [RFC5988] or [HTML5] Link Relation *)
type prop_startIndex = nonNegativeInteger option
type prop_summary = string list
type prop_totalItems = nonNegativeInteger option
type prop_units = (units, anyURI) either option
type prop_updated = dateTime option
type prop_width = nonNegativeInteger option
type prop_subject = ty_any t option
type prop_relationship = ty_object t list
type prop_describes = ty_object t option
type prop_formerType = ty_object t list
type prop_deleted = dateTime option

type collectionPages = [
  | `CollectionPage of ty_collectionPage t
  | `OrderedCollectionPage of ty_orderedCollectionPage t
]

type collections = [
  | `Collection of ty_collection t
  | `OrderedCollection of ty_collection t
  | collectionPages
]

type intransitiveActivities = [
  | `IntransitiveActivity of ty_intransitiveActivity t
  | `Arrive of ty_intransitiveActivity t
  | `Travel of ty_intransitiveActivity t
  | `Question of ty_question t
]

type activities = [
  | `Activity of ty_activity t
  | intransitiveActivities
  | `Accept of ty_activity t
  | `TentativeAccept of ty_activity t
  | `Add of ty_activity t
  | `Create of ty_activity t
  | `Delete of ty_activity t
  | `Follow of ty_activity t
  | `Ignore of ty_activity t
  | `Join of ty_activity t
  | `Leave of ty_activity t
  | `Like of ty_activity t
  | `Offer of ty_activity t
  | `Invite of ty_activity t
  | `Reject of ty_activity t
  | `TentativeReject of ty_activity t
  | `Remove of ty_activity t
  | `Undo of ty_activity t
  | `Update of ty_activity t
  | `View of ty_activity t
  | `Listen of ty_activity t
  | `Read of ty_activity t
  | `Move of ty_activity t
  | `Announce of ty_activity t
  | `Block of ty_activity t
  | `Flag of ty_activity t
  | `Dislike of ty_activity t
]

type objects = [
  (* Core Types *)
  | `Object of ty_object t
  | activities
  | collections
  (* Actor Types *)
  | `Application of ty_object t
  | `Group of ty_object t
  | `Organization of ty_object t
  | `Person of ty_object t
  | `Service of ty_object t
  (* Object Types *)
  | `Relationship of ty_relationship t
  | `Article of ty_object t
  | `Document of ty_object t
  | `Audio of ty_object t
  | `Image of ty_object t
  | `Video of ty_object t
  | `Note of ty_object t
  | `Page of ty_object t
  | `Event of ty_object t
  | `Place of ty_place t
  | `Profile of ty_profile t
  | `Tombstone of ty_tombstone t
]

type links = [
  (* Core Types *)
  | `Link of ty_link t
  (* Link Types *)
  | `Mention of ty_link t
]

module Unknown : sig
  type unknown
  type map = (string * unknown) list

  val get_fields : [> ty_any] t -> (string * unknown) list
end

module Any : sig
  val id : [> ty_any] t -> prop_id
  val type_ : [> ty_any] t -> [> objects | links | `Unknown of anyURI]
  val mediaType : [> ty_any] t -> prop_mediaType
  val name : [> ty_any] t -> prop_name
  val preview : [> ty_any] t -> prop_preview
end

module Object : sig
  include module type of Any

  val type_ : [> ty_object] t -> [> objects | `Unknown of anyURI]

  val attachment : [> ty_object] t -> prop_attachment
  val attributedTo : [> ty_object] t -> prop_attributedTo
  val audience : [> ty_object] t -> prop_audience
  val content : [> ty_object] t -> prop_content
  val context : [> ty_object] t -> prop_context
  val endTime : [> ty_object] t -> prop_endTime
  val generator : [> ty_object] t -> prop_generator
  val icon : [> ty_object] t -> prop_icon
  val image : [> ty_object] t -> prop_image
  val inReplyTo : [> ty_object] t -> prop_inReplyTo
  val location : [> ty_object] t -> prop_location
  val published : [> ty_object] t -> prop_published
  val replies : [> ty_object] t -> prop_replies
  val startTime : [> ty_object] t -> prop_startTime
  val summary : [> ty_object] t -> prop_summary
  val tag : [> ty_object] t -> prop_tag
  val updated : [> ty_object] t -> prop_updated
  val url : [> ty_object] t -> prop_url
  val to_ : [> ty_object] t -> prop_to
  val bto : [> ty_object] t -> prop_bto
  val cc : [> ty_object] t -> prop_cc
  val bcc : [> ty_object] t -> prop_bcc
  val duration : [> ty_object] t -> prop_duration
end

module Link : sig
  include module type of Any

  val type_ : [> ty_link] t -> [> links | `Unknown of anyURI]

  val href : [> ty_link] t -> prop_href
  val rel : [> ty_link] t -> prop_rel
  val hreflang : [> ty_link] t -> prop_hreflang
  val height : [> ty_link] t -> prop_height
  val width : [> ty_link] t -> prop_width
end

module Activity : sig
  include module type of Object

  val type_ : [> ty_activity] t -> [> activities | `Unknown of anyURI]

  val actor : [> ty_activity] t -> prop_actor
  val object_ : [> ty_activity] t -> prop_object
  val target : [> ty_activity] t -> prop_target
  val result : [> ty_activity] t -> prop_result
  val origin : [> ty_activity] t -> prop_origin
  val instrument : [> ty_activity] t -> prop_instrument
end

module IntransitiveActivity : sig
  include module type of Object

  val type_ : [> ty_link] t -> [> intransitiveActivities | `Unknown of anyURI]

  val actor : [> ty_intransitiveActivity] -> prop_actor
  val target : [> ty_intransitiveActivity] -> prop_target
  val result : [> ty_intransitiveActivity] -> prop_result
  val origin : [> ty_intransitiveActivity] -> prop_origin
  val instrument : [> ty_intransitiveActivity] -> prop_instrument
end

module Collection : sig
  include module type of Object

  val type_ : [> ty_link] t -> [> collections | `Unknown of anyURI]

  val totalItems : [> ty_collection] -> prop_totalItems
  val current : [> ty_collection] -> prop_current
  val first : [> ty_collection] -> prop_first
  val last : [> ty_collection] -> prop_last
  val items : [> ty_collection] -> prop_items
end

module CollectionPage : sig
  include module type of Collection

  val type_ : [> ty_link] t -> [> collectionPages | `Unknown of anyURI]

  val partOf : [> ty_collectionPage] -> prop_partOf
  val next : [> ty_collectionPage] -> prop_next
  val prev : [> ty_collectionPage] -> prop_prev
end

module OrderedCollectionPage : sig
  include module type of CollectionPage

  val startIndex : [> ty_orderedCollectionPage] -> prop_startIndex
end

module Question : sig
  include module type of IntransitiveActivity

  val oneOf : [> ty_question] -> prop_oneOf
  val anyOf : [> ty_question] -> prop_anyOf
  val closed : [> ty_question] -> prop_closed
end

module Relationship : sig
  include module type of Object

  val subject : [> ty_relationship] -> prop_subject
  val object_ : [> ty_relationship] -> prop_object
  val relationship : [> ty_relationship] -> prop_relationship
end

module Place : sig
  include module type of Object

  val accuracy : [> ty_place] -> prop_accuracy
  val altitude : [> ty_place] -> prop_altitude
  val latitude : [> ty_place] -> prop_latitude
  val longitude : [> ty_place] -> prop_longitude
  val radius : [> ty_place] -> prop_radius
  val units : [> ty_place] -> prop_units
end

module Profile : sig
  include module type of Object

  val describes : [> ty_profile] -> prop_describes
end

module Tombstone : sig
  include module type of Object

  val formerType : [> ty_tombstone] -> prop_formerType
  val deleted : [> ty_tombstone] -> prop_deleted
end
