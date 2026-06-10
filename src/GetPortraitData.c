#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "bm.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "constants/faces.h"
#include "face.h"

extern const struct FaceData portrait_data[];

//! FE8U = 0x08005514
const struct FaceData* GetPortraitData(int fid) {
    return portrait_data + fid - 1;
}
