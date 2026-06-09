	.syntax unified
	.set sub_80A776C, 0x080A776C + 1
	.set sub_80A9C30, 0x080A9C30 + 1
	.set sub_80A9C44, 0x080A9C44 + 1
	.section .text.sub_80A9560, "ax", %progbits
@ sub_80A9560 @ JP 0x080A9560 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9560
	.thumb_func
sub_80A9560:
	push {r4, r5, r6, lr}
	sub sp, #0xb0
	adds r6, r0, #0
	mov r0, sp
	bl sub_80A776C
	movs r4, #0
	add r1, sp, #0x14
_080A9570:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _080A959C
	adds r4, #1
	cmp r4, #0xb
	ble _080A9570
	movs r4, #0
	add r5, sp, #0x64
_080A9582:
	adds r0, r4, #0
	bl sub_80A9C30
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A95A0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A9C44
	ldrb r0, [r5, #0x18]
	cmp r0, r6
	bne _080A95A0
_080A959C:
	movs r0, #0
	b _080A95A8
_080A95A0:
	adds r4, #1
	cmp r4, #2
	ble _080A9582
	movs r0, #1
_080A95A8:
	add sp, #0xb0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

