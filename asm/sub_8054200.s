	.syntax unified
	.set EfxFarAttack_SetAnimXPositions, 0x08054198 + 1
	.set EkrArenaBgScroll, 0x0805BDD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8054304, 0x08054304 + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.set sub_80720DC, 0x080720DC + 1
	.section .text.sub_8054200, "ax", %progbits
@ sub_8054200 @ JP 0x08054200 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8054200
	.thumb_func
sub_8054200:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl sub_8012E84
	adds r1, r0, #0
	ldr r5, _0805426C @ =0x0201FB0C
	str r1, [r5]
	adds r0, r4, #0
	bl EfxFarAttack_SetAnimXPositions
	ldr r0, [r5]
	movs r1, #0
	bl sub_80720DC
	ldr r0, [r5]
	bl sub_8054304
	bl sub_805BDCC
	cmp r0, #0
	beq _08054246
	ldr r0, [r5]
	bl EkrArenaBgScroll
_08054246:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08054262
	movs r0, #1
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8002DE4
_08054262:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805426C: .4byte 0x0201FB0C

