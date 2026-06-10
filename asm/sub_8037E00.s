	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.set sub_8037F0C, 0x08037F0C + 1
	.section .text.sub_8037E00, "ax", %progbits
@ sub_8037E00 @ JP 0x08037E00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037E00
	.thumb_func
sub_8037E00:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037EE0 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08037ED8
	movs r0, #0x67
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037E24
	ldr r1, _08037EE4 @ =0x08926218
	adds r0, r4, #0
	bl sub_8037F0C
_08037E24:
	movs r0, #0x68
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037E38
	ldr r1, _08037EE8 @ =0x08926240
	adds r0, r4, #0
	bl sub_8037F0C
_08037E38:
	movs r0, #0x69
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037E4C
	ldr r1, _08037EEC @ =0x08926268
	adds r0, r4, #0
	bl sub_8037F0C
_08037E4C:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037E60
	ldr r1, _08037EF0 @ =0x08926290
	adds r0, r4, #0
	bl sub_8037F0C
_08037E60:
	movs r0, #0x6b
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037E74
	ldr r1, _08037EF4 @ =0x089262B8
	adds r0, r4, #0
	bl sub_8037F0C
_08037E74:
	movs r0, #0x6c
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037E88
	ldr r1, _08037EF8 @ =0x089262E0
	adds r0, r4, #0
	bl sub_8037F0C
_08037E88:
	movs r0, #0x6d
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037E9C
	ldr r1, _08037EFC @ =0x08926308
	adds r0, r4, #0
	bl sub_8037F0C
_08037E9C:
	movs r0, #0x6e
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037EB0
	ldr r1, _08037F00 @ =0x08926330
	adds r0, r4, #0
	bl sub_8037F0C
_08037EB0:
	movs r0, #0x6f
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037EC4
	ldr r1, _08037F04 @ =0x08926358
	adds r0, r4, #0
	bl sub_8037F0C
_08037EC4:
	movs r0, #0x70
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037ED8
	ldr r1, _08037F08 @ =0x08926380
	adds r0, r4, #0
	bl sub_8037F0C
_08037ED8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037EE0: .4byte 0x0202BCEC
_08037EE4: .4byte 0x08926218
_08037EE8: .4byte 0x08926240
_08037EEC: .4byte 0x08926268
_08037EF0: .4byte 0x08926290
_08037EF4: .4byte 0x089262B8
_08037EF8: .4byte 0x089262E0
_08037EFC: .4byte 0x08926308
_08037F00: .4byte 0x08926330
_08037F04: .4byte 0x08926358
_08037F08: .4byte 0x08926380

