	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_80BADE8, 0x080BADE8 + 1
	.section .text.sub_80BAB20, "ax", %progbits
@ sub_80BAB20 @ JP 0x080BAB20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BAB20
	.thumb_func
sub_80BAB20:
	push {lr}
	sub sp, #4
	ldr r1, _080BAB50 @ =0x081F5BEC
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_80BADE8
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080BAB38:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	blt _080BAB48
	adds r1, #1
	cmp r1, #3
	ble _080BAB38
_080BAB48:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080BAB50: .4byte 0x081F5BEC

