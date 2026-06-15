#include "global.h"

extern u8 gChapterIdOrderedList[];

u8 Debug_GetChapterId(int menuItemNumber)
{
    return gChapterIdOrderedList[menuItemNumber];
}
