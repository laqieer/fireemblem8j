#include "global.h"

extern u8 data_08BB8A74[];
int * __errno(void) {
    return *(int **)data_08BB8A74;
}
