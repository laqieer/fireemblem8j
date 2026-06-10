	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_804D57C, 0x0804D57C + 1
	.section .text.sub_8047FCC, "ax", %progbits
@ sub_8047FCC @ JP 0x08047FCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047FCC
	.thumb_func
sub_8047FCC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08048078 @ =0x0203DA20
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _08047FE8
	adds r0, r5, #0
	bl sub_8002DE4
_08047FE8:
	ldrb r2, [r4]
	ldr r0, [r5, #0x54]
	cmp r0, #0x10
	bgt _08048056
	movs r0, #4
	mov r8, r0
	lsls r2, r2, #1
	ldr r1, _0804807C @ =0x080DEEB0
	movs r4, #0x10
	mov sb, r4
	adds r0, r2, #1
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r5, #0
	adds r6, #0x3c
	adds r7, r1, #0
	adds r7, #8
	adds r2, r2, r1
	mov sl, r2
_0804800E:
	ldrb r1, [r7]
	ldr r3, [r5, #0x54]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r2, [r4]
	bl sub_8012E84
	adds r4, r0, #0
	ldrb r1, [r7, #1]
	ldr r0, [sp, #4]
	ldrb r2, [r0]
	ldr r3, [r5, #0x54]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	bl sub_8012E84
	adds r2, r0, #0
	ldr r0, [r6]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_804D57C
	subs r6, #4
	subs r7, #2
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	mov r0, r8
	cmp r0, #0
	bge _0804800E
_08048056:
	ldr r0, [r5, #0x54]
	cmp r0, #0x20
	ble _08048062
	adds r0, r5, #0
	bl sub_8002DE4
_08048062:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048078: .4byte 0x0203DA20
_0804807C: .4byte 0x080DEEB0

