#include "global.h"
#include "bmsave.h"

bool Check3rdTraineeEnabled(void)
{
    struct GlobalSaveInfo info;
    u8 unlock = ReadGlobalSaveInfo(&info);
    if (!unlock) {
        InitGlobalSaveInfodata();
        ReadGlobalSaveInfo(&info);
    }

    /* 3rd trainee class can only get access after both Eirka and ephyram played through */
    if (info.Eirk_mode_easy || info.Eirk_mode_norm || info.Eirk_mode_hard)
        if (info.Ephy_mode_easy || info.Ephy_mode_norm || info.Ephy_mode_hard)
            return true;

    return false;
}
