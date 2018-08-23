module Hedwig (module Exports, (:>), sync) where

import Data.Tuple (Tuple(..))

import Hedwig.Application (Init, Update, View, Application, mount) as Exports

import Hedwig.Event (
  onClick,
  onDoubleClick,
  onMouseDown,
  onMouseUp,
  onMouseEnter,
  onMouseLeave,
  onMouseOver,
  onMouseOut,
  onInput,
  onCheck,
  onSubmit,
  onBlur,
  onFocus
) as Exports

import Hedwig.Foreign (
  Html,
  Trait,
  attribute,
  element,
  key,
  lazy,
  log,
  on,
  property,
  text,
  transition,
  transition',
  transitionGroup,
  transitionGroup'
) as Exports

import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)

--- DO NOT EDIT BELOW ---

import Hedwig.Element (
  a,
  abbr,
  address,
  article,
  aside,
  audio,
  b,
  bdi,
  bdo,
  blockquote,
  br,
  button,
  canvas,
  caption,
  cite,
  code,
  col,
  colgroup,
  datalist,
  dd,
  del,
  details,
  dfn,
  div,
  dl,
  dt,
  em,
  embed,
  fieldset,
  figcaption,
  figure,
  footer,
  form,
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  header,
  hr,
  i,
  iframe,
  img,
  input,
  ins,
  kbd,
  label,
  legend,
  li,
  main,
  map,
  mark,
  math,
  menu,
  menuitem,
  meter,
  nav,
  node,
  object,
  ol,
  optgroup,
  option,
  output,
  p,
  param,
  pre,
  progress,
  q,
  rp,
  rt,
  ruby,
  s,
  samp,
  section,
  select,
  small,
  source,
  span,
  strong,
  sub,
  summary,
  sup,
  table,
  tbody,
  td,
  textarea,
  tfoot,
  th,
  thead,
  time,
  tr,
  track,
  u,
  ul,
  var,
  video,
  wbr
) as Exports

import Hedwig.Property (
  accept,
  acceptCharset,
  accessKey,
  action,
  align,
  alt,
  autocomplete,
  autofocus,
  autoplay,
  checked,
  class',
  classList,
  cols,
  colspan,
  contentEditable,
  contextmenu,
  controls,
  coords,
  datetime,
  default,
  dir,
  disabled,
  download,
  downloadAs,
  draggable,
  dropzone,
  enctype,
  for,
  headers,
  height,
  hidden,
  href,
  hreflang,
  id,
  isMap,
  itemprop,
  kind,
  lang,
  list,
  loop,
  manifest,
  max,
  maxlength,
  media,
  method,
  min,
  minlength,
  multiple,
  name,
  noValidate,
  pattern,
  ping,
  placeholder,
  poster,
  preload,
  pubdate,
  readOnly,
  rel,
  required,
  reversed,
  rows,
  rowspan,
  sandbox,
  scope,
  selected,
  shape,
  size,
  spellcheck,
  src,
  srcdoc,
  srclang,
  start,
  step,
  style,
  styles,
  tabindex,
  target,
  title,
  type',
  useMap,
  value,
  width,
  wrap
) as Exports

infixr 6 Tuple as :>

sync :: forall a. Effect a -> Aff a
sync = liftEffect
