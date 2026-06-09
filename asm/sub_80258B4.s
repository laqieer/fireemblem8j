	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set GetUnit, 0x08019108 + 1
	.set InitTargets, 0x08050618 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_8019F28, 0x08019F28 + 1
	.set sub_8019F38, 0x08019F38 + 1
	.section .text.sub_80258B4, "ax", %progbits
@ sub_80258B4 @ JP 0x080258B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80258B4
	.thumb_func
sub_80258B4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	mov r7, r8
	b _0802597E
_080258C8:
	adds r0, r7, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _0802597E
	ldr r0, [r5]
	cmp r0, #0
	beq _0802597E
	ldr r0, [r5, #0xc]
	ldr r1, _08025994 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _0802597E
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, _08025998 @ =0x0202E4D8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r6, #0
	bl sub_8019F28
	cmp r0, #0
	beq _0802593E
	adds r0, r5, #0
	bl sub_8018E64
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8018EA4
	cmp r4, r0
	beq _0802593E
	adds r0, r6, #0
	bl sub_8019F28
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8018EA4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r3, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	bl AddTarget
_0802593E:
	adds r0, r6, #0
	bl sub_8019F38
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802597E
	adds r2, r5, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0802597E
	cmp r0, #0xd
	bne _0802596A
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0xb
	orrs r0, r1
	strb r0, [r2]
_0802596A:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #1
	rsbs r3, r3, #0
	bl AddTarget
_0802597E:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _080258C8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025994: .4byte 0x0001002C
_08025998: .4byte 0x0202E4D8

