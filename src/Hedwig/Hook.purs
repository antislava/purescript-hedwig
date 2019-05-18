module Hedwig.Hook
 ( atInit
 , atInsert
 , atDestroy
 -- , atCreate
 -- , atPrepatch
 -- , atUpdate
 -- , atPostPatch
 , module Virtual
 ) where

import Hedwig.Foreign (hook1, VNodeFn1, Trait)
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

-- TODO: create; a DOM element has been created based on a vnode; emptyVnode, vnode
-- TODO: prepatch; an element is about to be patched; oldVnode, vnode
-- TODO: update; an element is being updated; oldVnode, vnode
-- TODO: postpatch; an element has been patched; oldVnode, vnode
-- TODO: remove; an element is directly being removed from the DOM; vnode, removeCallback
