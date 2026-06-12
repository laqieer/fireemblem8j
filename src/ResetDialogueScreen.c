#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "face.h"
#include "functions.h"
#include "variables.h"
#include "bmlib.h"
#include "bg.h"
#include "scene.h"
#include "event.h"
#include "ekrbattle.h"

void ResetDialogueScreen(void) // function: MapLevelUp_EndFace
{
    ClearTalkBubble();
    Proc_EndEach(gProcScr_E_FACE);
    ResetFaces();
    ClearTalkFaceRefs();
}
