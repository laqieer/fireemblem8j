	.syntax unified
	.section .text.HBlank_ScrollBG2, "ax", %progbits
@ HBlank_ScrollBG2 @ JP 0x08084E0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_ScrollBG2
	.thumb_func
HBlank_ScrollBG2:
	push {lr}
	ldr r0, _08084E24 @ =0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08084E30
	ldr r0, _08084E28 @ =0x0203E758
	ldr r1, _08084E2C @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08084E36
	.align 2, 0
_08084E24: .4byte 0x04000006
_08084E28: .4byte 0x0203E758
_08084E2C: .4byte 0x0203E750
_08084E30:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08084E36:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08084E58
	ldr r2, _08084E5C @ =0x04000018
	ldr r0, _08084E60 @ =0x0203E758
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08084E58:
	pop {r0}
	bx r0
	.align 2, 0
_08084E5C: .4byte 0x04000018
_08084E60: .4byte 0x0203E758

