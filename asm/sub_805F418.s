	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_805F418, "ax", %progbits
@ sub_805F418 @ JP 0x0805F418 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805F418
	.thumb_func
sub_805F418:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805F46C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F470 @ =0x085FF950
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805F474 @ =0x080E1F60
	str r0, [r5, #0x48]
	ldr r0, _0805F478 @ =0x085FF968
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805F47C @ =0x085FF994
	str r0, [r5, #0x54]
	ldr r0, _0805F480 @ =0x0863CDB4
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _0805F484 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F492
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805F488
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0805F492
	.align 2, 0
_0805F46C: .4byte 0x0201774C
_0805F470: .4byte 0x085FF950
_0805F474: .4byte 0x080E1F60
_0805F478: .4byte 0x085FF968
_0805F47C: .4byte 0x085FF994
_0805F480: .4byte 0x0863CDB4
_0805F484: .4byte 0x0203E11C
_0805F488:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0805F492:
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0

