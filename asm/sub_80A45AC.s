	.syntax unified
	.set AddPartyGoldAmount, 0x08024DD0 + 1
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80088FC, 0x080088FC + 1
	.set sub_80A2C94, 0x080A2C94 + 1
	.section .text.sub_80A45AC, "ax", %progbits
@ sub_80A45AC @ JP 0x080A45AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A45AC
	.thumb_func
sub_80A45AC:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_80088FC
	cmp r0, #1
	bne _080A45FA
	bl sub_80A2C94
	adds r4, r0, #0
	bl GetPartyGoldAmount
	cmp r0, r4
	blt _080A45F0
	cmp r4, #0
	ble _080A45E2
	rsbs r0, r4, #0
	bl AddPartyGoldAmount
	ldr r0, _080A45EC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A45E2
	movs r0, #0xb9
	bl m4aSongNumStart
_080A45E2:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _080A4602
	.align 2, 0
_080A45EC: .4byte 0x0202BCEC
_080A45F0:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080A4602
_080A45FA:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_080A4602:
	pop {r4, r5}
	pop {r0}
	bx r0

