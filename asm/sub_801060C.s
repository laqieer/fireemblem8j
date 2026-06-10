	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_801060C, "ax", %progbits
@ sub_801060C @ JP 0x0801060C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801060C
	.thumb_func
sub_801060C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, [r0, #0x38]
	ldrb r0, [r1]
	movs r7, #0xf
	ands r7, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	movs r2, #4
	ldrsh r3, [r1, r2]
	mov r8, r3
	mov r6, r8
	movs r3, #6
	ldrsh r5, [r1, r3]
	bl sub_800BF3C
	adds r4, r0, #0
	cmp r4, #0
	beq _0801068E
	cmp r7, #0
	beq _0801063E
	cmp r7, #1
	beq _08010654
	b _08010682
_0801063E:
	cmp r6, #0
	bne _0801067A
	ldr r2, _08010650 @ =0x088582BC
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r6, [r0, #5]
	b _0801067A
	.align 2, 0
_08010650: .4byte 0x088582BC
_08010654:
	ldr r0, [r4, #4]
	ldrb r6, [r0, #4]
	ldr r2, _0801069C @ =0x088582BC
	mov r1, r8
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r5, [r0, #5]
	adds r0, r5, #0
	bl GetClassData
	str r0, [r4, #4]
	mov r0, r8
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0801068E
_0801067A:
	adds r0, r6, #0
	bl GetClassData
	str r0, [r4, #4]
_08010682:
	bl RefreshEntityBmMaps
	bl sub_8027144
	bl sub_8019914
_0801068E:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801069C: .4byte 0x088582BC

