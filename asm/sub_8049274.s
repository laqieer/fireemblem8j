	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80490C8, 0x080490C8 + 1
	.section .text.sub_8049274, "ax", %progbits
@ sub_8049274 @ JP 0x08049274 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049274
	.thumb_func
sub_8049274:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	movs r7, #0
_08049284:
	ldr r0, [r5, #0x44]
	cmp r8, r0
	beq _080492B2
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r2, #0xa0
	lsls r2, r2, #1
	bl sub_8012E84
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r4, [r0, r3]
	b _080492D8
_080492B2:
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0x3e
	ldrsh r2, [r5, r3]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	bl sub_8012E84
	adds r4, r0, #0
_080492D8:
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r4, #0
	ldr r3, _08049348 @ =0x085D3FA0
	bl PutSprite
	adds r1, r6, #0
	adds r1, #0x28
	adds r2, r4, #0
	adds r2, #8
	mov r3, r8
	lsls r0, r3, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _0804934C @ =0x085D3F74
	bl PutSprite
	adds r7, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _08049284
	ldr r1, _08049350 @ =0x02000C04
	ldr r0, [r5, #0x44]
	lsls r0, r0, #2
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_80490C8
	ldr r0, [r5, #0x50]
	cmp r0, #2
	bne _0804933A
	movs r0, #0
	str r0, [r5, #0x54]
	adds r0, r5, #0
	bl sub_8002DE4
_0804933A:
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	bgt _08049354
	adds r0, #1
	str r0, [r5, #0x54]
	b _08049358
	.align 2, 0
_08049348: .4byte 0x085D3FA0
_0804934C: .4byte 0x085D3F74
_08049350: .4byte 0x02000C04
_08049354:
	movs r0, #0
	str r0, [r5, #0x50]
_08049358:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

