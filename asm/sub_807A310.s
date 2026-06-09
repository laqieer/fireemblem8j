	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807A310, "ax", %progbits
@ sub_807A310 @ JP 0x0807A310 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A310
	.thumb_func
sub_807A310:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807A324 @ =0x08855D98
	bl sub_8002BCC
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A324: .4byte 0x08855D98

