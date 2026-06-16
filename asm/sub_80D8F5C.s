	.syntax unified
	.set __swsetup, 0x080D7BEC + 1
	.set memchr, 0x080D9858 + 1
	.set memmove, 0x080D98D8 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.set sub_80D8AEC, 0x080D8AEC + 1
	.section .text.sub_80D8F5C, "ax", %progbits
@ __sfvwrite @ JP 0x080D8F5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __sfvwrite
	.thumb_func
__sfvwrite:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov sl, r1
	ldr r6, [r1, #8]
	cmp r6, #0
	bne _080D8F74
	b _080D916A
_080D8F74:
	movs r0, #8
	ldrh r1, [r5, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080D8F84
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _080D8F90
_080D8F84:
	adds r0, r5, #0
	bl __swsetup
	cmp r0, #0
	beq _080D8F90
	b _080D9176
_080D8F90:
	mov r2, sl
	ldr r2, [r2]
	mov r8, r2
	movs r6, #0
	ldrh r1, [r5, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080D8FE4
_080D8FA2:
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	cmp r6, #0
	bne _080D8FB8
_080D8FAA:
	mov r1, r8
	ldr r7, [r1]
	ldr r6, [r1, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _080D8FAA
_080D8FB8:
	adds r2, r6, #0
	movs r1, #0x80
	lsls r1, r1, #3
	cmp r6, r1
	bls _080D8FC4
	adds r2, r1, #0
_080D8FC4:
	adds r1, r7, #0
	bl sub_80D65C8
	adds r4, r0, #0
	cmp r4, #0
	bgt _080D8FD2
	b _080D916E
_080D8FD2:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r1, sl
	ldr r0, [r1, #8]
	subs r0, r0, r4
	str r0, [r1, #8]
	cmp r0, #0
	bne _080D8FA2
	b _080D916A
_080D8FE4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080D909E
_080D8FEC:
	ldrh r1, [r5, #0xc]
	ldr r0, [r5, #8]
	ldr r3, [r5]
	cmp r6, #0
	bne _080D9004
_080D8FF6:
	mov r2, r8
	ldr r7, [r2]
	ldr r6, [r2, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _080D8FF6
_080D9004:
	adds r4, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080D9032
	cmp r6, r4
	bhs _080D9018
	adds r4, r6, #0
_080D9018:
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl memmove
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r4, r6, #0
	b _080D908C
_080D9032:
	ldr r0, [r5, #0x10]
	cmp r3, r0
	bls _080D905A
	cmp r6, r4
	bls _080D905A
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl memmove
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r0, r5, #0
	bl sub_80D8AEC
	cmp r0, #0
	beq _080D9058
	b _080D916E
_080D9058:
	b _080D908C
_080D905A:
	ldr r4, [r5, #0x14]
	cmp r6, r4
	blo _080D9074
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_80D65C8
	adds r4, r0, #0
	cmp r4, #0
	ble _080D916E
	b _080D908C
_080D9074:
	adds r4, r6, #0
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl memmove
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
_080D908C:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r1, sl
	ldr r0, [r1, #8]
	subs r0, r0, r4
	str r0, [r1, #8]
	cmp r0, #0
	bne _080D8FEC
	b _080D916A
_080D909E:
	movs r2, #0
	str r2, [sp]
_080D90A2:
	cmp r6, #0
	bne _080D90B8
	movs r0, #0
	str r0, [sp]
_080D90AA:
	mov r1, r8
	ldr r7, [r1]
	ldr r6, [r1, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _080D90AA
_080D90B8:
	ldr r0, [sp]
	cmp r0, #0
	bne _080D90DC
	adds r0, r7, #0
	movs r1, #0xa
	adds r2, r6, #0
	bl memchr
	adds r1, r0, #0
	cmp r1, #0
	beq _080D90D4
	subs r0, r7, #1
	subs r1, r1, r0
	b _080D90D6
_080D90D4:
	adds r1, r6, #1
_080D90D6:
	mov sb, r1
	movs r2, #1
	str r2, [sp]
_080D90DC:
	mov r2, sb
	cmp sb, r6
	bls _080D90E4
	adds r2, r6, #0
_080D90E4:
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x14]
	adds r4, r0, r1
	ldr r0, [r5, #0x10]
	ldr r3, [r5]
	cmp r3, r0
	bls _080D9112
	cmp r2, r4
	ble _080D9112
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl memmove
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r0, r5, #0
	bl sub_80D8AEC
	cmp r0, #0
	bne _080D916E
	b _080D9142
_080D9112:
	adds r4, r1, #0
	cmp r2, r4
	blt _080D912C
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_80D65C8
	adds r4, r0, #0
	cmp r4, #0
	ble _080D916E
	b _080D9142
_080D912C:
	adds r4, r2, #0
	adds r0, r3, #0
	adds r1, r7, #0
	bl memmove
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
_080D9142:
	mov r0, sb
	subs r0, r0, r4
	mov sb, r0
	cmp r0, #0
	bne _080D915A
	adds r0, r5, #0
	bl sub_80D8AEC
	cmp r0, #0
	bne _080D916E
	movs r1, #0
	str r1, [sp]
_080D915A:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r2, sl
	ldr r0, [r2, #8]
	subs r0, r0, r4
	str r0, [r2, #8]
	cmp r0, #0
	bne _080D90A2
_080D916A:
	movs r0, #0
	b _080D917A
_080D916E:
	movs r0, #0x40
	ldrh r1, [r5, #0xc]
	orrs r0, r1
	strh r0, [r5, #0xc]
_080D9176:
	movs r0, #1
	rsbs r0, r0, #0
_080D917A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

