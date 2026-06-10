	.syntax unified
	.set AiTryMoveToSpecificPosition, 0x0803F33C + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set sub_801A05C, 0x0801A05C + 1
	.set sub_803B2B8, 0x0803B2B8 + 1
	.set sub_803B560, 0x0803B560 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.section .text.sub_803F3C4, "ax", %progbits
@ sub_803F3C4 @ JP 0x0803F3C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F3C4
	.thumb_func
sub_803F3C4:
	push {r4, lr}
	sub sp, #8
	ldr r4, _0803F3F4 @ =0x03004DF0
	ldr r0, [r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803F3FC
	ldr r0, [r4]
	bl sub_803B560
	bl sub_803B2B8
	adds r1, r0, #0
	cmp r1, #0
	beq _0803F402
	ldr r0, _0803F3F8 @ =0x0203AA00
	adds r0, #0x86
	strb r1, [r0]
	movs r0, #0
	b _0803F42C
	.align 2, 0
_0803F3F4: .4byte 0x03004DF0
_0803F3F8: .4byte 0x0203AA00
_0803F3FC:
	ldr r0, [r4]
	bl sub_801A05C
_0803F402:
	add r4, sp, #4
	adds r0, r4, #0
	bl AiTryMoveToSpecificPosition
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	beq _0803F416
	movs r0, #0
	b _0803F42C
_0803F416:
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA10
	movs r0, #1
_0803F42C:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1

