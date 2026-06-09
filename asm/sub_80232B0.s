	.syntax unified
	.set ForceMenuItemPanel, 0x0801E2E0 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.section .text.sub_80232B0, "ax", %progbits
@ sub_80232B0 @ JP 0x080232B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80232B0
	.thumb_func
sub_80232B0:
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	bne _0802330C
	bl sub_80034D0
	movs r0, #4
	bl sub_8003508
	bl ResetTextFont
	ldr r0, _08023304 @ =0x085C5664
	bl StartOrphanMenu
	adds r5, r0, #0
	ldr r4, _08023308 @ =0x03004DF0
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
	b _0802330E
	.align 2, 0
_08023304: .4byte 0x085C5664
_08023308: .4byte 0x03004DF0
_0802330C:
	movs r0, #0
_0802330E:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

