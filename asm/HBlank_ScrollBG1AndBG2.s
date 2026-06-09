	.syntax unified
	.section .text.HBlank_ScrollBG1AndBG2, "ax", %progbits
@ HBlank_ScrollBG1AndBG2 @ JP 0x08084F24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_ScrollBG1AndBG2
	.thumb_func
HBlank_ScrollBG1AndBG2:
	push {lr}
	ldr r0, _08084F3C @ =0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08084F48
	ldr r0, _08084F40 @ =0x0203E758
	ldr r1, _08084F44 @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08084F4E
	.align 2, 0
_08084F3C: .4byte 0x04000006
_08084F40: .4byte 0x0203E758
_08084F44: .4byte 0x0203E750
_08084F48:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08084F4E:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08084F7C
	ldr r2, _08084F80 @ =0x04000014
	ldr r0, _08084F84 @ =0x0203E758
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r1, r0
	ldrh r0, [r3]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08084F7C:
	pop {r0}
	bx r0
	.align 2, 0
_08084F80: .4byte 0x04000014
_08084F84: .4byte 0x0203E758

