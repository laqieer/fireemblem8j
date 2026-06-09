	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8079ED0, "ax", %progbits
@ sub_8079ED0 @ JP 0x08079ED0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079ED0
	.thumb_func
sub_8079ED0:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08079F08 @ =0x08848AF8
	movs r1, #0
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	ldr r2, _08079F0C @ =0x03003020
	adds r4, r2, #0
	adds r4, #0x3c
	ldrb r3, [r4]
	subs r1, #0x21
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r4]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079F08: .4byte 0x08848AF8
_08079F0C: .4byte 0x03003020

