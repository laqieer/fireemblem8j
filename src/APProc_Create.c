#include "global.h"
#include "ap.h"

ProcPtr APProc_Create(const void* apDefinition, int xPos, int yPos, int tileBase, int anim, int aObjNode) {
    struct APHandle* handle;
    struct APProc* proc;

    // Setting up handle
    handle = AP_Create(apDefinition, aObjNode);
    AP_SwitchAnimation(handle, anim);
    handle->tileBase = tileBase;

    // Making Proc
    proc = Proc_Start(ProcScr_ApProc, PROC_TREE_3);

    // Setting up proc
    proc->pHandle = handle;
    proc->xPosition = xPos;
    proc->yPosition = yPos;

    return proc;
}
