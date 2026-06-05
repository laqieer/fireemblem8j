#include "global.h"
#include "variables.h"
#include "functions.h"

#include "proc.h"
#include "bmmap.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "bmfx.h"
#include "constants/songs.h"



/* Thanks to supper-man YohannDR! */
void EventEarthQuakeMain(struct ProcBmFx * proc)
{
    if (GetGameClock() & 1)
    {
        switch (proc->type) {
        case 0:
            switch (proc->position) {
            case POS_L:
                gBmSt.camera.x ^= 2;
                break;
            
            case POS_R:
                gBmSt.camera.y ^= 2;
                break;
            }
            RenderBmMap();
            break;

        case 1:
            switch (proc->position) {
            case POS_L:
                BG_SetPosition(3, GetGameClock() & 2, 0);
                break;
            
            case POS_R:
                BG_SetPosition(3, 0, GetGameClock() & 2);
                break;
            }
            break;
        }
    }
}
