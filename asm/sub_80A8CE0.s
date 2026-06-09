	.syntax unified
	.section .text.sub_80A8CE0, "ax", %progbits
@ sub_80A8CE0 @ JP 0x080A8CE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8CE0
	.thumb_func
sub_80A8CE0:
	lsls r0, r0, #2
	ldr r1, _080A8CE8 @ =0x0203ECF0
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080A8CE8: .4byte 0x0203ECF0

