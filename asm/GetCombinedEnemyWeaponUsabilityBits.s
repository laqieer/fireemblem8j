	.syntax unified
	.set sub_801883C, 0x0801883C + 1
	.section .text.GetCombinedEnemyWeaponUsabilityBits, "ax", %progbits
@ GetCombinedEnemyWeaponUsabilityBits @ JP 0x080188B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetCombinedEnemyWeaponUsabilityBits
	.thumb_func
GetCombinedEnemyWeaponUsabilityBits:
	push {r4, r5, r6, lr}
	movs r5, #0
	movs r4, #0x81
	ldr r6, _080188E8 @ =0x085C2A50
_080188BC:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _080188D8
	ldr r0, [r1]
	cmp r0, #0
	beq _080188D8
	adds r0, r1, #0
	bl sub_801883C
	orrs r5, r0
_080188D8:
	adds r4, #1
	cmp r4, #0xbf
	ble _080188BC
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080188E8: .4byte 0x085C2A50

