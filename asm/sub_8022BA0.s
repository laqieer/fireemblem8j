	.syntax unified
	.set Eventinfo_CondFalse_0, 0x080855FC + 1
	.set ForceMenuItemPanel, 0x0801E2E0 + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.section .text.sub_8022BA0, "ax", %progbits
@ sub_8022BA0 @ JP 0x08022BA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022BA0
	.thumb_func
sub_8022BA0:
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08022BF0 @ =0x085C56AC
	bl StartOrphanMenu
	adds r4, r0, #0
	ldr r5, _08022BF4 @ =0x03004DF0
	ldr r1, [r5]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _08022BD6
	adds r0, r1, #0
	bl sub_8018FCC
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl sub_8005544
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
_08022BD6:
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	bl Eventinfo_CondFalse_0
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022BF0: .4byte 0x085C56AC
_08022BF4: .4byte 0x03004DF0

