	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set StartArmoryScreen, 0x080B8D68 + 1
	.set StartVendorScreen, 0x080B8D88 + 1
	.set sub_80851FC, 0x080851FC + 1
	.section .text.sub_8033DDC, "ax", %progbits
@ sub_8033DDC @ JP 0x08033DDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033DDC
	.thumb_func
sub_8033DDC:
	push {r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, _08033E14 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r1, sp
	ldr r2, _08033E18 @ =0x0202BCAC
	ldrh r0, [r2, #0x14]
	strb r0, [r1, #0x18]
	ldrh r0, [r2, #0x16]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_80851FC
	cmp r0, #0
	beq _08033E32
	ldr r0, [sp, #0xc]
	cmp r0, #0x16
	beq _08033E1C
	cmp r0, #0x17
	beq _08033E28
	b _08033E32
	.align 2, 0
_08033E14: .4byte 0x0202BCEC
_08033E18: .4byte 0x0202BCAC
_08033E1C:
	ldr r1, [sp, #4]
	movs r0, #0
	adds r2, r4, #0
	bl StartArmoryScreen
	b _08033E32
_08033E28:
	ldr r1, [sp, #4]
	movs r0, #0
	adds r2, r4, #0
	bl StartVendorScreen
_08033E32:
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

