	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80088FC, 0x080088FC + 1
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B8ED8, "ax", %progbits
@ sub_80B8ED8 @ JP 0x080B8ED8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8ED8
	.thumb_func
sub_80B8ED8:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80088FC
	cmp r0, #1
	beq _080B8EF6
	cmp r0, #1
	ble _080B8EEC
	cmp r0, #2
	beq _080B8F00
_080B8EEC:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b _080B8F28
_080B8EF6:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080B8F28
_080B8F00:
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _080B8F20
	ldr r0, _080B8F1C @ =0x0000084C
	adds r1, r4, #0
	bl sub_80B8CF0
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080B8F28
	.align 2, 0
_080B8F1C: .4byte 0x0000084C
_080B8F20:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080B8F28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

