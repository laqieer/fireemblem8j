	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.section .text.sub_80445A8, "ax", %progbits
@ sub_80445A8 @ JP 0x080445A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80445A8
	.thumb_func
sub_80445A8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r5, #0
	adds r6, r0, #0
	adds r6, #0x31
	ldr r1, _08044684 @ =0x0203DB10
	mov r8, r1
	adds r0, #0x30
	mov sl, r0
_080445C2:
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	bl sub_8003CF8
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	movs r1, #0
	bl sub_8003D90
	movs r7, #0
	lsls r0, r5, #4
	mov sb, r0
	lsls r1, r5, #1
	str r1, [sp, #4]
	adds r0, r5, #1
	str r0, [sp]
_080445F2:
	mov r1, sb
	subs r0, r1, r5
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _08044688 @ =0x080DEC7A
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #6
	ldr r1, _0804468C @ =0x080DD41C
	adds r4, r0, r1
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804464C
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r4, #0x30]
	bl sub_8003D84
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl sub_8003F28
_0804464C:
	adds r7, #1
	cmp r7, #0xe
	ble _080445F2
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	ldr r1, [sp, #4]
	adds r1, #9
	lsls r1, r1, #6
	ldr r2, _08044690 @ =0x020234A8
	adds r1, r1, r2
	bl PutText
	ldr r5, [sp]
	cmp r5, #4
	ble _080445C2
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044684: .4byte 0x0203DB10
_08044688: .4byte 0x080DEC7A
_0804468C: .4byte 0x080DD41C
_08044690: .4byte 0x020234A8

