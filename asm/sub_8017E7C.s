	.syntax unified
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802B970, 0x0802B970 + 1
	.set sub_802C134, 0x0802C134 + 1
	.section .text.sub_8017E7C, "ax", %progbits
@ sub_8017E7C @ JP 0x08017E7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8017E7C
	.thumb_func
sub_8017E7C:
	push {r4, r5, r6, lr}
	sub sp, #0x80
	adds r4, r0, #0
	movs r0, #8
	ldrsb r0, [r4, r0]
	ldr r1, [r4]
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r1, r0, r1
	cmp r1, #0
	beq _08017ECE
	ldrb r0, [r4, #8]
	subs r0, r0, r1
	strb r0, [r4, #8]
	cmp r1, #0
	ble _08017ECE
	mov r6, sp
	lsls r0, r1, #0x10
	ldr r1, _08017ED8 @ =0xFFFF0000
	adds r5, r0, r1
_08017EA6:
	mov r0, sp
	adds r1, r4, #0
	bl sub_802A4F0
	ldrb r0, [r6, #9]
	adds r0, #0x64
	strb r0, [r6, #9]
	mov r0, sp
	bl sub_802B970
	adds r0, r4, #0
	mov r1, sp
	bl sub_802C134
	adds r0, r5, #0
	ldr r1, _08017ED8 @ =0xFFFF0000
	adds r5, r5, r1
	asrs r1, r0, #0x10
	cmp r1, #0
	bgt _08017EA6
_08017ECE:
	add sp, #0x80
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08017ED8: .4byte 0xFFFF0000

