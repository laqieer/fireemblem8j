	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.section .text.sub_806ED0C, "ax", %progbits
@ sub_806ED0C @ JP 0x0806ED0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806ED0C
	.thumb_func
sub_806ED0C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8056120
	ldr r0, _0806ED28 @ =0x0860346C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED28: .4byte 0x0860346C

