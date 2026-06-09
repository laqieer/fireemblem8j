	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.section .text.sub_8062E28, "ax", %progbits
@ sub_8062E28 @ JP 0x08062E28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062E28
	.thumb_func
sub_8062E28:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08062E64 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062E68 @ =0x08600C7C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08062E6C @ =0x080E2AB2
	str r1, [r0, #0x48]
	ldr r1, _08062E70 @ =0x08600C94
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08062E74 @ =0x0869C1BC
	movs r1, #0x80
	lsls r1, r1, #3
	bl sub_80567B8
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062E64: .4byte 0x0201774C
_08062E68: .4byte 0x08600C7C
_08062E6C: .4byte 0x080E2AB2
_08062E70: .4byte 0x08600C94
_08062E74: .4byte 0x0869C1BC

