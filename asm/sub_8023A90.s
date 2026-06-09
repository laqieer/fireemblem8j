	.syntax unified
	.set ForceMenuItemPanel, 0x0801E2E0 + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_80502F4, 0x080502F4 + 1
	.section .text.sub_8023A90, "ax", %progbits
@ sub_8023A90 @ JP 0x08023A90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023A90
	.thumb_func
sub_8023A90:
	push {r4, r5, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _08023AE8
	bl sub_80034D0
	movs r0, #4
	bl sub_8003508
	ldr r0, _08023AE0 @ =0x085C5640
	bl StartOrphanMenu
	adds r5, r0, #0
	ldr r4, _08023AE4 @ =0x03004DF0
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
	b _08023AF2
	.align 2, 0
_08023AE0: .4byte 0x085C5640
_08023AE4: .4byte 0x03004DF0
_08023AE8:
	ldr r1, _08023AFC @ =0x000007CF
	adds r0, r2, #0
	bl sub_80502F4
	movs r0, #8
_08023AF2:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023AFC: .4byte 0x000007CF

