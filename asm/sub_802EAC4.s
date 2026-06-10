	.syntax unified
	.section .text.sub_802EAC4, "ax", %progbits
@ sub_802EAC4 @ JP 0x0802EAC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EAC4
	.thumb_func
sub_802EAC4:
	lsls r0, r0, #3
	ldr r1, _0802EACC @ =0x0203A610
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0802EACC: .4byte 0x0203A610

