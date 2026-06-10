	.syntax unified
	.section .text.IsItemHammernable, "ax", %progbits
@ IsItemHammernable @ JP 0x08016E28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsItemHammernable
	.thumb_func
IsItemHammernable:
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08016E74
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016E70 @ =0x0885E068
	adds r1, r1, r0
	ldr r2, [r1, #8]
	movs r0, #5
	ands r0, r2
	cmp r0, #0
	beq _08016E74
	movs r0, #0xc1
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	bne _08016E74
	movs r3, #8
	ands r3, r2
	asrs r0, r4, #8
	cmp r3, #0
	beq _08016E5E
	movs r0, #0xff
_08016E5E:
	movs r2, #0xff
	cmp r3, #0
	bne _08016E66
	ldrb r2, [r1, #0x14]
_08016E66:
	cmp r0, r2
	beq _08016E74
	movs r0, #1
	b _08016E76
	.align 2, 0
_08016E70: .4byte 0x0885E068
_08016E74:
	movs r0, #0
_08016E76:
	pop {r4}
	pop {r1}
	bx r1

