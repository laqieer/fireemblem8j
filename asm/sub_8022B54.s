	.syntax unified
	.set ForceMenuItemPanel, 0x0801E2E0 + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.section .text.sub_8022B54, "ax", %progbits
@ sub_8022B54 @ JP 0x08022B54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022B54
	.thumb_func
sub_8022B54:
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08022B98 @ =0x085C5688
	bl StartOrphanMenu
	adds r5, r0, #0
	ldr r4, _08022B9C @ =0x03004DF0
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
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022B98: .4byte 0x085C5688
_08022B9C: .4byte 0x03004DF0

