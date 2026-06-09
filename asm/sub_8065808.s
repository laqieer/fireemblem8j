	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80658DC, 0x080658DC + 1
	.section .text.sub_8065808, "ax", %progbits
@ sub_8065808 @ JP 0x08065808 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065808
	.thumb_func
sub_8065808:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065828 @ =0x08601500
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	adds r1, r4, #0
	bl sub_80658DC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065828: .4byte 0x08601500

