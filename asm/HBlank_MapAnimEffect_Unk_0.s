	.syntax unified
	.section .text.HBlank_MapAnimEffect_Unk_0, "ax", %progbits
@ HBlank_MapAnimEffect_Unk_0 @ JP 0x080842E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_MapAnimEffect_Unk_0
	.thumb_func
HBlank_MapAnimEffect_Unk_0:
	push {lr}
	ldr r0, _08084300 @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _0808430C
	ldr r0, _08084304 @ =0x0203E758
	ldr r1, _08084308 @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08084314
	.align 2, 0
_08084300: .4byte 0x04000006
_08084304: .4byte 0x0203E758
_08084308: .4byte 0x0203E750
_0808430C:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08084330 @ =0x0203E758
_08084314:
	ldr r2, _08084334 @ =0x04000040
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r1, _08084338 @ =0x04000018
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08084330: .4byte 0x0203E758
_08084334: .4byte 0x04000040
_08084338: .4byte 0x04000018

