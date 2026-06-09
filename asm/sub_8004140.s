	.syntax unified
	.section .text.sub_8004140, "ax", %progbits
@ sub_8004140 @ JP 0x08004140 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8004140
	.thumb_func
sub_8004140:
	ldr r1, _0800414C @ =0x08577EF0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0800414C: .4byte 0x08577EF0

