	.syntax unified
	.set CheckEkrDragonSkipTransfer, 0x080727E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80195E4, 0x080195E4 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_8073B80, 0x08073B80 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_807267C, "ax", %progbits
@ sub_807267C @ JP 0x0807267C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807267C
	.thumb_func
sub_807267C:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0807269A
	ldr r0, _080726E0 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80195E4
	bl sub_8019914
_0807269A:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #8
	str r4, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #4
	bl sub_8012E84
	adds r6, r0, #0
	bl sub_8073B80
	ldr r0, [r5, #0x5c]
	bl CheckEkrDragonSkipTransfer
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08072726
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	str r4, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	adds r6, r0, #0
	ldr r0, _080726E4 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080726E8
	cmp r0, #1
	beq _0807270C
	b _08072726
	.align 2, 0
_080726E0: .4byte 0x0202BCEC
_080726E4: .4byte 0x0203E11C
_080726E8:
	ldr r0, _08072704 @ =0x02020068
	ldr r4, _08072708 @ =0x02022928
	adds r1, r4, #0
	movs r2, #0x10
	bl sub_80D636C
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r6, #0
	bl sub_80737A4
	b _08072726
	.align 2, 0
_08072704: .4byte 0x02020068
_08072708: .4byte 0x02022928
_0807270C:
	ldr r0, _08072748 @ =0x02020068
	ldr r4, _0807274C @ =0x02022928
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r6, #0
	bl sub_80737A4
_08072726:
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0807273E
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_8002DE4
_0807273E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072748: .4byte 0x02020068
_0807274C: .4byte 0x02022928

