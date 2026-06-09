	.syntax unified
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set MakeNewItem, 0x080162E8 + 1
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_8031EC0, "ax", %progbits
@ sub_8031EC0 @ JP 0x08031EC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031EC0
	.thumb_func
sub_8031EC0:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _08031F00 @ =0x080DCC90
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldrh r1, [r4]
	adds r0, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08031F0A
	movs r1, #0
	ldr r2, [r5, #4]
_08031EE4:
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031F04
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4]
	b _08031F0A
	.align 2, 0
_08031F00: .4byte 0x080DCC90
_08031F04:
	adds r1, #1
	cmp r1, #7
	ble _08031EE4
_08031F0A:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

