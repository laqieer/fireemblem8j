#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

/* prototypes for same-file helpers called by this run */
void MapAnim_DrawBarSegment(u16* buf1, int* buf2, int arg2, int arg3, int arg4);

void MapAnim_DrawBar(u16* tilemap, int arg1, int arg2, int arg3, u16* buf)
{
    int unk4, count = 0;
    u16* it;

    for (it = buf; it[0]; it += 2)
        count -= 1 - it[0];

    count += 1;

    if (arg1 == arg2)
        unk4 = count;
    else
        unk4 = ((count<<8) / arg1 * arg2) >> 8;

    if (unk4 == 0 && arg2 > 0)
        unk4 = 1;

    for (it = buf; it[0]; ++tilemap, it += 2)
        MapAnim_DrawBarSegment(tilemap, &unk4, gMapanimInfobox_1[arg3], it[0], it[1]);
}
