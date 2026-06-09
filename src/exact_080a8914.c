#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bonusclaim.h"

// TODO: Should be in "bmsave.h", but doing so causes a non-match (implicit declaration?) in "bonusclaim.c"
bool LoadBonusContentData(void *buf);













/* prototypes for same-file helpers called by this run */
bool LoadAndVerifySoundRoomData(struct SoundRoomSaveData * buf);
void WriteSoundRoomSaveData(struct SoundRoomSaveData * buf);

bool IsSoundRoomSongUnlocked(struct SoundRoomSaveData * buf, int val)
{
    struct SoundRoomSaveData tmp;
    u32 _val = val;

    if (buf == NULL) {
        buf = &tmp;
        LoadAndVerifySoundRoomData(&tmp);
    }

    if ((buf->flags[val >> 5] >> (_val % 0x20)) & 1)
        return true;

    return false;
}

void UnlockSoundRoomSong(struct SoundRoomSaveData * buf, int val)
{
    struct SoundRoomSaveData tmp;
    u32 _val = val;
    
    if (buf == NULL) {
        buf = &tmp;
        if (!LoadAndVerifySoundRoomData(&tmp))
            return;
    }

    if (buf->flags[val >> 5] & (1 << (_val % 0x20)))
        return;

    buf->flags[val >> 5] |= 1 << (_val % 0x20);

    if (0x43 == val)
        buf->flags[0] |= 4;
    else if (2 == val)
        buf->flags[2] |= 8;

    if (0x54 == val)
        buf->flags[1] |= 1 << 0x10;
    else if (0x30 == val)
        buf->flags[2] |= 1 << 0x14;

    WriteSoundRoomSaveData(buf);
}
