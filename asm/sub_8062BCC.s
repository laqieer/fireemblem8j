	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8062BCC, "ax", %progbits
@ sub_8062BCC @ JP 0x08062BCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062BCC
	.thumb_func
sub_8062BCC:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _08062BFC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062C00 @ =0x08600C44
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r5, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne _08062C04
	movs r0, #0x2b
	strh r0, [r1, #0x2e]
	movs r0, #0x44
	b _08062C0A
	.align 2, 0
_08062BFC: .4byte 0x0201774C
_08062C00: .4byte 0x08600C44
_08062C04:
	movs r0, #0x1f
	strh r0, [r1, #0x2e]
	movs r0, #0x3d
_08062C0A:
	strh r0, [r1, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

