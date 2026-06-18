	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.section .text.sub_806FEB4, "ax", %progbits
@ NewEfxMagdhisEffect @ JP 0x0806FEB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEfxMagdhisEffect
	.thumb_func
NewEfxMagdhisEffect:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8056120
	ldr r0, _0806FED0 @ =0x08603894
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FED0: .4byte 0x08603894

