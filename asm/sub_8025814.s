	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.section .text.sub_8025814, "ax", %progbits
@ sub_8025814 @ JP 0x08025814 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025814
	.thumb_func
sub_8025814:
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _08025840 @ =0x0202E4D8
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08025844
	cmp r0, #0x1e
	bne _08025850
	adds r0, r2, #0
	adds r1, r3, #0
	movs r2, #0x1e
	movs r3, #0
	bl AddTarget
	b _08025850
	.align 2, 0
_08025840: .4byte 0x0202E4D8
_08025844:
	adds r0, r2, #0
	adds r1, r3, #0
	movs r2, #0x14
	movs r3, #0
	bl AddTarget
_08025850:
	pop {r0}
	bx r0

