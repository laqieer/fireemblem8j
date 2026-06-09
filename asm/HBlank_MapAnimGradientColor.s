	.syntax unified
	.section .text.HBlank_MapAnimGradientColor, "ax", %progbits
@ HBlank_MapAnimGradientColor @ JP 0x0808433C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_MapAnimGradientColor
	.thumb_func
HBlank_MapAnimGradientColor:
	push {lr}
	ldr r0, _08084354 @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _08084360
	ldr r0, _08084358 @ =0x0203E758
	ldr r1, _0808435C @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08084368
	.align 2, 0
_08084354: .4byte 0x04000006
_08084358: .4byte 0x0203E758
_0808435C: .4byte 0x0203E750
_08084360:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08084384 @ =0x0203E758
_08084368:
	ldr r2, _08084388 @ =0x05000022
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r1, _0808438C @ =0x05000042
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08084384: .4byte 0x0203E758
_08084388: .4byte 0x05000022
_0808438C: .4byte 0x05000042

