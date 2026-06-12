#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmlib.h"
#include "worldmap.h"
#include "face.h"
#include "scene.h"
#include "savemenu.h"
#include "eventscript.h"
#include "event.h"

//! FE8U = 0x0800CD40
void EventFaceDeamonDelete(struct Proc8591C68 * proc)
{
    EndFaceById(proc->faceSlot);
    return;
}
