	.syntax unified
	.section .text.HBlank_MapAnimBldY, "ax", %progbits
@ HBlank_MapAnimBldY @ JP 0x080843D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_MapAnimBldY
	.thumb_func
HBlank_MapAnimBldY:
	push {lr}
	ldr r0, _080843EC @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _080843F8
	ldr r0, _080843F0 @ =0x0203E758
	ldr r1, _080843F4 @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08084400
	.align 2, 0
_080843EC: .4byte 0x04000006
_080843F0: .4byte 0x0203E758
_080843F4: .4byte 0x0203E750
_080843F8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08084410 @ =0x0203E758
_08084400:
	ldr r2, _08084414 @ =0x04000054
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08084410: .4byte 0x0203E758
_08084414: .4byte 0x04000054

