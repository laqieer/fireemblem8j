	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80629D8, "ax", %progbits
@ sub_80629D8 @ JP 0x080629D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80629D8
	.thumb_func
sub_80629D8:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080629EE
	adds r0, r1, #0
	bl sub_8002DE4
_080629EE:
	pop {r0}
	bx r0
	.align 2, 0

