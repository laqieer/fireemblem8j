	.syntax unified
	.set EfxFarAttack_SetAnimXPositions, 0x08054198 + 1
	.set EkrArenaBgScroll, 0x0805BDD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8054304, 0x08054304 + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.set sub_80720DC, 0x080720DC + 1
	.section .text.sub_8054270, "ax", %progbits
@ sub_8054270 @ JP 0x08054270 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8054270
	.thumb_func
sub_8054270:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r5, #0x38
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x30
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl sub_8012E84
	adds r1, r0, #0
	ldr r5, _080542D8 @ =0x0201FB0C
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
	beq _080542B6
	ldr r0, [r5]
	bl EkrArenaBgScroll
_080542B6:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080542F2
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _080542E0
	ldr r1, _080542DC @ =0x02017744
	movs r0, #1
	b _080542E4
	.align 2, 0
_080542D8: .4byte 0x0201FB0C
_080542DC: .4byte 0x02017744
_080542E0:
	ldr r1, _080542FC @ =0x02017744
	movs r0, #0
_080542E4:
	str r0, [r1]
	ldr r1, _08054300 @ =0x02017748
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_080542F2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080542FC: .4byte 0x02017744
_08054300: .4byte 0x02017748

