	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_801FCD0, "ax", %progbits
@ sub_801FCD0 @ JP 0x0801FCD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FCD0
	.thumb_func
sub_801FCD0:
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x10
	movs r0, #1
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _0801FD04 @ =0x0400001C
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FD04: .4byte 0x0400001C

