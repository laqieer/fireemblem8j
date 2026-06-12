#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

//! FE8U = 0x0805AE14
void EndBanimTerrain(struct BanimUnkStructComm * buf)
{
    if (buf->unk0E == -1)
    {
        if (buf->proc14)
            Proc_End(buf->proc14);

        if (buf->proc18)
            Proc_End(buf->proc18);
    }
}
