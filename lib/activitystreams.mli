type ('a, 'b) either = Left of 'a | Right of 'b
type ('a, 'b, 'c, 'd) either4 = Case1 of 'a | Case2 of 'b | Case3 of 'c | Case4 of 'd
type anyURI = Uri.t
type dateTime = {d_year : int; d_month : int; d_day : int; d_hours : int; d_minutes : int; d_seconds : int}
type nonNegativeInteger = int (* TODO: not equivalent to xsd:nonNegativeInteger *)
type units = Cm | Feet | Inches | Km | Meter | Miles

type ap_unknown
type ext_map = (string * ap_unknown) list

(* TODO: Replace type indirections with polymorphic variants once the OCaml type-system has been fixed *)

type t =
  | Ap_objects of ty_object
  | Ap_links of ty_link
  | Ap_unknown of ap_unknown

and ty_object =
  (* Core Types *)
  | Object of ap_object
  | Activity of ap_activity
  | IntransitiveActivity of ap_intransitiveActivity
  | Ap_collections of ty_collection
  (* Activity Types *)
  | Accept of ap_activity
  | TentativeAccept of ap_activity
  | Add of ap_activity
  | Arrive of ap_intransitiveActivity
  | Create of ap_activity
  | Delete of ap_activity
  | Follow of ap_activity
  | Ignore of ap_activity
  | Join of ap_activity
  | Leave of ap_activity
  | Like of ap_activity
  | Offer of ap_activity
  | Invite of ap_activity
  | Reject of ap_activity
  | TentativeReject of ap_activity
  | Remove of ap_activity
  | Undo of ap_activity
  | Update of ap_activity
  | View of ap_activity
  | Listen of ap_activity
  | Read of ap_activity
  | Move of ap_activity
  | Travel of ap_intransitiveActivity
  | Announce of ap_activity
  | Block of ap_activity
  | Flag of ap_activity
  | Dislike of ap_activity
  | Question of ap_question
  (* Actor Types *)
  | Application of ap_object
  | Group of ap_object
  | Organization of ap_object
  | Person of ap_object
  | Service of ap_object
  (* Object Types *)
  | Relationship of ap_relationship
  | Article of ap_object
  | Document of ap_object
  | Audio of ap_object
  | Image of ap_object
  | Video of ap_object
  | Note of ap_object
  | Page of ap_object
  | Event of ap_object
  | Place of ap_place
  | Profile of ap_profile
  | Tombstone of ap_tombstone
  | Ap_unknown_object of ap_unknown

and ty_link =
  (* Core Types *)
  | Link of ap_link
  (* Link Types *)
  | Mention of ap_link
  | Ap_unknown_link of ap_unknown

and ty_collection =
  | Collection of ap_collection
  | OrderedCollection of ap_collection
  | Ap_collectionPage of ty_collectionPage
  | Ap_unknown_collection of ap_unknown

and ty_collectionPage =
  | CollectionPage of ap_collectionPage
  | OrderedCollectionPage of ap_orderedCollectionPage
  | Ap_unknown_collectionPage of ap_unknown

and ap_object = {
  id : prop_id; (* Not defined ??! *)
  type_ : prop_type; (* Not defined ??! *)
  attachment : prop_attachment;
  attributedTo : prop_attributedTo;
  audience : prop_audience;
  content : prop_content;
  context : prop_context;
  name : prop_name;
  endTime : prop_endTime;
  generator : prop_generator;
  icon : prop_icon;
  image : prop_image;
  inReplyTo : prop_inReplyTo;
  location : prop_location;
  preview : prop_preview;
  published : prop_published;
  replies : prop_replies;
  startTime : prop_startTime;
  summary : prop_summary;
  tag : prop_tag;
  updated : prop_updated;
  url : prop_url;
  to_ : prop_to;
  bto : prop_bto;
  cc : prop_cc;
  bcc : prop_bcc;
  mediaType : prop_mediaType;
  duration : prop_duration;
  ap_unknown_props : (string * ap_unknown) list
}

and ap_link = {
  id : prop_id; (* Not defined ??! *)
  type_ : prop_type; (* Not defined ??! *)
  href : prop_href;
  rel : prop_rel;
  mediaType : prop_mediaType;
  name : prop_name;
  hreflang : prop_hreflang;
  height : prop_height;
  width : prop_width;
  preview : prop_preview;
  ap_unknown_props : (string * ap_unknown) list
}

and ap_activity = {
  ap_object : ap_object;
  actor : prop_actor;
  object_ : prop_object;
  target : prop_target;
  result : prop_result;
  origin : prop_origin;
  instrument : prop_instrument;
}

