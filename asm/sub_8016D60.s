	.syntax unified
	.set sub_8018EC4, 0x08018EC4 + 1
	.section .text.sub_8016D60, "ax", %progbits
@ sub_8016D60 @ JP 0x08016D60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8016D60
	.thumb_func
sub_8016D60:
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r4, #0
	movs r0, #0xff
	ands r0, r2
	adds r1, r0, #0
	cmp r0, #0x4f
	bgt _08016D84
	cmp r0, #0x4e
	bge _08016D96
	cmp r0, #0x4c
	beq _08016D9A
	cmp r0, #0x4c
	bgt _08016D9E
	cmp r0, #0x4b
	beq _08016D96
	b _08016DA0
_08016D84:
	cmp r0, #0x6d
	beq _08016D9E
	cmp r0, #0x6d
	bgt _08016D92
	cmp r0, #0x6c
	beq _08016D96
	b _08016DA0
_08016D92:
	cmp r1, #0xa2
	bne _08016DA0
_08016D96:
	movs r4, #0xa
	b _08016DA0
_08016D9A:
	movs r4, #0x14
	b _08016DA0
_08016D9E:
	movs r4, #0x50
_08016DA0:
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016DD0 @ =0x0885E068
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016DC6
	adds r0, r3, #0
	bl sub_8018EC4
	adds r4, r4, r0
	cmp r4, #0x50
	ble _08016DC6
	movs r4, #0x50
_08016DC6:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08016DD0: .4byte 0x0885E068

