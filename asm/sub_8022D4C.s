	.syntax unified
	.set GetUnitWeaponReachBits, 0x08016F90 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B13C, 0x0801B13C + 1
	.set sub_801D6FC, 0x0801D6FC + 1
	.set sub_801E3A4, 0x0801E3A4 + 1
	.section .text.sub_8022D4C, "ax", %progbits
@ sub_8022D4C @ JP 0x08022D4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022D4C
	.thumb_func
sub_8022D4C:
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl sub_801E3A4
	ldr r0, _08022D94 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, _08022D98 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r4, _08022D9C @ =0x03004DF0
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl GetUnitWeaponReachBits
	adds r1, r0, #0
	ldr r0, [r4]
	bl sub_801B13C
	movs r0, #2
	bl sub_801D6FC
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022D94: .4byte 0x0202E4DC
_08022D98: .4byte 0x0202E4E0
_08022D9C: .4byte 0x03004DF0

