	.syntax unified
	.section .text.sub_807B99C, "ax", %progbits
@ sub_807B99C @ JP 0x0807B99C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B99C
	.thumb_func
sub_807B99C:
	lsls r0, r0, #0x10
	ldr r1, _0807B9AC @ =0x08A13488
	lsrs r0, r0, #0xd
	adds r1, r1, r0
	subs r1, #4
	ldr r0, [r1]
	bx lr
	.align 2, 0
_0807B9AC: .4byte 0x08A13488