and ap_intransitiveActivity = {
  ap_object : ap_object;
  actor : prop_actor;
  target : prop_target;
  result : prop_result;
  origin : prop_origin;
  instrument : prop_instrument;
}

and ap_collection = {
  ap_object : ap_object;
  totalItems : prop_totalItems;
  current : prop_current;
  first : prop_first;
  last : prop_last;
  items : prop_items;
}

and ap_collectionPage = {
  ap_collection : ap_collection;
  partOf : prop_partOf;
  next : prop_next;
  prev : prop_prev;
}

and ap_orderedCollectionPage = {
  ap_collection : ap_collection;
  ap_collectionPage : ap_collectionPage;
  startIndex : prop_startIndex;
}

and ap_question = {
  ap_intransitiveActivity : ap_intransitiveActivity;
  oneOf : prop_oneOf;
  anyOf : prop_anyOf;
  closed : prop_closed;
}

and ap_relationship = {
  ap_object : ap_object;
  subject : prop_subject;
  object_ : prop_object;
  relationship : prop_relationship;
}

and ap_place = {
  ap_object : ap_object;
  accuracy : prop_accuracy;
  altitude : prop_altitude;
  latitude : prop_latitude;
  longitude : prop_longitude;
  radius : prop_radius;
  units : prop_units;
}

and ap_profile = {
  ap_object : ap_object;
  describes : prop_describes;
}

and ap_tombstone = {
  ap_object : ap_object;
  formerType : prop_formerType;
  deleted : prop_deleted;
}

and prop_id = anyURI option
and prop_type = anyURI list
and prop_actor = (ty_object, ty_link) either list
and prop_attachment = (ty_object, ty_link) either list
and prop_attributedTo = (ty_object, ty_link) either list
and prop_audience = (ty_object, ty_link) either list
and prop_bcc = (ty_object, ty_link) either list
and prop_bto = (ty_object, ty_link) either list
and prop_cc = (ty_object, ty_link) either list
and prop_context = (ty_object, ty_link) either list
and prop_current = (ty_collectionPage, ty_link) either option
and prop_first = (ty_collectionPage, ty_link) either option
and prop_generator = (ty_object, ty_link) either list
and prop_icon = (ap_object, ty_link) either list
and prop_image = (ap_object, ty_link) either list
and prop_inReplyTo = (ty_object, ty_link) either list
and prop_instrument = (ty_object, ty_link) either list
and prop_last = (ty_collectionPage, ty_link) either option
and prop_location = (ty_object, ty_link) either list
and prop_items = (ty_object, ty_link) either list
and prop_oneOf = (ty_object, ty_link) either list
and prop_anyOf = (ty_object, ty_link) either list
and prop_closed = (ty_object, ty_link, dateTime, bool) either4 list
and prop_origin = (ty_object, ty_link) either list
and prop_next = (ty_collectionPage, ty_link) either option
and prop_object = (ty_object, ty_link) either list
and prop_prev = (ty_collectionPage, ty_link) either option
and prop_preview = (ty_object, ty_link) either list
and prop_result = (ty_object, ty_link) either list
and prop_replies = ty_collection option
and prop_tag = (ty_object, ty_link) either list
and prop_target = (ty_object, ty_link) either list
and prop_to = (ty_object, ty_link) either list
and prop_url = (anyURI, ty_link) either list
and prop_accuracy = float option
and prop_altitude = float option
and prop_content = string list
and prop_name = string list
and prop_duration = dateTime option
and prop_height = nonNegativeInteger option
and prop_href = anyURI option
and prop_hreflang = string option (* TODO: not equivalent to [BCP47] Language Tag *)
and prop_partOf = (ty_collection, ty_link) either option
and prop_latitude = float option
and prop_longitude = float option
and prop_mediaType = string option (* TODO: not equivalent to MIME Media Type *)
and prop_endTime = dateTime option
and prop_published = dateTime option
and prop_startTime = dateTime option
and prop_radius = float option
and prop_rel = string list list (* TODO: not equivalent to [RFC5988] or [HTML5] Link Relation *)
and prop_startIndex = nonNegativeInteger option
and prop_summary = string list
and prop_totalItems = nonNegativeInteger option
and prop_units = (units, anyURI) either option
and prop_updated = dateTime option
and prop_width = nonNegativeInteger option
and prop_subject = (ty_object, ty_link) either option
and prop_relationship = ty_object list
and prop_describes = ty_object option
and prop_formerType = ty_object list
and prop_deleted = dateTime option
