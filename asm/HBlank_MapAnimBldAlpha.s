	.syntax unified
	.section .text.HBlank_MapAnimBldAlpha, "ax", %progbits
@ HBlank_MapAnimBldAlpha @ JP 0x08084390 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_MapAnimBldAlpha
	.thumb_func
HBlank_MapAnimBldAlpha:
	push {lr}
	ldr r0, _080843A8 @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _080843B4
	ldr r0, _080843AC @ =0x0203E758
	ldr r1, _080843B0 @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _080843BC
	.align 2, 0
_080843A8: .4byte 0x04000006
_080843AC: .4byte 0x0203E758
_080843B0: .4byte 0x0203E750
_080843B4:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080843CC @ =0x0203E758
_080843BC:
	ldr r2, _080843D0 @ =0x04000052
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080843CC: .4byte 0x0203E758
_080843D0: .4byte 0x04000052

