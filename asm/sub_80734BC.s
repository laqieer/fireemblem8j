	.syntax unified
	.section .text.sub_80734BC, "ax", %progbits
@ sub_80734BC @ JP 0x080734BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80734BC
	.thumb_func
sub_80734BC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x34]
	mov sl, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov sb, r1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r2, r2, #0x10
	lsls r0, r7, #1
	subs r0, #2
	adds r4, r4, r0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08073558
	subs r0, r1, r7
	lsls r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, r3
	lsls r0, r0, #0x10
	str r0, [sp, #4]
_080734FE:
	adds r1, r7, #0
	subs r2, #1
	mov ip, r2
	cmp r1, #0
	beq _0807353A
	movs r2, #1
	rsbs r2, r2, #0
	ldr r0, [sp, #0x30]
	lsls r3, r0, #0xc
_08073510:
	ldrh r0, [r5]
	ldr r6, [sp, #0x30]
	cmp r6, r2
	beq _0807351E
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0807351E:
	cmp sl, r2
	beq _08073528
	add r0, sl
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08073528:
	movs r6, #0x80
	lsls r6, r6, #3
	eors r0, r6
	strh r0, [r4]
	adds r5, #2
	subs r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08073510
_0807353A:
	ldr r0, _08073568 @ =0xFFFF0000
	asrs r1, r0, #0x10
	cmp sb, r1
	beq _08073548
	ldr r2, [sp]
	lsrs r0, r2, #0xf
	adds r5, r5, r0
_08073548:
	cmp r8, r1
	beq _08073552
	ldr r6, [sp, #4]
	lsrs r0, r6, #0xf
	adds r4, r4, r0
_08073552:
	mov r2, ip
	cmp r2, #0
	bne _080734FE
_08073558:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073568: .4byte 0xFFFF0000

