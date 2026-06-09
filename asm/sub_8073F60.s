	.syntax unified
	.set m4aMPlayStop, 0x080D570C + 1
	.section .text.sub_8073F60, "ax", %progbits
@ sub_8073F60 @ JP 0x08073F60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8073F60
	.thumb_func
sub_8073F60:
	push {lr}
	ldr r0, _08073F6C @ =0x03006430
	bl m4aMPlayStop
	pop {r0}
	bx r0
	.align 2, 0
_08073F6C: .4byte 0x03006430

