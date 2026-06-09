	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8070440, "ax", %progbits
@ sub_8070440 @ JP 0x08070440 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070440
	.thumb_func
sub_8070440:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08070464 @ =0x08603930
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08070468 @ =0x080E4864
	str r1, [r0, #0x48]
	ldr r1, _0807046C @ =0x0877ABF4
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070464: .4byte 0x08603930
_08070468: .4byte 0x080E4864
_0807046C: .4byte 0x0877ABF4

