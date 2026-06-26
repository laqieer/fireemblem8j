typedef unsigned char u8;
typedef unsigned short u16;
typedef signed char s8;
typedef signed short s16;
typedef unsigned int u32;

struct SplinePt
{
    /* 00 */ s16 x;
    /* 02 */ s16 y;
    /* 04 */ u16 z;
};

struct Pt2
{
    int x;
    int y;
};

extern int sub_80D6384(int a, int b);
extern int sub_800A34C(struct Pt2 *pts, int *out, u16 *times, u32 t, int count);

int sub_800A594(struct SplinePt *arr, int idx, u32 t, s16 *out, u8 flag)
{
    int j;
    int dz;
    int k;
    struct Pt2 pts[3];
    u16 times[4];
    int res[2];
    u16 *ptimes;
    int *ppy;
    int *pres;

    if (flag)
    {
        u32 i;
        t = sub_80D6384(arr[idx - 1].z << 0xc, t);
        i = t >> 0xc;

        j = 0;
        ptimes = times;
        ppy = &pts[0].y;
        pres = &res[0];

        if (j < idx - 2 && (i < arr[0].z || i >= arr[1].z))
        {
            do
            {
                j++;
                if (j >= idx - 2)
                    break;
            }
            while (i < arr[j].z || i >= arr[j + 1].z);
        }

        if (j == 0)
        {
            int cnt = idx - 1;
            struct SplinePt *p = arr;
            int *px = &pts[1].x;
            int *py = ppy + 2;
            u16 *tp = ptimes + 1;

            dz = arr[idx - 1].z - arr[idx - 2].z;
            pts[0].x = arr[idx - 2].x;
            pts[0].y = arr[idx - 2].y;
            ptimes[0] = j;

            for (k = 0; k <= 1; k++)
            {
                *px = p->x;
                *py = p->y;
                *tp = p->z + dz;
                if (k < cnt)
                    p++;
                px += 2;
                py += 2;
                tp++;
            }
            t += dz << 0xc;
        }
        else
        {
            struct SplinePt *p = &arr[j - 1];
            int *px = &pts[0].x;
            int *py = ppy;
            u16 *tp = ptimes;
            for (k = 0; k <= 2; k++)
            {
                *px = p->x;
                *py = p->y;
                *tp = p->z;
                p++;
                px += 2;
                py += 2;
                tp++;
            }
        }
    }
    else
    {
        u32 i;
        i = t >> 0xc;
        j = 0;
        ptimes = times;
        ppy = &pts[0].y;
        pres = &res[0];
        dz = idx - 1;

        if (j < dz && (i < arr[0].z || i >= arr[1].z))
        {
            do
            {
                j++;
                if (j >= dz)
                    break;
            }
            while (i < arr[j].z || i >= arr[j + 1].z);
        }

        if (j == 0)
        {
            struct SplinePt *p = arr;
            int *px = &pts[0].x;
            int *py = ppy;
            u16 *tp = ptimes;
            for (k = 0; k <= 2; k++)
            {
                *px = p->x;
                *py = p->y;
                *tp = p->z;
                if (k < dz)
                    p++;
                px += 2;
                py += 2;
                tp++;
            }
        }
        else
        {
            struct SplinePt *p = &arr[j - 1];
            int *px = &pts[0].x;
            int *py = ppy;
            u16 *tp = ptimes;
            int m = j - 1;
            for (k = 0; k <= 2; k++)
            {
                *px = p->x;
                *py = p->y;
                *tp = p->z;
                if (m < dz)
                {
                    p++;
                    m++;
                }
                px += 2;
                py += 2;
                tp++;
            }
        }
    }

    sub_800A34C(pts, pres, ptimes, t, 3);
    out[0] = res[0];
    out[1] = pres[1];
    return j;
}