#include "global.h"
#include "bmguide.h"

extern struct GuideSt * gGuideSt;
void PutGuideCategoryName(int a, int b, int c);

void PutGuideCategoryList(void)
{
    int i;

    int a = (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC) ? gGuideSt->unk_3c : gGuideSt->unk_3d;

    for (i = 0; i < 6; i++)
    {
        if (i < a)
        {
            PutGuideCategoryName(i, i, (i * 2) + 5);
        }
    }

    return;
}
