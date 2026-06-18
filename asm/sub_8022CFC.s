	.syntax unified
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set sub_80165F0, 0x080165F0 + 1
	.section .text.sub_8022CFC, "ax", %progbits
@ WeaponSelectMenu_Draw @ JP 0x08022CFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WeaponSelectMenu_Draw
	.thumb_func
WeaponSelectMenu_Draw:
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08022D44 @ =0x03004DF0
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08022D48 @ =0x02022CA8
	adds r3, r3, r1
	adds r1, r4, #0
	bl sub_80165F0
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022D44: .4byte 0x03004DF0
_08022D48: .4byte 0x02022CA8

