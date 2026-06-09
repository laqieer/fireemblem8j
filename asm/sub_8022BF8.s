	.syntax unified
	.set GetUnitWeaponReachBits, 0x08016F90 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B13C, 0x0801B13C + 1
	.set sub_801B674, 0x0801B674 + 1
	.set sub_801D6FC, 0x0801D6FC + 1
	.section .text.sub_8022BF8, "ax", %progbits
@ sub_8022BF8 @ JP 0x08022BF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022BF8
	.thumb_func
sub_8022BF8:
	push {r4, r5, lr}
	ldr r0, _08022C34 @ =0x0202E4DC
	ldr r0, [r0]
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl sub_80194BC
	ldr r0, _08022C38 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r4, _08022C3C @ =0x03004DF0
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08022C40
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #1
	movs r3, #0xa
	bl sub_801B674
	b _08022C50
	.align 2, 0
_08022C34: .4byte 0x0202E4DC
_08022C38: .4byte 0x0202E4E0
_08022C3C: .4byte 0x03004DF0
_08022C40:
	adds r0, r2, #0
	adds r1, r5, #0
	bl GetUnitWeaponReachBits
	adds r1, r0, #0
	ldr r0, [r4]
	bl sub_801B13C
_08022C50:
	movs r0, #3
	bl sub_801D6FC
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

