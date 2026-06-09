	.syntax unified
	.set RegisterFillTile, 0x08001FA4 + 1
	.section .text.sub_80011F0, "ax", %progbits
@ sub_80011F0 @ JP 0x080011F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80011F0
	.thumb_func
sub_80011F0:
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #5
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	movs r0, #0
	movs r2, #0x20
	bl RegisterFillTile
	pop {r0}
	bx r0

