	.syntax unified
	.section .text.HBlank_ScrollBG2WithBaseOffset, "ax", %progbits
@ HBlank_ScrollBG2WithBaseOffset @ JP 0x08084EBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_ScrollBG2WithBaseOffset
	.thumb_func
HBlank_ScrollBG2WithBaseOffset:
	push {r4, lr}
	ldr r0, _08084ED4 @ =0x04000006
	ldrh r0, [r0]
	adds r2, r0, #0
	cmp r2, #0x9f
	bls _08084EE0
	ldr r0, _08084ED8 @ =0x0203E758
	ldr r1, _08084EDC @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r2, #0
	b _08084EE6
	.align 2, 0
_08084ED4: .4byte 0x04000006
_08084ED8: .4byte 0x0203E758
_08084EDC: .4byte 0x0203E750
_08084EE0:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08084EE6:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08084F12
	ldr r3, _08084F18 @ =0x04000018
	ldr r0, _08084F1C @ =0x0203E758
	ldr r0, [r0]
	lsls r2, r2, #1
	adds r2, r2, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r4, _08084F20 @ =0x03003020
	ldrh r0, [r0]
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r3]
	adds r3, #2
	ldrh r0, [r2]
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r3]
_08084F12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084F18: .4byte 0x04000018
_08084F1C: .4byte 0x0203E758
_08084F20: .4byte 0x03003020

