	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8078EC4, "ax", %progbits
@ sub_8078EC4 @ JP 0x08078EC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078EC4
	.thumb_func
sub_8078EC4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078EEC @ =0x0884892C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	ldr r1, _08078EF0 @ =0x08848944
	str r1, [r0, #0x4c]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08078EEC: .4byte 0x0884892C
_08078EF0: .4byte 0x08848944

