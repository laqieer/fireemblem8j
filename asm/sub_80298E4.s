	.syntax unified
	.set ForceMenuItemPanel, 0x0801E2E0 + 1
	.set GetUnit, 0x08019108 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.section .text.sub_80298E4, "ax", %progbits
@ RepairSelectOnSelect @ JP 0x080298E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RepairSelectOnSelect
	.thumb_func
RepairSelectOnSelect:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	bl ResetTextFont
	ldr r5, _0802993C @ =0x0203A954
	ldrb r0, [r4, #2]
	strb r0, [r5, #0xd]
	ldr r0, _08029940 @ =0x085C5544
	bl StartOrphanMenu
	adds r4, r0, #0
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x10
	movs r3, #0xb
	bl ForceMenuItemPanel
	ldrb r0, [r5, #0xd]
	bl GetUnit
	bl sub_8018FCC
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb8
	movs r3, #0xc
	bl sub_8005544
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802993C: .4byte 0x0203A954
_08029940: .4byte 0x085C5544

