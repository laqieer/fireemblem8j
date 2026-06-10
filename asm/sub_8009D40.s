	.syntax unified
	.set sub_80AEFFC, 0x080AEFFC + 1
	.section .text.sub_8009D40, "ax", %progbits
@ sub_8009D40 @ JP 0x08009D40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009D40
	.thumb_func
sub_8009D40:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08009D5C @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x38
	beq _08009D56
	adds r0, r1, #0
	bl sub_80AEFFC
_08009D56:
	pop {r0}
	bx r0
	.align 2, 0
_08009D5C: .4byte 0x0202BCEC

