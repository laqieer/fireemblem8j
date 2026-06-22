#include "global.h"

#include "proc.h"
#include "scene.h"
#include "m4a.h"
#include "variables.h"
#include "constants/songs.h"

int GetChapterDivinationFee(void);

//! JP 0x080A45AC - JP-restored FortuneSubMenu divination-fee handler
//! (US FortuneSubMenu_HandleOptionSwitch is dummied to Proc_Goto(proc, 4))
void sub_80A45AC(ProcPtr proc)
{
    int fee;

    if (GetTalkChoiceResult() == 1)
    {
        fee = GetChapterDivinationFee();

        if ((int)GetPartyGoldAmount() >= fee)
        {
            if (fee > 0)
            {
                AddPartyGoldAmount(-fee);

                if (!gPlaySt.config.disableSoundEffects)
                    m4aSongNumStart(SONG_SE_MONEY);
            }

            Proc_Goto(proc, 0);
        }
        else
        {
            Proc_Goto(proc, 2);
        }
    }
    else
    {
        Proc_Goto(proc, 1);
    }
}
