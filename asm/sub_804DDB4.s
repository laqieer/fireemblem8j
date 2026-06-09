	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.section .text.sub_804DDB4, "ax", %progbits
@ sub_804DDB4 @ JP 0x0804DDB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804DDB4
	.thumb_func
sub_804DDB4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r1, [r7, #0x30]
	str r1, [sp, #0xc]
	adds r1, #8
	mov sl, r1
	ldr r0, [r7, #0x38]
	asrs r2, r0, #3
	str r2, [sp, #0x10]
	movs r1, #7
	ands r0, r1
	movs r1, #8
	subs r0, r1, r0
	str r0, [sp, #0x14]
	movs r3, #0x3e
	ldrsh r1, [r7, r3]
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	movs r0, #0x3c
	adds r0, r0, r7
	mov ip, r0
	movs r1, #0x3d
	adds r1, r1, r7
	mov sb, r1
	ldrb r0, [r0]
	ldrb r2, [r1]
	cmp r0, r2
	bhi _0804DE04
	b _0804DF5C
_0804DE04:
	adds r5, r7, #0
	adds r5, #0x44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x45
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r7, #0
	adds r0, #0x40
	movs r3, #0x3e
	ldrsh r2, [r7, r3]
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r3, r5, #0
	str r0, [sp, #0x2c]
	cmp r2, r1
	bge _0804DE32
	ldrb r0, [r3]
	adds r0, #2
	strb r0, [r3]
_0804DE32:
	movs r0, #0x3e
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x2c]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _0804DE46
	ldrb r0, [r4]
	adds r0, #2
	strb r0, [r4]
_0804DE46:
	movs r6, #0
	mov r0, ip
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x18]
	add r1, sl
	str r1, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	lsls r2, r2, #3
	str r2, [sp, #0x24]
	ldr r3, [sp, #0xc]
	str r3, [sp, #0x20]
_0804DE5C:
	ldrb r0, [r5]
	cmp r0, #0x30
	bls _0804DE66
	movs r0, #0
	strb r0, [r5]
_0804DE66:
	lsls r4, r6, #2
	add r4, sp
	adds r4, #4
	ldrb r0, [r5]
	lsrs r0, r0, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4]
	adds r5, #1
	adds r6, #1
	cmp r6, #1
	ble _0804DE5C
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _0804DE9E
	mov r2, sl
	subs r2, #9
	ldr r3, _0804DF6C @ =0x085D4BDC
	ldr r0, [sp, #4]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
_0804DE9E:
	movs r2, #0x3e
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge _0804DEA8
	adds r0, #0xf
_0804DEA8:
	asrs r0, r0, #4
	mov r3, sb
	ldrb r3, [r3]
	adds r0, r0, r3
	ldr r1, [sp, #0x28]
	ldrb r1, [r1]
	cmp r0, r1
	bge _0804DECE
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	adds r2, #1
	ldr r3, _0804DF70 @ =0x085D4BD4
	ldr r0, [sp, #8]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
_0804DECE:
	movs r6, #0
	ldr r0, [r7, #0x34]
	cmp r6, r0
	bge _0804DEF2
	mov r4, sl
	movs r5, #1
_0804DEDA:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _0804DF74 @ =0x085D4BE4
	bl PutSprite
	adds r4, #8
	adds r6, #1
	ldr r0, [r7, #0x34]
	cmp r6, r0
	blt _0804DEDA
_0804DEF2:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ble _0804DF14
	ldr r4, [sp, #0x1c]
	movs r5, #0
	adds r6, r2, #0
_0804DEFE:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _0804DF74 @ =0x085D4BE4
	bl PutSprite
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _0804DEFE
_0804DF14:
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x24]
	adds r2, r3, r0
	ldr r1, [sp, #0x14]
	subs r2, r2, r1
	ldr r4, _0804DF74 @ =0x085D4BE4
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r1, r8
	adds r3, r4, #0
	bl PutSprite
	movs r5, #2
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	ldr r2, [sp, #0x20]
	adds r3, r4, #0
	bl PutSprite
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, r8
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	subs r2, #7
	str r5, [sp]
	movs r0, #2
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r7, #0x3e]
	ldr r2, [sp, #0x2c]
	strh r0, [r2]
_0804DF5C:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DF6C: .4byte 0x085D4BDC
_0804DF70: .4byte 0x085D4BD4
_0804DF74: .4byte 0x085D4BE4

