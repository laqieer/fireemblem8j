	.syntax unified
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.section .text.sub_80236B8, "ax", %progbits
@ sub_80236B8 @ JP 0x080236B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80236B8
	.thumb_func
sub_80236B8:
	push {r4, r5, lr}
	ldr r5, _080236DC @ =0x03004DF0
	ldr r1, [r5]
	ldr r0, _080236E0 @ =0x0203A954
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080236E4
	movs r0, #3
	b _080236F8
	.align 2, 0
_080236DC: .4byte 0x03004DF0
_080236E0: .4byte 0x0203A954
_080236E4:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080236F6
	movs r1, #1
_080236F6:
	adds r0, r1, #0
_080236F8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

