	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013D40, 0x08013D40 + 1
	.section .text.sub_8014120, "ax", %progbits
@ sub_8014120 @ JP 0x08014120 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014120
	.thumb_func
sub_8014120:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8013D40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08014134
	adds r0, r4, #0
	bl sub_8002DE4
_08014134:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

