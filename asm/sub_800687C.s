	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8004320, 0x08004320 + 1
	.section .text.sub_800687C, "ax", %progbits
@ sub_800687C @ JP 0x0800687C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800687C
	.thumb_func
sub_800687C:
	push {lr}
	ldr r0, _0800688C @ =0x030000E8
	bl SetTextFont
	bl sub_8004320
	pop {r0}
	bx r0
	.align 2, 0
_0800688C: .4byte 0x030000E8

