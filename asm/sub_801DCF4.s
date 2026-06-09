	.syntax unified
	.set ForceMenuItemPanel, 0x0801E2E0 + 1
	.set GetConvoyItemCount, 0x080314BC + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set UnitAddItem, 0x080176F0 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8008908, 0x08008908 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_8031568, 0x08031568 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_801DCF4, "ax", %progbits
@ sub_801DCF4 @ JP 0x0801DCF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DCF4
	.thumb_func
sub_801DCF4:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl UnitAddItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801DD84
	ldr r0, _0801DD5C @ =0x03004DF0
	str r4, [r0]
	ldr r0, _0801DD60 @ =0x0202BCAC
	strh r5, [r0, #0x2c]
	adds r0, r4, #0
	bl sub_8018FCC
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #4
	bl sub_8005544
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xf
	movs r3, #0xa
	bl ForceMenuItemPanel
	bl sub_8031568
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801DD68
	bl GetConvoyItemCount
	cmp r0, #0x63
	bgt _0801DD68
	ldr r0, _0801DD64 @ =0x000007E5
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_8035610
	b _0801DD76
	.align 2, 0
_0801DD5C: .4byte 0x03004DF0
_0801DD60: .4byte 0x0202BCAC
_0801DD64: .4byte 0x000007E5
_0801DD68:
	ldr r0, _0801DD8C @ =0x000007E4
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_8035610
_0801DD76:
	movs r0, #2
	bl sub_8008908
	ldr r0, _0801DD90 @ =0x085C32B8
	adds r1, r6, #0
	bl Proc_StartBlocking
_0801DD84:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DD8C: .4byte 0x000007E4
_0801DD90: .4byte 0x085C32B8

