	.syntax unified
	.set ForceMenuItemPanel, 0x0801E2E0 + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_80234C0, 0x080234C0 + 1
	.set sub_80234FC, 0x080234FC + 1
	.section .text.sub_8023514, "ax", %progbits
@ sub_8023514 @ JP 0x08023514 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023514
	.thumb_func
sub_8023514:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_80234FC
	adds r0, r4, #0
	bl sub_80234C0
	ldr r0, _08023564 @ =0x085C5664
	bl StartOrphanMenu
	adds r5, r0, #0
	ldr r4, _08023568 @ =0x03004DF0
	ldr r0, [r4]
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
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023564: .4byte 0x085C5664
_08023568: .4byte 0x03004DF0

