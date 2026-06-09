	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_80BC0C0, "ax", %progbits
@ sub_80BC0C0 @ JP 0x080BC0C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BC0C0
	.thumb_func
sub_80BC0C0:
	push {lr}
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	cmp r0, #0
	bge _080BC0D8
	adds r0, #7
_080BC0D8:
	lsls r0, r0, #0xd
	lsrs r1, r0, #0x10
	adds r0, r2, #0
	cmp r0, #0
	bge _080BC0E4
	adds r0, #3
_080BC0E4:
	lsls r2, r0, #0xe
	lsrs r2, r2, #0x10
	movs r0, #2
	bl BG_SetPosition
	pop {r0}
	bx r0
	.align 2, 0

