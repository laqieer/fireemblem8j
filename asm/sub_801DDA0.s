	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8016750, 0x08016750 + 1
	.section .text.sub_801DDA0, "ax", %progbits
@ sub_801DDA0 @ JP 0x0801DDA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DDA0
	.thumb_func
sub_801DDA0:
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, _0801DDDC @ =0x0202BCAC
	ldrh r6, [r0, #0x2c]
	adds r5, r4, #0
	adds r5, #0x34
	adds r0, r5, #0
	movs r1, #2
	bl sub_8003D90
	movs r0, #0x2c
	ldrsh r2, [r4, r0]
	lsls r2, r2, #5
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _0801DDE0 @ =0x02022CA8
	adds r2, r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8016750
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801DDDC: .4byte 0x0202BCAC
_0801DDE0: .4byte 0x02022CA8

