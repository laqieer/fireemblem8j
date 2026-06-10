	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.section .text.sub_8042C74, "ax", %progbits
@ sub_8042C74 @ JP 0x08042C74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042C74
	.thumb_func
sub_8042C74:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _08042C90 @ =0x0079FF86
	cmp r4, r0
	bls _08042C94
	movs r0, #1
	rsbs r0, r0, #0
	b _08042CE6
	.align 2, 0
_08042C90: .4byte 0x0079FF86
_08042C94:
	adds r0, r4, #0
	movs r1, #0x7a
	bl __udivsi3
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x7a
	bl __umodsi3
	adds r4, r0, #0
	cmp r4, #0
	beq _08042CB6
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08042CB6:
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08042CF0 @ =0x085D31EC
	ldr r1, [sp, #0x18]
	bl Proc_StartBlocking
	adds r3, r0, #0
	str r7, [r3, #0x30]
	adds r0, #0x34
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	str r0, [r3, #0x2c]
	movs r1, #0
	strh r5, [r3, #0x36]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r2, [r3, #0x38]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
_08042CE6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08042CF0: .4byte 0x085D31EC

