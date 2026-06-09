	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.section .text.sub_805E69C, "ax", %progbits
@ sub_805E69C @ JP 0x0805E69C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E69C
	.thumb_func
sub_805E69C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E6D8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E6DC @ =0x085FF640
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805E6E0 @ =0x080E1BEC
	str r1, [r0, #0x48]
	ldr r1, _0805E6E4 @ =0x085FF658
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805E6E8 @ =0x086126BC
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E6D8: .4byte 0x0201774C
_0805E6DC: .4byte 0x085FF640
_0805E6E0: .4byte 0x080E1BEC
_0805E6E4: .4byte 0x085FF658
_0805E6E8: .4byte 0x086126BC

