	.syntax unified
	.section .text.BG_SetPosition, "ax", %progbits
@ BG_SetPosition @ JP 0x08001448 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BG_SetPosition
	.thumb_func
BG_SetPosition:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #1
	beq _0800147C
	cmp r0, #1
	bgt _08001466
	cmp r0, #0
	beq _08001470
	b _0800149A
_08001466:
	cmp r3, #2
	beq _08001488
	cmp r3, #3
	beq _08001494
	b _0800149A
_08001470:
	ldr r0, _08001478 @ =0x03003020
	strh r1, [r0, #0x1c]
	strh r2, [r0, #0x1e]
	b _0800149A
	.align 2, 0
_08001478: .4byte 0x03003020
_0800147C:
	ldr r0, _08001484 @ =0x03003020
	strh r1, [r0, #0x20]
	strh r2, [r0, #0x22]
	b _0800149A
	.align 2, 0
_08001484: .4byte 0x03003020
_08001488:
	ldr r0, _08001490 @ =0x03003020
	strh r1, [r0, #0x24]
	strh r2, [r0, #0x26]
	b _0800149A
	.align 2, 0
_08001490: .4byte 0x03003020
_08001494:
	ldr r0, _080014A0 @ =0x03003020
	strh r1, [r0, #0x28]
	strh r2, [r0, #0x2a]
_0800149A:
	pop {r0}
	bx r0
	.align 2, 0
_080014A0: .4byte 0x03003020

