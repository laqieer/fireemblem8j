	.syntax unified
	.set GetDirectionOfPathAfterIndex, 0x08032FE8 + 1
	.set GetDirectionOfPathBeforeIndex, 0x08032F80 + 1
	.set PutSprite, 0x080052F0 + 1
	.set sub_803305C, 0x0803305C + 1
	.section .text.sub_803309C, "ax", %progbits
@ DrawPathArrow @ JP 0x0803309C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawPathArrow
	.thumb_func
DrawPathArrow:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _08033148 @ =0x085C6080
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x2c
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0803313A
	adds r6, r0, #0
	cmp r6, #0
	blt _0803313A
	ldr r0, _0803314C @ =0x085C604C
	mov sb, r0
_080330C0:
	ldr r0, _08033148 @ =0x085C6080
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2d
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	mov r8, r0
	adds r1, #0x41
	adds r1, r1, r6
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r7, r0, #4
	mov r0, r8
	adds r1, r7, #0
	movs r2, #0x10
	movs r3, #0x10
	bl sub_803305C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033130
	lsls r5, r6, #0x18
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl GetDirectionOfPathBeforeIndex
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetDirectionOfPathAfterIndex
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x17
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r4, r4, r1
	add r4, sb
	ldrh r3, [r4]
	ldr r0, _08033150 @ =0x0202BCAC
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	mov r4, r8
	subs r1, r4, r1
	movs r4, #0xe
	ldrsh r2, [r0, r4]
	subs r2, r7, r2
	str r3, [sp]
	movs r0, #0xb
	ldr r3, _08033154 @ =0x085B8CE4
	bl PutSprite
_08033130:
	subs r0, r6, #1
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #0
	bge _080330C0
_0803313A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033148: .4byte 0x085C6080
_0803314C: .4byte 0x085C604C
_08033150: .4byte 0x0202BCAC
_08033154: .4byte 0x085B8CE4

