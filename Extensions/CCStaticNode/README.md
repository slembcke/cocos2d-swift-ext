CCTransformationNode
====================

Type of class  : Descendant of CCNode
Uses extension : Accelerate rendering of static content.

A node that caches the rendering commands for all of its children. Redrawing the node on subsequent frames doesn't need to visit the children, cull them, or transform their geometry. Instead it just re-runs the cached drawing commands.