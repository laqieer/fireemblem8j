#include "global.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "constants/songs.h"
#include "sio.h"
#include "sio_core.h"
#include "functions.h"

extern u8 data_080DEEE0[];
void DrawXMapReceiveProgress(struct SioBigReceiveProc * proc) {
    if (proc->unk_3C < proc->completionPercent) {
        PlaySoundEffect(SONG_7D);
        proc->unk_3C++;
        PutXMapProgressPercent(&gUnk_Sio_7[0], (const char *)data_080DEEE0, proc->unk_3C);
        DrawStatBarGfx(
            0x100, 0xe, TILEMAP_LOCATED(gBG0TilemapBuffer, 14, 15), 0x6000, 100, proc->unk_3C, 100 - proc->unk_3C);
        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }
}
