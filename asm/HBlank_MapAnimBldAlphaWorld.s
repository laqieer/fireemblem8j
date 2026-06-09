	.syntax unified
	.section .text.HBlank_MapAnimBldAlphaWorld, "ax", %progbits
@ HBlank_MapAnimBldAlphaWorld @ JP 0x08084BE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HBlank_MapAnimBldAlphaWorld
	.thumb_func
HBlank_MapAnimBldAlphaWorld:
	push {lr}
	ldr r0, _08084C00 @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9e
	bls _08084C0C
	ldr r0, _08084C04 @ =0x0203E758
	ldr r1, _08084C08 @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08084C14
	.align 2, 0
_08084C00: .4byte 0x04000006
_08084C04: .4byte 0x0203E758
_08084C08: .4byte 0x0203E750
_08084C0C:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08084C24 @ =0x0203E758
_08084C14:
	ldr r2, _08084C28 @ =0x04000052
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08084C24: .4byte 0x0203E758
_08084C28: .4byte 0x04000052

