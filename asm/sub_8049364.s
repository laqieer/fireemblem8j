	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set PutSprite, 0x080052F0 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80490C8, 0x080490C8 + 1
	.section .text.sub_8049364, "ax", %progbits
@ sub_8049364 @ JP 0x08049364 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049364
	.thumb_func
sub_8049364:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	movs r7, #0
_08049374:
	ldr r0, [r5, #0x44]
	cmp r8, r0
	beq _080493A0
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r2, [r0, r1]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0xf0
	bl sub_8012E84
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r4, [r0, r3]
	b _080493C6
_080493A0:
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r6, [r0, r1]
	movs r3, #0x3e
	ldrsh r1, [r5, r3]
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	bl sub_8012E84
	adds r4, r0, #0
_080493C6:
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
	ldr r3, _08049424 @ =0x085D3FA0
	bl PutSprite
	adds r1, r6, #0
	adds r1, #0x28
	adds r2, r4, #0
	adds r2, #8
	mov r3, r8
	lsls r0, r3, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _08049428 @ =0x085D3F74
	bl PutSprite
	adds r7, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _08049374
	ldr r0, _0804942C @ =0x02000C04
	ldr r1, [r5, #0x44]
	lsls r1, r1, #2
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_80490C8
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	bgt _08049430
	adds r0, #1
	str r0, [r5, #0x54]
	b _0804943E
	.align 2, 0
_08049424: .4byte 0x085D3FA0
_08049428: .4byte 0x085D3F74
_0804942C: .4byte 0x02000C04
_08049430:
	movs r0, #0
	str r0, [r5, #0x54]
	str r0, [r5, #0x50]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
_0804943E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

