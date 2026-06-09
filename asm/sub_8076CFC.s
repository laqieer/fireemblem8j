	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8076CFC, "ax", %progbits
@ sub_8076CFC @ JP 0x08076CFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076CFC
	.thumb_func
sub_8076CFC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08076D30 @ =0x087A99B8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08076D34 @ =0x080E6A0A
	str r1, [r0, #0x48]
	ldr r1, _08076D38 @ =0x087A99D0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08076D3C @ =0x087A99FC
	str r1, [r0, #0x54]
	ldr r0, _08076D40 @ =0x085EEADC
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076D30: .4byte 0x087A99B8
_08076D34: .4byte 0x080E6A0A
_08076D38: .4byte 0x087A99D0
_08076D3C: .4byte 0x087A99FC
_08076D40: .4byte 0x085EEADC

