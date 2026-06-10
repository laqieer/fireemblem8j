	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8035BA4, "ax", %progbits
@ sub_8035BA4 @ JP 0x08035BA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035BA4
	.thumb_func
sub_8035BA4:
	push {r4, r5, r6, lr}
	bl sub_804F610
	ldr r0, _08035BF8 @ =0x08A75364
	ldr r1, _08035BFC @ =0x06005000
	bl sub_8013008
	ldr r0, _08035C00 @ =0x08A753EC
	movs r1, #0x60
	movs r2, #0x20
	bl sub_8000D68
	ldr r4, _08035C04 @ =0x02022CA8
	ldr r1, _08035C08 @ =0x08A7540C
	movs r2, #0xca
	lsls r2, r2, #6
	adds r0, r4, #0
	bl j_TmApplyTsa
	adds r6, r4, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r6, r0
	movs r4, #6
_08035BD4:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #4
	bl j_TmCopyRect
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _08035BD4
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035BF8: .4byte 0x08A75364
_08035BFC: .4byte 0x06005000
_08035C00: .4byte 0x08A753EC
_08035C04: .4byte 0x02022CA8
_08035C08: .4byte 0x08A7540C

