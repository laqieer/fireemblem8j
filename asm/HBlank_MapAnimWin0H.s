	.syntax unified
	.section .text.HBlank_MapAnimWin0H, "ax", %progbits
@ HBlank_MapAnimWin0H @ JP 0x080842A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_MapAnimWin0H
	.thumb_func
HBlank_MapAnimWin0H:
	push {lr}
	ldr r0, _080842BC @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _080842C8
	ldr r0, _080842C0 @ =0x0203E758
	ldr r1, _080842C4 @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _080842D0
	.align 2, 0
_080842BC: .4byte 0x04000006
_080842C0: .4byte 0x0203E758
_080842C4: .4byte 0x0203E750
_080842C8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080842E0 @ =0x0203E758
_080842D0:
	ldr r2, _080842E4 @ =0x04000040
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080842E0: .4byte 0x0203E758
_080842E4: .4byte 0x04000040

