	.syntax unified
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_80C3618, "ax", %progbits
@ sub_80C3618 @ JP 0x080C3618 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3618
	.thumb_func
sub_80C3618:
	push {r4, r5, lr}
	ldr r1, _080C36B0 @ =0x08AC1E08
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #2
	ldrsb r4, [r0, r4]
	movs r5, #3
	ldrsb r5, [r0, r5]
	cmp r4, #0
	bge _080C3648
	cmp r5, #0
	bge _080C3648
	ldr r0, _080C36B4 @ =0x020234A8
	movs r1, #0xc
	movs r2, #9
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080C36B8 @ =0x02022CA8
	movs r1, #0xc
	movs r2, #9
	movs r3, #0
	bl j_TmFillRect
_080C3648:
	cmp r4, #0
	ble _080C3668
	cmp r5, #0
	bge _080C3668
	ldr r0, _080C36BC @ =0x020234CC
	movs r1, #0xc
	movs r2, #9
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080C36C0 @ =0x02022CCC
	movs r1, #0xc
	movs r2, #9
	movs r3, #0
	bl j_TmFillRect
_080C3668:
	cmp r4, #0
	bge _080C3688
	cmp r5, #0
	ble _080C3688
	ldr r0, _080C36C4 @ =0x020238A8
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080C36C8 @ =0x020230A8
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl j_TmFillRect
_080C3688:
	cmp r4, #0
	ble _080C36A8
	cmp r5, #0
	ble _080C36A8
	ldr r0, _080C36CC @ =0x020238CC
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080C36D0 @ =0x020230CC
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl j_TmFillRect
_080C36A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C36B0: .4byte 0x08AC1E08
_080C36B4: .4byte 0x020234A8
_080C36B8: .4byte 0x02022CA8
_080C36BC: .4byte 0x020234CC
_080C36C0: .4byte 0x02022CCC
_080C36C4: .4byte 0x020238A8
_080C36C8: .4byte 0x020230A8
_080C36CC: .4byte 0x020238CC
_080C36D0: .4byte 0x020230CC

