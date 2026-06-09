	.syntax unified
	.section .text.sub_80A976C, "ax", %progbits
@ sub_80A976C @ JP 0x080A976C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A976C
	.thumb_func
sub_80A976C:
	ldr r0, _080A9774 @ =0x0203EDB0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A9774: .4byte 0x0203EDB0

