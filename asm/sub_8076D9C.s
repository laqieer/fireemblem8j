	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8076D9C, "ax", %progbits
@ sub_8076D9C @ JP 0x08076D9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076D9C
	.thumb_func
sub_8076D9C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08076DD4 @ =0x087A9A28
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08076DD8 @ =0x080E6A44
	str r1, [r0, #0x48]
	ldr r1, _08076DDC @ =0x087A9A40
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08076DE0 @ =0x085EFBC4
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _08076DE4 @ =0x085F0284
	movs r1, #0x20
	bl sub_80567E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076DD4: .4byte 0x087A9A28
_08076DD8: .4byte 0x080E6A44
_08076DDC: .4byte 0x087A9A40
_08076DE0: .4byte 0x085EFBC4
_08076DE4: .4byte 0x085F0284

