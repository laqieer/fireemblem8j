	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8075E70, "ax", %progbits
@ sub_8075E70 @ JP 0x08075E70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8075E70
	.thumb_func
sub_8075E70:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08075EA0 @ =0x020200B4
	ldr r0, _08075EA4 @ =0x087A9860
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r6, [r5]
	str r4, [r6, #0x5c]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x60]
	ldr r0, _08075EA8 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	beq _08075EAC
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #0
	b _08075EB2
	.align 2, 0
_08075EA0: .4byte 0x020200B4
_08075EA4: .4byte 0x087A9860
_08075EA8: .4byte 0x0203E11C
_08075EAC:
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #1
_08075EB2:
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	strh r1, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x29
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

