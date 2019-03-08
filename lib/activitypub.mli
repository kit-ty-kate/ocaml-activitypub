type t =
  (* Core Types *)
  | Object of ap_object
  | Link of ap_link
  | Activity of ap_activity
  | IntransitiveActivity of ap_intransitiveActivity
  | Collection of ap_collection
  | OrderedCollection of ap_collection
  | CollectionPage of ap_collectionPage
  | OrderedCollectionPage of ap_orderedCollectionPage
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
  (* Object and Link Types *)
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
  | Mention of ap_link
  | Profile of ap_profile
  | Tombstone of ap_tombstone

and ap_object = <
  attachment : prop_attachment option;
  attributedTo : prop_attributedTo option;
  audience : prop_audience option;
  content : prop_content option;
  context : prop_context option;
  name : prop_name option;
  endTime : prop_endTime option;
  generator : prop_generator option;
  icon : prop_icon option;
  image : prop_image option;
  inReplyTo : prop_inReplyTo option;
  location : prop_location option;
  preview : prop_preview option;
  published : prop_published option;
  replies : prop_replies option;
  startTime : prop_startTime option;
  summary : prop_summary option;
  tag : prop_tag option;
  updated : prop_updated option;
  url : prop_url option;
  to_ : prop_to option;
  bto : prop_bto option;
  cc : prop_cc option;
  bcc : prop_bcc option;
  mediaType : prop_mediaType option;
  duration : prop_duration option;
>

and ap_link = <
  href : prop_href option;
  rel : prop_rel option;
  mediaType : prop_mediaType option;
  name : prop_name option;
  hreflang : prop_hreflang option;
  height : prop_height option;
  width : prop_width option;
  preview : prop_preview option;
>

and ap_activity = <
  ap_object;
  actor : prop_actor option;
  object_ : prop_object option;
  target : prop_target option;
  result : prop_result option;
  origin : prop_origin option;
  instrument : prop_instrument option;
>

and ap_intransitiveActivity = <
  ap_object;
  actor : prop_actor option;
  target : prop_target option;
  result : prop_result option;
  origin : prop_origin option;
  instrument : prop_instrument option;
>

and ap_collection = <
  ap_object;
  totalItems : prop_totalItems option;
  current : prop_current option;
  first : prop_first option;
  last : prop_last option;
  items : prop_items option;
>

and ap_collectionPage = <
  ap_collection;
  partOf : prop_partOf option;
  next : prop_next option;
  prev : prop_prev option;
>

and ap_orderedCollectionPage = <
  ap_orderedCollection;
  ap_collectionPage;
  startIndex : prop_startIndex option;
>

and ap_question = <
  ap_intransitiveActivity;
  oneOf : prop_oneOf option;
  anyOf : prop_anyOf option;
  closed : prop_closed option;
>

and ap_relationship = <
  ap_object;
  subject : prop_subject option;
  object_ : prop_object option;
  relationship : prop_relationship option;
>

and ap_place = <
  ap_object;
  accuracy : prop_accuracy option;
  altitude : prop_altitude option;
  latitude : prop_latitude option;
  longitude : prop_longitude option;
  radius : prop_radius option;
  units : prop_units option;
>

and ap_profile = <
  ap_object;
  describes : prop_describes option;
>

and ap_tombstone = <
  ap_object;
  formerType : prop_formerType option;
  deleted : prop_deleted option;
>
