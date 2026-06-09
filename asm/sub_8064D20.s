	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8064DFC, 0x08064DFC + 1
	.section .text.sub_8064D20, "ax", %progbits
@ sub_8064D20 @ JP 0x08064D20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064D20
	.thumb_func
sub_8064D20:
	push {lr}
	ldr r0, _08064D3C @ =0x08601298
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl sub_8064DFC
	pop {r0}
	bx r0
	.align 2, 0
_08064D3C: .4byte 0x08601298

