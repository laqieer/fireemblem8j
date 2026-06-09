	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set UnitAddItem, 0x080176F0 + 1
	.set sub_8031568, 0x08031568 + 1
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.set sub_80B9FC4, 0x080B9FC4 + 1
	.section .text.sub_80B91D4, "ax", %progbits
@ sub_80B91D4 @ JP 0x080B91D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B91D4
	.thumb_func
sub_80B91D4:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5b
	ldrb r0, [r0]
	cmp r0, #4
	bls _080B9210
	bl sub_8031568
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B91F8
	ldr r0, _080B91F4 @ =0x0000085E
	adds r1, r4, #0
	bl sub_80B8CF0
	b _080B9232
	.align 2, 0
_080B91F4: .4byte 0x0000085E
_080B91F8:
	ldr r0, _080B920C @ =0x00000861
	adds r1, r4, #0
	bl sub_80B8CF0
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	b _080B9232
	.align 2, 0
_080B920C: .4byte 0x00000861
_080B9210:
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	lsls r2, r2, #1
	subs r1, #0x2c
	adds r1, r1, r2
	ldrh r1, [r1]
	bl UnitAddItem
	adds r0, r4, #0
	bl sub_80B9FC4
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080B9232:
	pop {r4}
	pop {r0}
	bx r0

