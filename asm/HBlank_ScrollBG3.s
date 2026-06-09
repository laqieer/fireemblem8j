	.syntax unified
	.section .text.HBlank_ScrollBG3, "ax", %progbits
@ HBlank_ScrollBG3 @ JP 0x08084E64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_ScrollBG3
	.thumb_func
HBlank_ScrollBG3:
	push {lr}
	ldr r0, _08084E7C @ =0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08084E88
	ldr r0, _08084E80 @ =0x0203E758
	ldr r1, _08084E84 @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08084E8E
	.align 2, 0
_08084E7C: .4byte 0x04000006
_08084E80: .4byte 0x0203E758
_08084E84: .4byte 0x0203E750
_08084E88:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08084E8E:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08084EB0
	ldr r2, _08084EB4 @ =0x0400001C
	ldr r0, _08084EB8 @ =0x0203E758
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
_08084EB0:
	pop {r0}
	bx r0
	.align 2, 0
_08084EB4: .4byte 0x0400001C
_08084EB8: .4byte 0x0203E758

