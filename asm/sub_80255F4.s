	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set CanUnitSupportNow, 0x080282A4 + 1
	.set GetUnitSupporterCount, 0x0802815C + 1
	.set InitTargets, 0x08050618 + 1
	.set sub_8028188, 0x08028188 + 1
	.section .text.sub_80255F4, "ax", %progbits
@ sub_80255F4 @ JP 0x080255F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80255F4
	.thumb_func
sub_80255F4:
	push {r4, r5, r6, r7, lr}
	ldr r4, _08025698 @ =0x02033F38
	str r0, [r4]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl InitTargets
	ldr r0, [r4]
	bl GetUnitSupporterCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _08025692
	adds r7, r4, #0
_08025618:
	ldr r0, [r7]
	adds r1, r5, #0
	bl sub_8028188
	adds r4, r0, #0
	cmp r4, #0
	beq _0802568C
	ldr r3, [r7]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08025638
	subs r1, r0, r2
_08025638:
	ldrb r3, [r3, #0x11]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _0802564A
	subs r0, r2, r3
_0802564A:
	adds r0, r1, r0
	cmp r0, #1
	bne _0802568C
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802568C
	ldr r0, [r4, #0xc]
	ldr r1, _0802569C @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _0802568C
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq _0802568C
	cmp r1, #2
	beq _0802568C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	adds r3, r5, #0
	bl AddTarget
_0802568C:
	adds r5, #1
	cmp r5, r6
	blt _08025618
_08025692:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025698: .4byte 0x02033F38
_0802569C: .4byte 0x0001002C

