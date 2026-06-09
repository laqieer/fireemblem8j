	.syntax unified
	.set EfxFarAttack_SetAnimXPositions, 0x08054198 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8054304, 0x08054304 + 1
	.set sub_80720DC, 0x080720DC + 1
	.section .text.sub_80541D0, "ax", %progbits
@ sub_80541D0 @ JP 0x080541D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80541D0
	.thumb_func
sub_80541D0:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	bl EfxFarAttack_SetAnimXPositions
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl sub_80720DC
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	bl sub_8054304
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

