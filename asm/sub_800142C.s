	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_800142C, "ax", %progbits
@ sub_800142C @ JP 0x0800142C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800142C
	.thumb_func
sub_800142C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08001444 @ =0x085775D0
	movs r1, #1
	bl sub_8002BCC
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001444: .4byte 0x085775D0

