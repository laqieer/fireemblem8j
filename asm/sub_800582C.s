	.syntax unified
	.set GetGenericChibiImg, 0x08005E70 + 1
	.set GetPortraitData, 0x0800541C + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8005EA0, 0x08005EA0 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_800582C, "ax", %progbits
@ sub_800582C @ JP 0x0800582C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800582C
	.thumb_func
sub_800582C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08005860 @ =0x00007EFF
	cmp r4, r0
	ble _08005868
	adds r0, r4, #0
	bl GetGenericChibiImg
	lsls r1, r5, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	ldr r2, _08005864 @ =0x0001FFFF
	ands r1, r2
	adds r1, r1, r3
	movs r2, #0x80
	lsls r2, r2, #2
	bl RegisterDataMove
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005EA0
	b _08005888
	.align 2, 0
_08005860: .4byte 0x00007EFF
_08005864: .4byte 0x0001FFFF
_08005868:
	adds r0, r4, #0
	bl GetPortraitData
	adds r4, r0, #0
	ldr r0, [r4, #4]
	lsls r1, r5, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_8013008
	ldr r0, [r4, #8]
	lsls r1, r6, #5
	movs r2, #0x20
	bl sub_8000D68
_08005888:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

