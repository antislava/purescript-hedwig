module Hedwig.Hook
 ( atInit
 , atInsert
 , atDestroy
 , atCreate
 , atPrepatch
 , atUpdate
 , atPostPatch
 , module Virtual
 ) where

import Hedwig.Foreign (hook1, hook2, VNodeFn1, VNodeFn2, Trait)
import Hedwig.Foreign (VirtualNode, VNodeFn1, VNodeFn2) as Virtual

-- | Attaches a hook for vnode init (a vnode has been added)
atInit :: forall msg. VNodeFn1 msg -> Trait msg
atInit = hook1 "init"

-- | Attaches a hook for vnode DOM insertion
atInsert :: forall msg. VNodeFn1 msg -> Trait msg
atInsert = hook1 "insert"

-- | Attaches a hook for vnode destruction
atDestroy :: forall msg. VNodeFn1 msg -> Trait msg
atDestroy = hook1 "destroy"

-- | Attaches a hook for vnode-based DOM element creation
atCreate :: forall msg. VNodeFn2 msg -> Trait msg
atCreate = hook2 "create"

-- | Attaches a hook for vnode element prepatch
atPrepatch :: forall msg. VNodeFn2 msg -> Trait msg
atPrepatch = hook2 "prepatch"

-- | Attaches a hook for vnode element update
atUpdate :: forall msg. VNodeFn2 msg -> Trait msg
atUpdate = hook2 "update"

-- | Attaches a hook for vnode element postpatch
atPostPatch :: forall msg. VNodeFn2 msg -> Trait msg
atPostPatch = hook2 "postpatch"

-- TODO: remove; an element is directly being removed from the DOM; vnode, removeCallback
