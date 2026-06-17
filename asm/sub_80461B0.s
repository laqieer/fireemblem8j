	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set StoreRNState, 0x08000C24 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8042678, 0x08042678 + 1
	.set sub_8043084, 0x08043084 + 1
	.section .text.SioBat_DecideFirstMover, "ax", %progbits
@ SioBat_DecideFirstMover @ JP 0x080461B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioBat_DecideFirstMover
	.thumb_func
SioBat_DecideFirstMover:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _08046244 @ =0x000006D4
	movs r1, #1
	bl sub_8043084
	ldr r0, _08046248 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08046230
	bl sub_8000CD8
	ldr r4, _0804624C @ =0x0203DA20
	adds r5, r4, #0
	adds r5, #0xa0
	ldrb r1, [r5]
	bl __umodsi3
	adds r6, r7, #0
	adds r6, #0x3b
	strb r0, [r6]
	bl AdvanceGetLCGRNValue
	ldrb r2, [r5]
	movs r1, #3
	ands r1, r0
	adds r1, #4
	adds r3, r2, #0
	muls r3, r1, r3
	ldrb r0, [r6]
	adds r3, r3, r0
	adds r0, r7, #0
	adds r0, #0x39
	strb r3, [r0]
	mov r2, sp
	adds r4, #0xec
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	strb r0, [r2, #1]
	mov r0, sp
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #2]
	mov r1, sp
	ldrb r0, [r6]
	strb r0, [r1, #3]
	mov r0, sp
	strb r3, [r0, #4]
	adds r0, #6
	bl StoreRNState
	mov r0, sp
	movs r1, #0x10
	bl sub_8042678
	str r0, [r7, #0x34]
_08046230:
	adds r0, r7, #0
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046244: .4byte 0x000006D4
_08046248: .4byte 0x085D31E8
_0804624C: .4byte 0x0203DA20

