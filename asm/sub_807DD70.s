	.syntax unified
	.set PutNumberTilesRightAligned, 0x08013220 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_807DD70, "ax", %progbits
@ sub_807DD70 @ JP 0x0807DD70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807DD70
	.thumb_func
sub_807DD70:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	adds r5, r1, #0
	mov sb, r2
	adds r7, r3, #0
	ldr r0, [sp, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	movs r6, #7
	movs r0, #0xb
	add r0, sp
	mov r8, r0
_0807DD94:
	mov r4, sp
	adds r4, r4, r6
	adds r4, #4
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0807DDCE
	subs r1, r6, #1
	subs r4, r7, #1
	cmp r1, #0
	blt _0807DDD6
	movs r2, #0x20
_0807DDBE:
	mov r0, sp
	adds r0, r0, r1
	adds r0, #4
	strb r2, [r0]
	subs r1, #1
	cmp r1, #0
	bge _0807DDBE
	b _0807DDD6
_0807DDCE:
	subs r6, #1
	subs r4, r7, #1
	cmp r6, #0
	bge _0807DD94
_0807DDD6:
	ldr r0, [sp, #0x34]
	str r0, [sp]
	mov r0, sl
	mov r1, r8
	mov r2, sb
	adds r3, r7, #0
	bl PutNumberTilesRightAligned
	adds r6, r4, #0
	cmp r6, #0
	ble _0807DE1C
	movs r0, #7
	subs r0, r0, r6
	add r0, sp
	adds r0, #4
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _0807DE1C
	mov r0, sp
	adds r0, #0xb
	subs r2, r0, r6
	lsls r0, r6, #1
	mov r3, sl
	subs r1, r3, r0
_0807DE06:
	mov r0, sp
	ldrh r0, [r0, #0xc]
	strh r0, [r1]
	adds r2, #1
	adds r1, #2
	subs r6, #1
	cmp r6, #0
	ble _0807DE1C
	ldrb r0, [r2]
	cmp r0, #0x20
	beq _0807DE06
_0807DE1C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

