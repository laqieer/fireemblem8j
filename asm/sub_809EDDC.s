	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_809EDDC, "ax", %progbits
@ sub_809EDDC @ JP 0x0809EDDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EDDC
	.thumb_func
sub_809EDDC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8a
	beq _0809EE1C
	cmp r0, #0x8a
	bgt _0809EE06
	cmp r0, #0x64
	blt _0809EE44
	cmp r0, #0x68
	ble _0809EE1C
	cmp r0, #0x88
	beq _0809EE1C
	b _0809EE44
_0809EE06:
	cmp r0, #0xb7
	beq _0809EE3C
	cmp r0, #0xb7
	bgt _0809EE18
	cmp r0, #0x99
	bgt _0809EE44
	cmp r0, #0x97
	blt _0809EE44
	b _0809EE1C
_0809EE18:
	cmp r0, #0xc1
	bne _0809EE44
_0809EE1C:
	ldr r0, _0809EE38 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809EE2E
	movs r0, #0x6a
	bl m4aSongNumStart
_0809EE2E:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _0809EE44
	.align 2, 0
_0809EE38: .4byte 0x0202BCEC
_0809EE3C:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_0809EE44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

